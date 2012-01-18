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

#import "SQSChangeMessageVisibilityRequestMarshaller.h"

@implementation SQSChangeMessageVisibilityRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSChangeMessageVisibilityRequest *)changeMessageVisibilityRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"ChangeMessageVisibility"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[changeMessageVisibilityRequest delegate]];
    [request setCredentials:[changeMessageVisibilityRequest credentials]];
    [request setEndpoint:[changeMessageVisibilityRequest requestEndpoint]];
    [request setRequestTag:[changeMessageVisibilityRequest requestTag]];

    if (changeMessageVisibilityRequest != nil) {
        if (changeMessageVisibilityRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", changeMessageVisibilityRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }
    if (changeMessageVisibilityRequest != nil) {
        if (changeMessageVisibilityRequest.receiptHandle != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", changeMessageVisibilityRequest.receiptHandle] forKey:[NSString stringWithFormat:@"%@", @"ReceiptHandle"]];
        }
    }
    if (changeMessageVisibilityRequest != nil) {
        if (changeMessageVisibilityRequest.visibilityTimeout != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", changeMessageVisibilityRequest.visibilityTimeout] forKey:[NSString stringWithFormat:@"%@", @"VisibilityTimeout"]];
        }
    }


    return [request autorelease];
}

@end

