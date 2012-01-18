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

#import "SQSDeleteMessageBatchRequestMarshaller.h"

@implementation SQSDeleteMessageBatchRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSDeleteMessageBatchRequest *)deleteMessageBatchRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"DeleteMessageBatch"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[deleteMessageBatchRequest delegate]];
    [request setCredentials:[deleteMessageBatchRequest credentials]];
    [request setEndpoint:[deleteMessageBatchRequest requestEndpoint]];
    [request setRequestTag:[deleteMessageBatchRequest requestTag]];

    if (deleteMessageBatchRequest != nil) {
        if (deleteMessageBatchRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteMessageBatchRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }

    if (deleteMessageBatchRequest != nil) {
        int entriesListIndex = 1;
        for (SQSDeleteMessageBatchRequestEntry *entriesListValue in deleteMessageBatchRequest.entries) {
            if (entriesListValue != nil) {
                if (entriesListValue.idValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.idValue] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"DeleteMessageBatchRequestEntry", entriesListIndex, @"Id"]];
                }
            }
            if (entriesListValue != nil) {
                if (entriesListValue.receiptHandle != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.receiptHandle] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"DeleteMessageBatchRequestEntry", entriesListIndex, @"ReceiptHandle"]];
                }
            }

            entriesListIndex++;
        }
    }


    return [request autorelease];
}

@end

