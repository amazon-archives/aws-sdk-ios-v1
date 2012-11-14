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


#import "../AmazonServiceRequestConfig.h"



/**
 * Receive Message Request
 */

@interface SQSReceiveMessageRequest:AmazonServiceRequestConfig

{
    NSString       *queueUrl;
    NSMutableArray *attributeNames;
    NSNumber       *maxNumberOfMessages;
    NSNumber       *visibilityTimeout;
    NSNumber       *waitTimeSeconds;
}



/**
 * The URL of the SQS queue to take action on.
 */
@property (nonatomic, retain) NSString *queueUrl;

/**
 * A list of attributes that need to be returned along with each message.
 * The set of valid attributes are [SenderId,
 * ApproximateFirstReceiveTimestamp, ApproximateReceiveCount,
 * SentTimestamp].
 */
@property (nonatomic, retain) NSMutableArray *attributeNames;

/**
 * The maximum number of messages to return. Amazon SQS never returns
 * more messages than this value but may return fewer. <p>All of the
 * messages are not necessarily returned.
 */
@property (nonatomic, retain) NSNumber *maxNumberOfMessages;

/**
 * The duration (in seconds) that the received messages are hidden from
 * subsequent retrieve requests after being retrieved by a
 * <code>ReceiveMessage</code> request.
 */
@property (nonatomic, retain) NSNumber *visibilityTimeout;

/**
 * The duration (in seconds) for which the call will wait for a message
 * to arrive in the queue before returning. If a message is available,
 * the call will return sooner than WaitTimeSeconds.
 */
@property (nonatomic, retain) NSNumber *waitTimeSeconds;


/**
 * Default constructor for a new ReceiveMessageRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ReceiveMessageRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theQueueUrl The URL of the SQS queue to take action on.
 */
-(id)initWithQueueUrl:(NSString *)theQueueUrl;

/**
 * Adds a single object to attributeNames.
 * This function will alloc and init attributeNames if not already done.
 */
-(void)addAttributeName:(NSString *)attributeNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
