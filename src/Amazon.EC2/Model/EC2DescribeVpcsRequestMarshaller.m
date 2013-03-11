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

#import "EC2DescribeVpcsRequestMarshaller.h"

@implementation EC2DescribeVpcsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeVpcsRequest *)describeVpcsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeVpcs"           forKey:@"Action"];
    [request setParameterValue:@"2013-02-01"   forKey:@"Version"];

    [request setDelegate:[describeVpcsRequest delegate]];
    [request setCredentials:[describeVpcsRequest credentials]];
    [request setEndpoint:[describeVpcsRequest requestEndpoint]];
    [request setRequestTag:[describeVpcsRequest requestTag]];


    if (describeVpcsRequest != nil) {
        int vpcIdsListIndex = 1;
        for (NSString *vpcIdsListValue in describeVpcsRequest.vpcIds) {
            if (vpcIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", vpcIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"VpcId", vpcIdsListIndex]];
            }

            vpcIdsListIndex++;
        }
    }

    if (describeVpcsRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeVpcsRequest.filters) {
            if (filtersListValue != nil) {
                if (filtersListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", filtersListValue.name] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Filter", filtersListIndex, @"Name"]];
                }
            }

            if (filtersListValue != nil) {
                int valuesListIndex = 1;
                for (NSString *valuesListValue in filtersListValue.values) {
                    if (valuesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", valuesListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d", @"Filter", filtersListIndex, @"Value", valuesListIndex]];
                    }

                    valuesListIndex++;
                }
            }

            filtersListIndex++;
        }
    }


    return [request autorelease];
}

@end

