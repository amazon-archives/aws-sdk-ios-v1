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

#import "SQSSetQueueAttributesRequestMarshaller.h"

@implementation SQSSetQueueAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSSetQueueAttributesRequest *)setQueueAttributesRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"SetQueueAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[setQueueAttributesRequest delegate]];
    [request setCredentials:[setQueueAttributesRequest credentials]];
    [request setEndpoint:[setQueueAttributesRequest requestEndpoint]];
    [request setRequestTag:[setQueueAttributesRequest requestTag]];

    if (setQueueAttributesRequest != nil) {
        if (setQueueAttributesRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setQueueAttributesRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }
    if (setQueueAttributesRequest != nil) {
        if (setQueueAttributesRequest.attributes != nil) {
            int attributesListIndex = 1;
            for (NSString *attributesListKey in setQueueAttributesRequest.attributes) {
                NSString *attributesListKeyValue = [setQueueAttributesRequest.attributes valueForKey:attributesListKey];
                if (attributesListKey != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", attributesListKey] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Attribute", attributesListIndex, @"Name"]];
                }

                if (attributesListKeyValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", attributesListKeyValue] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Attribute", attributesListIndex, @"Value"]];
                }




                ++attributesListIndex;
            }
        }
    }


    return [request autorelease];
}

@end

