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

#import "SNSListSubscriptionsByTopicRequestMarshaller.h"

@implementation SNSListSubscriptionsByTopicRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSListSubscriptionsByTopicRequest *)listSubscriptionsByTopicRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"ListSubscriptionsByTopic"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[listSubscriptionsByTopicRequest delegate]];
    [request setCredentials:[listSubscriptionsByTopicRequest credentials]];
    [request setEndpoint:[listSubscriptionsByTopicRequest requestEndpoint]];
    [request setRequestTag:[listSubscriptionsByTopicRequest requestTag]];

    if (listSubscriptionsByTopicRequest != nil) {
        if (listSubscriptionsByTopicRequest.topicArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listSubscriptionsByTopicRequest.topicArn] forKey:[NSString stringWithFormat:@"%@", @"TopicArn"]];
        }
    }
    if (listSubscriptionsByTopicRequest != nil) {
        if (listSubscriptionsByTopicRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listSubscriptionsByTopicRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

