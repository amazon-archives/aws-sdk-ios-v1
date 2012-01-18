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

#import "EC2Response.h"
#import "EC2DescribeSpotInstanceRequestsResponse.h"
#import "EC2RequestSpotInstancesResponse.h"
#import "EC2DescribeInstancesResponse.h"
#import "EC2RunInstancesResponse.h"

@implementation EC2Response

-(void)postProcess
{
    if ( [NSStringFromClass([self class]) isEqualToString:@"EC2DescribeSpotInstanceRequestsResponse"]) {
        EC2DescribeSpotInstanceRequestsResponse *response = (EC2DescribeSpotInstanceRequestsResponse *)self;
        for (EC2SpotInstanceRequest *spotInstanceRequest in response.spotInstanceRequests) {
            EC2LaunchSpecification *launchSpecification = spotInstanceRequest.launchSpecification;
            [self populateLaunchSpecificationSecurityGroupNames:launchSpecification];
        }
    }
    else if ( [NSStringFromClass([self class]) isEqualToString:@"EC2RequestSpotInstancesResponse"]) {
        EC2RequestSpotInstancesResponse *response = (EC2RequestSpotInstancesResponse *)self;
        for (EC2SpotInstanceRequest *spotInstanceRequest in response.spotInstanceRequests) {
            EC2LaunchSpecification *launchSpecification = spotInstanceRequest.launchSpecification;
            [self populateLaunchSpecificationSecurityGroupNames:launchSpecification];
        }
    }
    else if ( [NSStringFromClass([self class]) isEqualToString:@"EC2DescribeInstancesResponse"]) {
        EC2DescribeInstancesResponse *response = (EC2DescribeInstancesResponse *)self;
        for (EC2Reservation *reservation in response.reservations) {
            [self populateReservationSecurityGroupNames:reservation];
        }
    }
    else if ( [NSStringFromClass([self class]) isEqualToString:@"EC2RunInstancesResponse"]) {
        EC2RunInstancesResponse *response = (EC2RunInstancesResponse *)self;
        [self populateReservationSecurityGroupNames:response.reservation];
    }
}

-(void)populateReservationSecurityGroupNames:(EC2Reservation *)reservation
{
    for (EC2GroupIdentifier *group in reservation.groups) {
        [reservation.groupNames addObject:group.groupName];
    }
}

-(void)populateLaunchSpecificationSecurityGroupNames:(EC2LaunchSpecification *)launchSpecification
{
    for (EC2GroupIdentifier *group in launchSpecification.allSecurityGroups) {
        [launchSpecification.securityGroups addObject:group.groupName];
    }
}

@end
