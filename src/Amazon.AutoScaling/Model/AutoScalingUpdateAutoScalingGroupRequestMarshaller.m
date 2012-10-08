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

#import "AutoScalingUpdateAutoScalingGroupRequestMarshaller.h"

@implementation AutoScalingUpdateAutoScalingGroupRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingUpdateAutoScalingGroupRequest *)updateAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"UpdateAutoScalingGroup"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[updateAutoScalingGroupRequest delegate]];
    [request setCredentials:[updateAutoScalingGroupRequest credentials]];
    [request setEndpoint:[updateAutoScalingGroupRequest requestEndpoint]];
    [request setRequestTag:[updateAutoScalingGroupRequest requestTag]];

    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.launchConfigurationName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.launchConfigurationName] forKey:[NSString stringWithFormat:@"%@", @"LaunchConfigurationName"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.minSize != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.minSize] forKey:[NSString stringWithFormat:@"%@", @"MinSize"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.maxSize != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.maxSize] forKey:[NSString stringWithFormat:@"%@", @"MaxSize"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.desiredCapacity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.desiredCapacity] forKey:[NSString stringWithFormat:@"%@", @"DesiredCapacity"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.defaultCooldown != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.defaultCooldown] forKey:[NSString stringWithFormat:@"%@", @"DefaultCooldown"]];
        }
    }

    if (updateAutoScalingGroupRequest != nil) {
        int availabilityZonesListIndex = 1;
        for (NSString *availabilityZonesListValue in updateAutoScalingGroupRequest.availabilityZones) {
            if (availabilityZonesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", availabilityZonesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AvailabilityZones", availabilityZonesListIndex]];
            }

            availabilityZonesListIndex++;
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.healthCheckType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.healthCheckType] forKey:[NSString stringWithFormat:@"%@", @"HealthCheckType"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.healthCheckGracePeriod != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.healthCheckGracePeriod] forKey:[NSString stringWithFormat:@"%@", @"HealthCheckGracePeriod"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.placementGroup != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.placementGroup] forKey:[NSString stringWithFormat:@"%@", @"PlacementGroup"]];
        }
    }
    if (updateAutoScalingGroupRequest != nil) {
        if (updateAutoScalingGroupRequest.vPCZoneIdentifier != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", updateAutoScalingGroupRequest.vPCZoneIdentifier] forKey:[NSString stringWithFormat:@"%@", @"VPCZoneIdentifier"]];
        }
    }

    if (updateAutoScalingGroupRequest != nil) {
        int terminationPoliciesListIndex = 1;
        for (NSString *terminationPoliciesListValue in updateAutoScalingGroupRequest.terminationPolicies) {
            if (terminationPoliciesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", terminationPoliciesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"TerminationPolicies", terminationPoliciesListIndex]];
            }

            terminationPoliciesListIndex++;
        }
    }


    return [request autorelease];
}

@end

