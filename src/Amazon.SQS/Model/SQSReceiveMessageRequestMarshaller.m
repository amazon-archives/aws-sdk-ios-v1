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

#import "SQSReceiveMessageRequestMarshaller.h"

@implementation SQSReceiveMessageRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SQSReceiveMessageRequest *)receiveMessageRequest
{
    AmazonServiceRequest *request = [[SQSRequest alloc] init];

    [request setParameterValue:@"ReceiveMessage"           forKey:@"Action"];
    [request setParameterValue:@"2011-10-01"   forKey:@"Version"];

    [request setDelegate:[receiveMessageRequest delegate]];
    [request setCredentials:[receiveMessageRequest credentials]];
    [request setEndpoint:[receiveMessageRequest requestEndpoint]];
    [request setRequestTag:[receiveMessageRequest requestTag]];

    if (receiveMessageRequest != nil) {
        if (receiveMessageRequest.queueUrl != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", receiveMessageRequest.queueUrl] forKey:[NSString stringWithFormat:@"%@", @"QueueUrl"]];
        }
    }

    if (receiveMessageRequest != nil) {
        int attributeNamesListIndex = 1;
        for (NSString *attributeNamesListValue in receiveMessageRequest.attributeNames) {
            if (attributeNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", attributeNamesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"AttributeName", attributeNamesListIndex]];
            }

            attributeNamesListIndex++;
        }
    }
    if (receiveMessageRequest != nil) {
        if (receiveMessageRequest.maxNumberOfMessages != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", receiveMessageRequest.maxNumberOfMessages] forKey:[NSString stringWithFormat:@"%@", @"MaxNumberOfMessages"]];
        }
    }
    if (receiveMessageRequest != nil) {
        if (receiveMessageRequest.visibilityTimeout != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", receiveMessageRequest.visibilityTimeout] forKey:[NSString stringWithFormat:@"%@", @"VisibilityTimeout"]];
        }
    }


    return [request autorelease];
}

@end

