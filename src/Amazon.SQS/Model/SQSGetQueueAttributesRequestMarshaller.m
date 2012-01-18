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

#import "SQSGetQueueAttributesRequestMarshaller.h"

@implementation SQSGetQueueAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSGetQueueAttributesRequest *)getQueueAttributesRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"GetQueueAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[getQueueAttributesRequest delegate]];
    [request setCredentials:[getQueueAttributesRequest credentials]];
    [request setEndpoint:[getQueueAttributesRequest requestEndpoint]];
    [request setRequestTag:[getQueueAttributesRequest requestTag]];

    if (getQueueAttributesRequest != nil) {
        if (getQueueAttributesRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getQueueAttributesRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }

    if (getQueueAttributesRequest != nil) {
        int attributeNamesListIndex = 1;
        for (NSString *attributeNamesListValue in getQueueAttributesRequest.attributeNames) {
            if (attributeNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", attributeNamesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"AttributeName", attributeNamesListIndex]];
            }

            attributeNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

