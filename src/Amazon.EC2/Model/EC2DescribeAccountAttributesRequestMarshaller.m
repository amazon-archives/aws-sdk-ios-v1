/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "EC2DescribeAccountAttributesRequestMarshaller.h"

@implementation EC2DescribeAccountAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeAccountAttributesRequest *)describeAccountAttributesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeAccountAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2013-02-01"   forKey:@"Version"];

    [request setDelegate:[describeAccountAttributesRequest delegate]];
    [request setCredentials:[describeAccountAttributesRequest credentials]];
    [request setEndpoint:[describeAccountAttributesRequest requestEndpoint]];
    [request setRequestTag:[describeAccountAttributesRequest requestTag]];


    if (describeAccountAttributesRequest != nil) {
        int attributeNamesListIndex = 1;
        for (NSString *attributeNamesListValue in describeAccountAttributesRequest.attributeNames) {
            if (attributeNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", attributeNamesListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"AttributeName", attributeNamesListIndex]];
            }

            attributeNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

