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

#import "ElasticLoadBalancingDescribeLoadBalancerPoliciesRequestMarshaller.h"

@implementation ElasticLoadBalancingDescribeLoadBalancerPoliciesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDescribeLoadBalancerPoliciesRequest *)describeLoadBalancerPoliciesRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DescribeLoadBalancerPolicies"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[describeLoadBalancerPoliciesRequest delegate]];
    [request setCredentials:[describeLoadBalancerPoliciesRequest credentials]];
    [request setEndpoint:[describeLoadBalancerPoliciesRequest requestEndpoint]];
    [request setRequestTag:[describeLoadBalancerPoliciesRequest requestTag]];

    if (describeLoadBalancerPoliciesRequest != nil) {
        if (describeLoadBalancerPoliciesRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeLoadBalancerPoliciesRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (describeLoadBalancerPoliciesRequest != nil) {
        int policyNamesListIndex = 1;
        for (NSString *policyNamesListValue in describeLoadBalancerPoliciesRequest.policyNames) {
            if (policyNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", policyNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"PolicyNames", policyNamesListIndex]];
            }

            policyNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

