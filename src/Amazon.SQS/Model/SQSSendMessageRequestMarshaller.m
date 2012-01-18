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

#import "SQSSendMessageRequestMarshaller.h"

@implementation SQSSendMessageRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSSendMessageRequest *)sendMessageRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"SendMessage"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[sendMessageRequest delegate]];
    [request setCredentials:[sendMessageRequest credentials]];
    [request setEndpoint:[sendMessageRequest requestEndpoint]];
    [request setRequestTag:[sendMessageRequest requestTag]];

    if (sendMessageRequest != nil) {
        if (sendMessageRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", sendMessageRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }
    if (sendMessageRequest != nil) {
        if (sendMessageRequest.messageBody != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", sendMessageRequest.messageBody] forKey:[NSString stringWithFormat:@"%@", @"MessageBody"]];
        }
    }
    if (sendMessageRequest != nil) {
        if (sendMessageRequest.delaySeconds != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", sendMessageRequest.delaySeconds] forKey:[NSString stringWithFormat:@"%@", @"DelaySeconds"]];
        }
    }


    return [request autorelease];
}

@end

