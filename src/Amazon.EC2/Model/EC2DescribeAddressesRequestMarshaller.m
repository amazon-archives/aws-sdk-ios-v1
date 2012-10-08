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

#import "EC2DescribeAddressesRequestMarshaller.h"

@implementation EC2DescribeAddressesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeAddressesRequest *)describeAddressesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeAddresses"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeAddressesRequest delegate]];
    [request setCredentials:[describeAddressesRequest credentials]];
    [request setEndpoint:[describeAddressesRequest requestEndpoint]];
    [request setRequestTag:[describeAddressesRequest requestTag]];


    if (describeAddressesRequest != nil) {
        int publicIpsListIndex = 1;
        for (NSString *publicIpsListValue in describeAddressesRequest.publicIps) {
            if (publicIpsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", publicIpsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"PublicIp", publicIpsListIndex]];
            }

            publicIpsListIndex++;
        }
    }

    if (describeAddressesRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeAddressesRequest.filters) {
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

    if (describeAddressesRequest != nil) {
        int allocationIdsListIndex = 1;
        for (NSString *allocationIdsListValue in describeAddressesRequest.allocationIds) {
            if (allocationIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", allocationIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"AllocationId", allocationIdsListIndex]];
            }

            allocationIdsListIndex++;
        }
    }


    return [request autorelease];
}

@end

