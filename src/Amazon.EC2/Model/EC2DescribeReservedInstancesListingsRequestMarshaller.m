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

#import "EC2DescribeReservedInstancesListingsRequestMarshaller.h"

@implementation EC2DescribeReservedInstancesListingsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeReservedInstancesListingsRequest *)describeReservedInstancesListingsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeReservedInstancesListings"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeReservedInstancesListingsRequest delegate]];
    [request setCredentials:[describeReservedInstancesListingsRequest credentials]];
    [request setEndpoint:[describeReservedInstancesListingsRequest requestEndpoint]];
    [request setRequestTag:[describeReservedInstancesListingsRequest requestTag]];

    if (describeReservedInstancesListingsRequest != nil) {
        if (describeReservedInstancesListingsRequest.reservedInstancesId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeReservedInstancesListingsRequest.reservedInstancesId] forKey:[NSString stringWithFormat:@"%@", @"ReservedInstancesId"]];
        }
    }
    if (describeReservedInstancesListingsRequest != nil) {
        if (describeReservedInstancesListingsRequest.reservedInstancesListingId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeReservedInstancesListingsRequest.reservedInstancesListingId] forKey:[NSString stringWithFormat:@"%@", @"ReservedInstancesListingId"]];
        }
    }

    if (describeReservedInstancesListingsRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeReservedInstancesListingsRequest.filters) {
            if (filtersListValue != nil) {
                if (filtersListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", filtersListValue.name] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"Filters", filtersListIndex, @"Name"]];
                }
            }

            if (filtersListValue != nil) {
                int valuesListIndex = 1;
                for (NSString *valuesListValue in filtersListValue.values) {
                    if (valuesListValue != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", valuesListValue] forKey:[NSString stringWithFormat:@"%@.%d.%@.%d", @"Filters", filtersListIndex, @"Value", valuesListIndex]];
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

