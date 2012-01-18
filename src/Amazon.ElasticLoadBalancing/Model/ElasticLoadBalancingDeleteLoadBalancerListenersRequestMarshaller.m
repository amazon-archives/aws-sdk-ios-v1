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

#import "ElasticLoadBalancingDeleteLoadBalancerListenersRequestMarshaller.h"

@implementation ElasticLoadBalancingDeleteLoadBalancerListenersRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDeleteLoadBalancerListenersRequest *)deleteLoadBalancerListenersRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DeleteLoadBalancerListeners"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[deleteLoadBalancerListenersRequest delegate]];
    [request setCredentials:[deleteLoadBalancerListenersRequest credentials]];
    [request setEndpoint:[deleteLoadBalancerListenersRequest requestEndpoint]];
    [request setRequestTag:[deleteLoadBalancerListenersRequest requestTag]];

    if (deleteLoadBalancerListenersRequest != nil) {
        if (deleteLoadBalancerListenersRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteLoadBalancerListenersRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (deleteLoadBalancerListenersRequest != nil) {
        int loadBalancerPortsListIndex = 1;
        for (NSNumber *loadBalancerPortsListValue in deleteLoadBalancerListenersRequest.loadBalancerPorts) {
            if (loadBalancerPortsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", loadBalancerPortsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"LoadBalancerPorts", loadBalancerPortsListIndex]];
            }

            loadBalancerPortsListIndex++;
        }
    }


    return [request autorelease];
}

@end

