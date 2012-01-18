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

#import "ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequestMarshaller.h"

@implementation ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequest *)setLoadBalancerPoliciesForBackendServerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"SetLoadBalancerPoliciesForBackendServer"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[setLoadBalancerPoliciesForBackendServerRequest delegate]];
    [request setCredentials:[setLoadBalancerPoliciesForBackendServerRequest credentials]];
    [request setEndpoint:[setLoadBalancerPoliciesForBackendServerRequest requestEndpoint]];
    [request setRequestTag:[setLoadBalancerPoliciesForBackendServerRequest requestTag]];

    if (setLoadBalancerPoliciesForBackendServerRequest != nil) {
        if (setLoadBalancerPoliciesForBackendServerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setLoadBalancerPoliciesForBackendServerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (setLoadBalancerPoliciesForBackendServerRequest != nil) {
        if (setLoadBalancerPoliciesForBackendServerRequest.instancePort != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setLoadBalancerPoliciesForBackendServerRequest.instancePort] forKey:[NSString stringWithFormat:@"%@", @"InstancePort"]];
        }
    }

    if (setLoadBalancerPoliciesForBackendServerRequest != nil) {
        int policyNamesListIndex = 1;

        if ([setLoadBalancerPoliciesForBackendServerRequest.policyNames count] == 0) {
            [request setParameterValue:@"" forKey:@"PolicyNames"];
        }
        for (NSString *policyNamesListValue in setLoadBalancerPoliciesForBackendServerRequest.policyNames) {
            if (policyNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", policyNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"PolicyNames", policyNamesListIndex]];
            }

            policyNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

