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

#import "ElasticLoadBalancingCreateLoadBalancerListenersRequestMarshaller.h"

@implementation ElasticLoadBalancingCreateLoadBalancerListenersRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingCreateLoadBalancerListenersRequest *)createLoadBalancerListenersRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"CreateLoadBalancerListeners"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[createLoadBalancerListenersRequest delegate]];
    [request setCredentials:[createLoadBalancerListenersRequest credentials]];
    [request setEndpoint:[createLoadBalancerListenersRequest requestEndpoint]];
    [request setRequestTag:[createLoadBalancerListenersRequest requestTag]];

    if (createLoadBalancerListenersRequest != nil) {
        if (createLoadBalancerListenersRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLoadBalancerListenersRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (createLoadBalancerListenersRequest != nil) {
        int listenersListIndex = 1;
        for (ElasticLoadBalancingListener *listenersListValue in createLoadBalancerListenersRequest.listeners) {
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


    return [request autorelease];
}

@end

