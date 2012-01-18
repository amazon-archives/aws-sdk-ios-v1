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

#import "ElasticLoadBalancingCreateLoadBalancerRequestMarshaller.h"

@implementation ElasticLoadBalancingCreateLoadBalancerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingCreateLoadBalancerRequest *)createLoadBalancerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"CreateLoadBalancer"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[createLoadBalancerRequest delegate]];
    [request setCredentials:[createLoadBalancerRequest credentials]];
    [request setEndpoint:[createLoadBalancerRequest requestEndpoint]];
    [request setRequestTag:[createLoadBalancerRequest requestTag]];

    if (createLoadBalancerRequest != nil) {
        if (createLoadBalancerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLoadBalancerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (createLoadBalancerRequest != nil) {
        int listenersListIndex = 1;
        for (ElasticLoadBalancingListener *listenersListValue in createLoadBalancerRequest.listeners) {
            if (listenersListValue != nil) {
                if (listenersListValue.protocol != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", listenersListValue.protocol] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Listeners", listenersListIndex, @"Protocol"]];
                }
            }
            if (listenersListValue != nil) {
                if (listenersListValue.loadBalancerPort != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", listenersListValue.loadBalancerPort] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Listeners", listenersListIndex, @"LoadBalancerPort"]];
                }
            }
            if (listenersListValue != nil) {
                if (listenersListValue.instanceProtocol != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", listenersListValue.instanceProtocol] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Listeners", listenersListIndex, @"InstanceProtocol"]];
                }
            }
            if (listenersListValue != nil) {
                if (listenersListValue.instancePort != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", listenersListValue.instancePort] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Listeners", listenersListIndex, @"InstancePort"]];
                }
            }
            if (listenersListValue != nil) {
                if (listenersListValue.sSLCertificateId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", listenersListValue.sSLCertificateId] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Listeners", listenersListIndex, @"SSLCertificateId"]];
                }
            }

            listenersListIndex++;
        }
    }

    if (createLoadBalancerRequest != nil) {
        int availabilityZonesListIndex = 1;
        for (NSString *availabilityZonesListValue in createLoadBalancerRequest.availabilityZones) {
            if (availabilityZonesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", availabilityZonesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AvailabilityZones", availabilityZonesListIndex]];
            }

            availabilityZonesListIndex++;
        }
    }

    if (createLoadBalancerRequest != nil) {
        int subnetsListIndex = 1;
        for (NSString *subnetsListValue in createLoadBalancerRequest.subnets) {
            if (subnetsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", subnetsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Subnets", subnetsListIndex]];
            }

            subnetsListIndex++;
        }
    }

    if (createLoadBalancerRequest != nil) {
        int securityGroupsListIndex = 1;
        for (NSString *securityGroupsListValue in createLoadBalancerRequest.securityGroups) {
            if (securityGroupsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", securityGroupsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"SecurityGroups", securityGroupsListIndex]];
            }

            securityGroupsListIndex++;
        }
    }


    return [request autorelease];
}

@end

