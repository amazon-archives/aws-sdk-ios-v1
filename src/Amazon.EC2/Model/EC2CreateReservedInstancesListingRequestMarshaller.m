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

#import "EC2CreateReservedInstancesListingRequestMarshaller.h"

@implementation EC2CreateReservedInstancesListingRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2CreateReservedInstancesListingRequest *)createReservedInstancesListingRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"CreateReservedInstancesListing"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[createReservedInstancesListingRequest delegate]];
    [request setCredentials:[createReservedInstancesListingRequest credentials]];
    [request setEndpoint:[createReservedInstancesListingRequest requestEndpoint]];
    [request setRequestTag:[createReservedInstancesListingRequest requestTag]];

    if (createReservedInstancesListingRequest != nil) {
        if (createReservedInstancesListingRequest.reservedInstancesId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createReservedInstancesListingRequest.reservedInstancesId] forKey:[NSString stringWithFormat:@"%@", @"ReservedInstancesId"]];
        }
    }
    if (createReservedInstancesListingRequest != nil) {
        if (createReservedInstancesListingRequest.instanceCount != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createReservedInstancesListingRequest.instanceCount] forKey:[NSString stringWithFormat:@"%@", @"InstanceCount"]];
        }
    }

    if (createReservedInstancesListingRequest != nil) {
        int priceSchedulesListIndex = 1;
        for (EC2PriceScheduleSpecification *priceSchedulesListValue in createReservedInstancesListingRequest.priceSchedules) {
            if (priceSchedulesListValue != nil) {
                if (priceSchedulesListValue.term != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", priceSchedulesListValue.term] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"PriceSchedules", priceSchedulesListIndex, @"Term"]];
                }
            }
            if (priceSchedulesListValue != nil) {
                if (priceSchedulesListValue.price != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", priceSchedulesListValue.price] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"PriceSchedules", priceSchedulesListIndex, @"Price"]];
                }
            }
            if (priceSchedulesListValue != nil) {
                if (priceSchedulesListValue.currencyCode != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", priceSchedulesListValue.currencyCode] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"PriceSchedules", priceSchedulesListIndex, @"CurrencyCode"]];
                }
            }

            priceSchedulesListIndex++;
        }
    }
    if (createReservedInstancesListingRequest != nil) {
        if (createReservedInstancesListingRequest.clientToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createReservedInstancesListingRequest.clientToken] forKey:[NSString stringWithFormat:@"%@", @"ClientToken"]];
        }
    }


    return [request autorelease];
}

@end

