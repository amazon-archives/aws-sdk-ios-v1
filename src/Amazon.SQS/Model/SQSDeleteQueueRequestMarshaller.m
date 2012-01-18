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

#import "SQSDeleteQueueRequestMarshaller.h"

@implementation SQSDeleteQueueRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSDeleteQueueRequest *)deleteQueueRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"DeleteQueue"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[deleteQueueRequest delegate]];
    [request setCredentials:[deleteQueueRequest credentials]];
    [request setEndpoint:[deleteQueueRequest requestEndpoint]];
    [request setRequestTag:[deleteQueueRequest requestTag]];

    if (deleteQueueRequest != nil) {
        if (deleteQueueRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteQueueRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }


    return [request autorelease];
}

@end

