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

#import "ElasticLoadBalancingDeleteLoadBalancerPolicyRequestMarshaller.h"

@implementation ElasticLoadBalancingDeleteLoadBalancerPolicyRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDeleteLoadBalancerPolicyRequest *)deleteLoadBalancerPolicyRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DeleteLoadBalancerPolicy"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[deleteLoadBalancerPolicyRequest delegate]];
    [request setCredentials:[deleteLoadBalancerPolicyRequest credentials]];
    [request setEndpoint:[deleteLoadBalancerPolicyRequest requestEndpoint]];
    [request setRequestTag:[deleteLoadBalancerPolicyRequest requestTag]];

    if (deleteLoadBalancerPolicyRequest != nil) {
        if (deleteLoadBalancerPolicyRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteLoadBalancerPolicyRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (deleteLoadBalancerPolicyRequest != nil) {
        if (deleteLoadBalancerPolicyRequest.policyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteLoadBalancerPolicyRequest.policyName] forKey:[NSString stringWithFormat:@"%@", @"PolicyName"]];
        }
    }


    return [request autorelease];
}

@end

