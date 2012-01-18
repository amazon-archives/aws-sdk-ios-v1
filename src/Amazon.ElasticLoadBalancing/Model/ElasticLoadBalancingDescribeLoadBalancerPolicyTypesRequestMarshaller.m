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

#import "ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequestMarshaller.h"

@implementation ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequest *)describeLoadBalancerPolicyTypesRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DescribeLoadBalancerPolicyTypes"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[describeLoadBalancerPolicyTypesRequest delegate]];
    [request setCredentials:[describeLoadBalancerPolicyTypesRequest credentials]];
    [request setEndpoint:[describeLoadBalancerPolicyTypesRequest requestEndpoint]];
    [request setRequestTag:[describeLoadBalancerPolicyTypesRequest requestTag]];


    if (describeLoadBalancerPolicyTypesRequest != nil) {
        int policyTypeNamesListIndex = 1;
        for (NSString *policyTypeNamesListValue in describeLoadBalancerPolicyTypesRequest.policyTypeNames) {
            if (policyTypeNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", policyTypeNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"PolicyTypeNames", policyTypeNamesListIndex]];
            }

            policyTypeNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

