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

#import "ElasticLoadBalancingModifyLoadBalancerAttributesRequestMarshaller.h"

@implementation ElasticLoadBalancingModifyLoadBalancerAttributesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingModifyLoadBalancerAttributesRequest *)modifyLoadBalancerAttributesRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"ModifyLoadBalancerAttributes"           forKey:@"Action"];
    [request setParameterValue:@"2012-06-01"   forKey:@"Version"];

    [request setDelegate:[modifyLoadBalancerAttributesRequest delegate]];
    [request setCredentials:[modifyLoadBalancerAttributesRequest credentials]];
    [request setEndpoint:[modifyLoadBalancerAttributesRequest requestEndpoint]];
    [request setRequestTag:[modifyLoadBalancerAttributesRequest requestTag]];

    if (modifyLoadBalancerAttributesRequest != nil) {
        if (modifyLoadBalancerAttributesRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", modifyLoadBalancerAttributesRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (modifyLoadBalancerAttributesRequest != nil) {
        ElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes = modifyLoadBalancerAttributesRequest.loadBalancerAttributes;
        if (loadBalancerAttributes != nil) {
            ElasticLoadBalancingCrossZoneLoadBalancing *crossZoneLoadBalancing = loadBalancerAttributes.crossZoneLoadBalancing;
            if (crossZoneLoadBalancing != nil) {
                if (crossZoneLoadBalancing.enabledIsSet) {
                    [request setParameterValue:(crossZoneLoadBalancing.enabled ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@.%@.%@", @"LoadBalancerAttributes", @"CrossZoneLoadBalancing", @"Enabled"]];
                }
            }
        }
    }


    return [request autorelease];
}

@end

