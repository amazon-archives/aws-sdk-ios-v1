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

#import "ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequestMarshaller.h"

@implementation ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest *)setLoadBalancerPoliciesOfListenerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"SetLoadBalancerPoliciesOfListener"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[setLoadBalancerPoliciesOfListenerRequest delegate]];
    [request setCredentials:[setLoadBalancerPoliciesOfListenerRequest credentials]];
    [request setEndpoint:[setLoadBalancerPoliciesOfListenerRequest requestEndpoint]];
    [request setRequestTag:[setLoadBalancerPoliciesOfListenerRequest requestTag]];

    if (setLoadBalancerPoliciesOfListenerRequest != nil) {
        if (setLoadBalancerPoliciesOfListenerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setLoadBalancerPoliciesOfListenerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (setLoadBalancerPoliciesOfListenerRequest != nil) {
        if (setLoadBalancerPoliciesOfListenerRequest.loadBalancerPort != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setLoadBalancerPoliciesOfListenerRequest.loadBalancerPort] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerPort"]];
        }
    }

    if (setLoadBalancerPoliciesOfListenerRequest != nil) {
        int policyNamesListIndex = 1;

        if ([setLoadBalancerPoliciesOfListenerRequest.policyNames count] == 0) {
            [request setParameterValue:@"" forKey:@"PolicyNames"];
        }
        for (NSString *policyNamesListValue in setLoadBalancerPoliciesOfListenerRequest.policyNames) {
            if (policyNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", policyNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"PolicyNames", policyNamesListIndex]];
            }

            policyNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

