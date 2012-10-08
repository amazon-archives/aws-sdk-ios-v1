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

#import "AutoScalingCreateAutoScalingGroupRequestMarshaller.h"

@implementation AutoScalingCreateAutoScalingGroupRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingCreateAutoScalingGroupRequest *)createAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"CreateAutoScalingGroup"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[createAutoScalingGroupRequest delegate]];
    [request setCredentials:[createAutoScalingGroupRequest credentials]];
    [request setEndpoint:[createAutoScalingGroupRequest requestEndpoint]];
    [request setRequestTag:[createAutoScalingGroupRequest requestTag]];

    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.launchConfigurationName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.launchConfigurationName] forKey:[NSString stringWithFormat:@"%@", @"LaunchConfigurationName"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.minSize != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.minSize] forKey:[NSString stringWithFormat:@"%@", @"MinSize"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.maxSize != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.maxSize] forKey:[NSString stringWithFormat:@"%@", @"MaxSize"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.desiredCapacity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.desiredCapacity] forKey:[NSString stringWithFormat:@"%@", @"DesiredCapacity"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.defaultCooldown != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.defaultCooldown] forKey:[NSString stringWithFormat:@"%@", @"DefaultCooldown"]];
        }
    }

    if (createAutoScalingGroupRequest != nil) {
        int availabilityZonesListIndex = 1;
        for (NSString *availabilityZonesListValue in createAutoScalingGroupRequest.availabilityZones) {
            if (availabilityZonesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", availabilityZonesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AvailabilityZones", availabilityZonesListIndex]];
            }

            availabilityZonesListIndex++;
        }
    }

    if (createAutoScalingGroupRequest != nil) {
        int loadBalancerNamesListIndex = 1;
        for (NSString *loadBalancerNamesListValue in createAutoScalingGroupRequest.loadBalancerNames) {
            if (loadBalancerNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", loadBalancerNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"LoadBalancerNames", loadBalancerNamesListIndex]];
            }

            loadBalancerNamesListIndex++;
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.healthCheckType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.healthCheckType] forKey:[NSString stringWithFormat:@"%@", @"HealthCheckType"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.healthCheckGracePeriod != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.healthCheckGracePeriod] forKey:[NSString stringWithFormat:@"%@", @"HealthCheckGracePeriod"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.placementGroup != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.placementGroup] forKey:[NSString stringWithFormat:@"%@", @"PlacementGroup"]];
        }
    }
    if (createAutoScalingGroupRequest != nil) {
        if (createAutoScalingGroupRequest.vPCZoneIdentifier != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAutoScalingGroupRequest.vPCZoneIdentifier] forKey:[NSString stringWithFormat:@"%@", @"VPCZoneIdentifier"]];
        }
    }

    if (createAutoScalingGroupRequest != nil) {
        int terminationPoliciesListIndex = 1;
        for (NSString *terminationPoliciesListValue in createAutoScalingGroupRequest.terminationPolicies) {
            if (terminationPoliciesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", terminationPoliciesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"TerminationPolicies", terminationPoliciesListIndex]];
            }

            terminationPoliciesListIndex++;
        }
    }

    if (createAutoScalingGroupRequest != nil) {
        int tagsListIndex = 1;
        for (AutoScalingTag *tagsListValue in createAutoScalingGroupRequest.tags) {
            if (tagsListValue != nil) {
                if (tagsListValue.resourceId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.resourceId] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"ResourceId"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.resourceType != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.resourceType] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"ResourceType"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.key != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.key] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"Key"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.value != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", tagsListValue.value] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"Value"]];
                }
            }
            if (tagsListValue != nil) {
                if (tagsListValue.propagateAtLaunchIsSet) {
                    [request setParameterValue:(tagsListValue.propagateAtLaunch ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Tags", tagsListIndex, @"PropagateAtLaunch"]];
                }
            }

            tagsListIndex++;
        }
    }


    return [request autorelease];
}

@end

