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

#import "SQSSendMessageBatchRequestMarshaller.h"

@implementation SQSSendMessageBatchRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSSendMessageBatchRequest *)sendMessageBatchRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"SendMessageBatch"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[sendMessageBatchRequest delegate]];
    [request setCredentials:[sendMessageBatchRequest credentials]];
    [request setEndpoint:[sendMessageBatchRequest requestEndpoint]];
    [request setRequestTag:[sendMessageBatchRequest requestTag]];

    if (sendMessageBatchRequest != nil) {
        if (sendMessageBatchRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", sendMessageBatchRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }

    if (sendMessageBatchRequest != nil) {
        int entriesListIndex = 1;
        for (SQSSendMessageBatchRequestEntry *entriesListValue in sendMessageBatchRequest.entries) {
            if (entriesListValue != nil) {
                if (entriesListValue.idValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.idValue] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"SendMessageBatchRequestEntry", entriesListIndex, @"Id"]];
                }
            }
            if (entriesListValue != nil) {
                if (entriesListValue.messageBody != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.messageBody] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"SendMessageBatchRequestEntry", entriesListIndex, @"MessageBody"]];
                }
            }
            if (entriesListValue != nil) {
                if (entriesListValue.delaySeconds != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.delaySeconds] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"SendMessageBatchRequestEntry", entriesListIndex, @"DelaySeconds"]];
                }
            }

            entriesListIndex++;
        }
    }


    return [request autorelease];
}

@end

