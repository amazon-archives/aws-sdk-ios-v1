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

#import "EC2DescribeReservedInstancesOfferingsRequestMarshaller.h"

@implementation EC2DescribeReservedInstancesOfferingsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2DescribeReservedInstancesOfferingsRequest *)describeReservedInstancesOfferingsRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"DescribeReservedInstancesOfferings"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[describeReservedInstancesOfferingsRequest delegate]];
    [request setCredentials:[describeReservedInstancesOfferingsRequest credentials]];
    [request setEndpoint:[describeReservedInstancesOfferingsRequest requestEndpoint]];
    [request setRequestTag:[describeReservedInstancesOfferingsRequest requestTag]];


    if (describeReservedInstancesOfferingsRequest != nil) {
        int reservedInstancesOfferingIdsListIndex = 1;
        for (NSString *reservedInstancesOfferingIdsListValue in describeReservedInstancesOfferingsRequest.reservedInstancesOfferingIds) {
            if (reservedInstancesOfferingIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", reservedInstancesOfferingIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ReservedInstancesOfferingId", reservedInstancesOfferingIdsListIndex]];
            }

            reservedInstancesOfferingIdsListIndex++;
        }
    }
    if (describeReservedInstancesOfferingsRequest != nil) {
        if (describeReservedInstancesOfferingsRequest.instanceType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeReservedInstancesOfferingsRequest.instanceType] forKey:[NSString stringWithFormat:@"%@", @"InstanceType"]];
        }
    }
    if (describeReservedInstancesOfferingsRequest != nil) {
        if (describeReservedInstancesOfferingsRequest.availabilityZone != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeReservedInstancesOfferingsRequest.availabilityZone] forKey:[NSString stringWithFormat:@"%@", @"AvailabilityZone"]];
        }
    }
    if (describeReservedInstancesOfferingsRequest != nil) {
        if (describeReservedInstancesOfferingsRequest.productDescription != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeReservedInstancesOfferingsRequest.productDescription] forKey:[NSString stringWithFormat:@"%@", @"ProductDescription"]];
        }
    }

    if (describeReservedInstancesOfferingsRequest != nil) {
        int filtersListIndex = 1;
        for (EC2Filter *filtersListValue in describeReservedInstancesOfferingsRequest.filters) {
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
    if (describeReservedInstancesOfferingsRequest != nil) {
        if (describeReservedInstancesOfferingsRequest.instanceTenancy != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeReservedInstancesOfferingsRequest.instanceTenancy] forKey:[NSString stringWithFormat:@"%@", @"InstanceTenancy"]];
        }
    }
    if (describeReservedInstancesOfferingsRequest != nil) {
        if (describeReservedInstancesOfferingsRequest.offeringType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeReservedInstancesOfferingsRequest.offeringType] forKey:[NSString stringWithFormat:@"%@", @"OfferingType"]];
        }
    }


    return [request autorelease];
}

@end

