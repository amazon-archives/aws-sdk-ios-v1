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

#import "SQSCreateQueueRequestMarshaller.h"

@implementation SQSCreateQueueRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSCreateQueueRequest *)createQueueRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"CreateQueue"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[createQueueRequest delegate]];
    [request setCredentials:[createQueueRequest credentials]];
    [request setEndpoint:[createQueueRequest requestEndpoint]];
    [request setRequestTag:[createQueueRequest requestTag]];

    if (createQueueRequest != nil) {
        if (createQueueRequest.queueName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createQueueRequest.queueName] forKey:[NSString stringWithFormat:@"%@", @"QueueName"]];
        }
    }
    if (createQueueRequest != nil) {
        if (createQueueRequest.attributes != nil) {
            int attributesListIndex = 1;
            for (NSString *attributesListKey in createQueueRequest.attributes) {
                NSString *attributesListKeyValue = [createQueueRequest.attributes valueForKey:attributesListKey];
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

