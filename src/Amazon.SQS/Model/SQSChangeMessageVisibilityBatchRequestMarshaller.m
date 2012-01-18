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

#import "SQSChangeMessageVisibilityBatchRequestMarshaller.h"

@implementation SQSChangeMessageVisibilityBatchRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSChangeMessageVisibilityBatchRequest *)changeMessageVisibilityBatchRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"ChangeMessageVisibilityBatch"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[changeMessageVisibilityBatchRequest delegate]];
    [request setCredentials:[changeMessageVisibilityBatchRequest credentials]];
    [request setEndpoint:[changeMessageVisibilityBatchRequest requestEndpoint]];
    [request setRequestTag:[changeMessageVisibilityBatchRequest requestTag]];

    if (changeMessageVisibilityBatchRequest != nil) {
        if (changeMessageVisibilityBatchRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", changeMessageVisibilityBatchRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }

    if (changeMessageVisibilityBatchRequest != nil) {
        int entriesListIndex = 1;
        for (SQSChangeMessageVisibilityBatchRequestEntry *entriesListValue in changeMessageVisibilityBatchRequest.entries) {
            if (entriesListValue != nil) {
                if (entriesListValue.idValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.idValue] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"ChangeMessageVisibilityBatchRequestEntry", entriesListIndex, @"Id"]];
                }
            }
            if (entriesListValue != nil) {
                if (entriesListValue.receiptHandle != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.receiptHandle] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"ChangeMessageVisibilityBatchRequestEntry", entriesListIndex, @"ReceiptHandle"]];
                }
            }
            if (entriesListValue != nil) {
                if (entriesListValue.visibilityTimeout != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", entriesListValue.visibilityTimeout] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"ChangeMessageVisibilityBatchRequestEntry", entriesListIndex, @"VisibilityTimeout"]];
                }
            }

            entriesListIndex++;
        }
    }


    return [request autorelease];
}

@end

