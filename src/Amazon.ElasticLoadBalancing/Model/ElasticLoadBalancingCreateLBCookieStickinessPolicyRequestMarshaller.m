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

#import "ElasticLoadBalancingCreateLBCookieStickinessPolicyRequestMarshaller.h"

@implementation ElasticLoadBalancingCreateLBCookieStickinessPolicyRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingCreateLBCookieStickinessPolicyRequest *)createLBCookieStickinessPolicyRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"CreateLBCookieStickinessPolicy"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[createLBCookieStickinessPolicyRequest delegate]];
    [request setCredentials:[createLBCookieStickinessPolicyRequest credentials]];
    [request setEndpoint:[createLBCookieStickinessPolicyRequest requestEndpoint]];
    [request setRequestTag:[createLBCookieStickinessPolicyRequest requestTag]];

    if (createLBCookieStickinessPolicyRequest != nil) {
        if (createLBCookieStickinessPolicyRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLBCookieStickinessPolicyRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (createLBCookieStickinessPolicyRequest != nil) {
        if (createLBCookieStickinessPolicyRequest.policyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLBCookieStickinessPolicyRequest.policyName] forKey:[NSString stringWithFormat:@"%@", @"PolicyName"]];
        }
    }
    if (createLBCookieStickinessPolicyRequest != nil) {
        if (createLBCookieStickinessPolicyRequest.cookieExpirationPeriod != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLBCookieStickinessPolicyRequest.cookieExpirationPeriod] forKey:[NSString stringWithFormat:@"%@", @"CookieExpirationPeriod"]];
        }
    }


    return [request autorelease];
}

@end

