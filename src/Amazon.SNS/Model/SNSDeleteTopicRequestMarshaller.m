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

#import "SNSDeleteTopicRequestMarshaller.h"

@implementation SNSDeleteTopicRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SNSDeleteTopicRequest *)deleteTopicRequest
{
    AmazonServiceRequest *request = [[SNSRequest alloc] init];

    [request setParameterValue:@"DeleteTopic"           forKey:@"Action"];
    [request setParameterValue:@"2010-03-31"   forKey:@"Version"];

    [request setDelegate:[deleteTopicRequest delegate]];
    [request setCredentials:[deleteTopicRequest credentials]];
    [request setEndpoint:[deleteTopicRequest requestEndpoint]];
    [request setRequestTag:[deleteTopicRequest requestTag]];

    if (deleteTopicRequest != nil) {
        if (deleteTopicRequest.topicArn != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteTopicRequest.topicArn] forKey:[NSString stringWithFormat:@"%@", @"TopicArn"]];
        }
    }


    return [request autorelease];
}

@end

