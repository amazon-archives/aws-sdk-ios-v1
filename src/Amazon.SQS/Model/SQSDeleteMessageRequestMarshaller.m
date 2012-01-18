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

#import "SQSDeleteMessageRequestMarshaller.h"

@implementation SQSDeleteMessageRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSDeleteMessageRequest *)deleteMessageRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"DeleteMessage"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[deleteMessageRequest delegate]];
    [request setCredentials:[deleteMessageRequest credentials]];
    [request setEndpoint:[deleteMessageRequest requestEndpoint]];
    [request setRequestTag:[deleteMessageRequest requestTag]];

    if (deleteMessageRequest != nil) {
        if (deleteMessageRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteMessageRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }
    if (deleteMessageRequest != nil) {
        if (deleteMessageRequest.receiptHandle != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteMessageRequest.receiptHandle] forKey:[NSString stringWithFormat:@"%@", @"ReceiptHandle"]];
        }
    }


    return [request autorelease];
}

@end

