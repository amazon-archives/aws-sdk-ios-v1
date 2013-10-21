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

#import "EC2ModifyReservedInstancesRequestMarshaller.h"

@implementation EC2ModifyReservedInstancesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2ModifyReservedInstancesRequest *)modifyReservedInstancesRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"ModifyReservedInstances"           forKey:@"Action"];
    [request setParameterValue:@"2013-10-01"   forKey:@"Version"];

    [request setDelegate:[modifyReservedInstancesRequest delegate]];
    [request setCredentials:[modifyReservedInstancesRequest credentials]];
    [request setEndpoint:[modifyReservedInstancesRequest requestEndpoint]];
    [request setRequestTag:[modifyReservedInstancesRequest requestTag]];

    if (modifyReservedInstancesRequest != nil) {
        if (modifyReservedInstancesRequest.clientToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyReservedInstancesRequest.clientToken] forKey:[NSString stringWithFormat:@"%@", @"ClientToken"]];
        }
    }

    if (modifyReservedInstancesRequest != nil) {
        int reservedInstancesIdsListIndex = 1;
        for (NSString *reservedInstancesIdsListValue in modifyReservedInstancesRequest.reservedInstancesIds) {
            if (reservedInstancesIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", reservedInstancesIdsListValue] forKey:[NSString stringWithFormat:@"%@.%d", @"ReservedInstancesId", reservedInstancesIdsListIndex]];
            }

            reservedInstancesIdsListIndex++;
        }
    }

    if (modifyReservedInstancesRequest != nil) {
        int targetConfigurationsListIndex = 1;
        for (EC2ReservedInstancesConfiguration *targetConfigurationsListValue in modifyReservedInstancesRequest.targetConfigurations) {
            if (targetConfigurationsListValue != nil) {
                if (targetConfigurationsListValue.availabilityZone != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", targetConfigurationsListValue.availabilityZone] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"ReservedInstancesConfigurationSetItemType", targetConfigurationsListIndex, @"AvailabilityZone"]];
                }
            }
            if (targetConfigurationsListValue != nil) {
                if (targetConfigurationsListValue.platform != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", targetConfigurationsListValue.platform] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"ReservedInstancesConfigurationSetItemType", targetConfigurationsListIndex, @"Platform"]];
                }
            }
            if (targetConfigurationsListValue != nil) {
                if (targetConfigurationsListValue.instanceCount != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", targetConfigurationsListValue.instanceCount] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"ReservedInstancesConfigurationSetItemType", targetConfigurationsListIndex, @"InstanceCount"]];
                }
            }
            if (targetConfigurationsListValue != nil) {
                if (targetConfigurationsListValue.instanceType != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", targetConfigurationsListValue.instanceType] forKey:[NSString stringWithFormat:@"%@.%d.%@", @"ReservedInstancesConfigurationSetItemType", targetConfigurationsListIndex, @"InstanceType"]];
                }
            }

            targetConfigurationsListIndex++;
        }
    }


    return [request autorelease];
}

@end

