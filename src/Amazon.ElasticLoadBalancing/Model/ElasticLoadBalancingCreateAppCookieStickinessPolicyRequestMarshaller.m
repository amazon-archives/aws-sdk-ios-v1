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

#import "ElasticLoadBalancingCreateAppCookieStickinessPolicyRequestMarshaller.h"

@implementation ElasticLoadBalancingCreateAppCookieStickinessPolicyRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingCreateAppCookieStickinessPolicyRequest *)createAppCookieStickinessPolicyRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"CreateAppCookieStickinessPolicy"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[createAppCookieStickinessPolicyRequest delegate]];
    [request setCredentials:[createAppCookieStickinessPolicyRequest credentials]];
    [request setEndpoint:[createAppCookieStickinessPolicyRequest requestEndpoint]];
    [request setRequestTag:[createAppCookieStickinessPolicyRequest requestTag]];

    if (createAppCookieStickinessPolicyRequest != nil) {
        if (createAppCookieStickinessPolicyRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAppCookieStickinessPolicyRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (createAppCookieStickinessPolicyRequest != nil) {
        if (createAppCookieStickinessPolicyRequest.policyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAppCookieStickinessPolicyRequest.policyName] forKey:[NSString stringWithFormat:@"%@", @"PolicyName"]];
        }
    }
    if (createAppCookieStickinessPolicyRequest != nil) {
        if (createAppCookieStickinessPolicyRequest.cookieName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createAppCookieStickinessPolicyRequest.cookieName] forKey:[NSString stringWithFormat:@"%@", @"CookieName"]];
        }
    }


    return [request autorelease];
}

@end

