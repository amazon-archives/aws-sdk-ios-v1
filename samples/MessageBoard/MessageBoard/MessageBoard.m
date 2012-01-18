/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */


#import "MessageBoard.h"
#import "Constants.h"



// This singleton class provides all the functionality to manipulate the Amazon
// SNS Topic and Amazon SQS Queue used in this sample application.
@implementation MessageBoard


static MessageBoard *_instance = nil;

+(MessageBoard *)instance
{
    @synchronized([MessageBoard class])
    {
        if (!_instance) {
            [[self alloc] init];
        }

        return _instance;
    }

    return nil;
}

+(id)alloc
{
    @synchronized([MessageBoard class])
    {
        NSAssert(_instance == nil, @"Attempted to allocate a second instance of a singleton.");
        _instance = [super alloc];
        return _instance;
    }

    return nil;
}

-(id)init
{
    self = [super init];
    if (self != nil) {
        snsClient = [[AmazonSNSClient alloc] initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY];
        sqsClient = [[AmazonSQSClient alloc] initWithAccessKey:ACCESS_KEY_ID withSecretKey:SECRET_KEY];

        // Find the Topic for this App or create one.
        topicARN = [[self findTopicArn] retain];
        if (topicARN == nil) {
            topicARN = [[self createTopic] retain];
        }

        // Find the Queue for this App or create one.
        queueUrl = [[self findQueueUrl] retain];
        if (queueUrl == nil) {
            queueUrl = [[self createQueue] retain];

            // Allow time for the queue to be created.
            [NSThread sleepForTimeInterval:4.0];

            [self subscribeQueue];
        }
    }

    return self;
}

-(NSString *)createTopic
{
    @try {
        SNSCreateTopicRequest  *ctr      = [[[SNSCreateTopicRequest alloc] initWithName:TOPIC_NAME] autorelease];
        SNSCreateTopicResponse *response = [snsClient createTopic:ctr];

        // Adding the DisplayName attribute to the Topic allows for SMS notifications.
        SNSSetTopicAttributesRequest *st = [[[SNSSetTopicAttributesRequest alloc] initWithTopicArn:response.topicArn andAttributeName:@"DisplayName" andAttributeValue:TOPIC_NAME] autorelease];
        [snsClient setTopicAttributes:st];

        return response.topicArn;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
        return nil;
    }
}

-(void)subscribeEmail:(NSString *)emailAddress
{
    @try {
        SNSSubscribeRequest *sr = [[[SNSSubscribeRequest alloc] initWithTopicArn:topicARN andProtocol:@"email" andEndpoint:emailAddress] autorelease];
        [snsClient subscribe:sr];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

-(void)subscribeSms:(NSString *)smsNumber
{
    @try {
        SNSSubscribeRequest *sr = [[[SNSSubscribeRequest alloc] initWithTopicArn:topicARN andProtocol:@"sms" andEndpoint:smsNumber] autorelease];
        [snsClient subscribe:sr];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

-(void)subscribeQueue
{
    @try {
        NSString            *queueArn = [self getQueueArn:queueUrl];

        SNSSubscribeRequest *request = [[[SNSSubscribeRequest alloc] initWithTopicArn:topicARN andProtocol:@"sqs" andEndpoint:queueArn] autorelease];
        [snsClient subscribe:request];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

-(NSMutableArray *)listSubscribers
{
    @try {
        SNSListSubscriptionsByTopicRequest  *ls       = [[[SNSListSubscriptionsByTopicRequest alloc] initWithTopicArn:topicARN] autorelease];
        SNSListSubscriptionsByTopicResponse *response = [snsClient listSubscriptionsByTopic:ls];
        return response.subscriptions;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
        return [NSArray array];
    }
}

// Unscribe an endpoint from the topic.
-(void)removeSubscriber:(NSString *)subscriptionArn
{
    @try {
        SNSUnsubscribeRequest *unsubscribeRequest = [[[SNSUnsubscribeRequest alloc] initWithSubscriptionArn:subscriptionArn] autorelease];
        [snsClient unsubscribe:unsubscribeRequest];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

// Post a notification to the topic.
-(void)post:(NSString *)theMessage;
{
    @try {
        if ( [theMessage isEqualToString:@"wipe"]) {
            [self deleteQueue];
            [self deleteTopic];
        }
        else {
            SNSPublishRequest *pr = [[[SNSPublishRequest alloc] initWithTopicArn:topicARN andMessage:theMessage] autorelease];
            [snsClient publish:pr];
        }
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

-(void)deleteTopic
{
    @try {
        SNSDeleteTopicRequest *dtr = [[[SNSDeleteTopicRequest alloc] initWithTopicArn:topicARN] autorelease];
        [snsClient deleteTopic:dtr];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

-(void)deleteQueue
{
    @try {
        SQSDeleteQueueRequest *request = [[[SQSDeleteQueueRequest alloc] initWithQueueUrl:queueUrl] autorelease];
        [sqsClient deleteQueue:request];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

-(NSString *)createQueue
{
    @try {
        SQSCreateQueueRequest  *cqr      = [[[SQSCreateQueueRequest alloc] initWithQueueName:QUEUE_NAME] autorelease];
        SQSCreateQueueResponse *response = [sqsClient createQueue:cqr];

        NSString               *queueArn = [self getQueueArn:response.queueUrl];
        [self addPolicyToQueueForTopic:response.queueUrl queueArn:queueArn];

        return response.queueUrl;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
        return nil;
    }
}

-(NSMutableArray *)getMessagesFromQueue
{
    @try {
        SQSReceiveMessageRequest *rmr = [[[SQSReceiveMessageRequest alloc] initWithQueueUrl:queueUrl] autorelease];
        rmr.maxNumberOfMessages = [NSNumber numberWithInt:10];
        rmr.visibilityTimeout   = [NSNumber numberWithInt:30];

        SQSReceiveMessageResponse *response    = nil;
        NSMutableArray            *allMessages = [[[NSMutableArray alloc] init] autorelease];
        do {
            response = [sqsClient receiveMessage:rmr];
            [allMessages addObjectsFromArray:response.messages];
            [NSThread sleepForTimeInterval:1.0];
        } while ( [response.messages count] != 0);

        return allMessages;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
        return [NSArray array];
    }
}

-(void)deleteMessageFromQueue:(SQSMessage *)message
{
    @try {
        SQSDeleteMessageRequest *request = [[[SQSDeleteMessageRequest alloc] initWithQueueUrl:queueUrl andReceiptHandle:message.receiptHandle] autorelease];
        [sqsClient deleteMessage:request];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

// Get the QueueArn attribute from the Queue.  The QueueArn is necessary for create a policy on the queue
// that allows for messages from the Amazon SNS Topic.
-(NSString *)getQueueArn:(NSString *)theQueueUrl
{
    @try {
        SQSGetQueueAttributesRequest *gqar = [[[SQSGetQueueAttributesRequest alloc] initWithQueueUrl:theQueueUrl] autorelease];
        [gqar.attributeNames addObject:@"QueueArn"];

        SQSGetQueueAttributesResponse *response = [sqsClient getQueueAttributes:gqar];

        return [response.attributes valueForKey:@"QueueArn"];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
        return nil;
    }
}

// Add a policy to a specific queue by setting the queue's Policy attribute.
// Assigning a policy to the queue is necessary as described in Amazon SNS' FAQ:
// http://aws.amazon.com/sns/faqs/#26
-(void)addPolicyToQueueForTopic:(NSString *)theQueueUrl queueArn:(NSString *)queueArn
{
    @try {
        NSMutableDictionary *attributes = [[[NSMutableDictionary alloc] init] autorelease];
        [attributes setValue:[self generateSqsPolicyForTopic:queueArn] forKey:@"Policy"];

        SQSSetQueueAttributesRequest *request = [[[SQSSetQueueAttributesRequest alloc] initWithQueueUrl:theQueueUrl andAttributes:attributes] autorelease];
        [sqsClient setQueueAttributes:request];
        // It can take some time for policy to propagate to the queue.
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
    }
}

// Creates the policy object that is necessary to allow the topic to send message to the queue.  The topic will
// send all topic notifications to the queue.
-(NSString *)generateSqsPolicyForTopic:(NSString *)queueArn
{
    NSMutableString *policy = [[NSMutableString alloc] initWithCapacity:256];

    [policy appendString:@"{"];
    [policy appendString:[[[NSString alloc] initWithFormat:@"\"Version\":\"2008-10-17\","] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"\"Id\":\"%@/policyId\",", queueArn] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"\"Statement\": ["] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"     {"] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"          \"Sid\":\"%@/statementId\",", queueArn] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"          \"Effect\":\"Allow\","] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"          \"Principal\":{\"AWS\":\"*\"},"] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"          \"Action\":\"SQS:SendMessage\","] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"          \"Resource\": \"%@\",", queueArn] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"          \"Condition\":{"] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"               \"StringEquals\":{\"aws:SourceArn\":\"%@\"}", topicARN] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"            }"] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"     }"] autorelease]];
    [policy appendString:[[[NSString alloc] initWithFormat:@"]"] autorelease]];
    [policy appendString:@"}"];

    return [policy autorelease];
}

// Determines if a topic exists with the given topic name.
// The topic name is assigned in the Constants.h file.
-(NSString *)findTopicArn
{
    @try {
        NSString *topicNameToFind = [NSString stringWithFormat:@":%@", TOPIC_NAME];
        NSString *nextToken       = nil;
        do {
            SNSListTopicsRequest  *listTopicsRequest = [[[SNSListTopicsRequest alloc] initWithNextToken:nextToken] autorelease];
            SNSListTopicsResponse *response          = [snsClient listTopics:listTopicsRequest];
            for (SNSTopic *topic in response.topics) {
                if ( [topic.topicArn hasSuffix:topicNameToFind]) {
                    return topic.topicArn;
                }
            }

            nextToken = response.nextToken;
        } while (nextToken != nil);

        return nil;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
        return nil;
    }
}

// Determine if a queue exists with the given queue name.
// The queue name is assigned in the Constants.h file.
-(NSString *)findQueueUrl
{
    @try {
        NSString              *queueNameToFind = [NSString stringWithFormat:@"/%@", QUEUE_NAME];

        SQSListQueuesRequest  *request        = [[[SQSListQueuesRequest alloc] init] autorelease];
        SQSListQueuesResponse *queuesResponse = [sqsClient listQueues:request];
        for (NSString *qUrl in queuesResponse.queueUrls) {
            if ( [qUrl hasSuffix:queueNameToFind]) {
                return qUrl;
            }
        }

        return nil;
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception);
        return nil;
    }
}

-(void)dealloc
{
    [topicARN release];
    [queueUrl release];
    [sqsClient release];
    [snsClient release];
    [super dealloc];
}

@end
