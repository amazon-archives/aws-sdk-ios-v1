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

#import "ElasticLoadBalancingCreateLoadBalancerPolicyRequestMarshaller.h"

@implementation ElasticLoadBalancingCreateLoadBalancerPolicyRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingCreateLoadBalancerPolicyRequest *)createLoadBalancerPolicyRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"CreateLoadBalancerPolicy"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[createLoadBalancerPolicyRequest delegate]];
    [request setCredentials:[createLoadBalancerPolicyRequest credentials]];
    [request setEndpoint:[createLoadBalancerPolicyRequest requestEndpoint]];
    [request setRequestTag:[createLoadBalancerPolicyRequest requestTag]];

    if (createLoadBalancerPolicyRequest != nil) {
        if (createLoadBalancerPolicyRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLoadBalancerPolicyRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (createLoadBalancerPolicyRequest != nil) {
        if (createLoadBalancerPolicyRequest.policyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLoadBalancerPolicyRequest.policyName] forKey:[NSString stringWithFormat:@"%@", @"PolicyName"]];
        }
    }
    if (createLoadBalancerPolicyRequest != nil) {
        if (createLoadBalancerPolicyRequest.policyTypeName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", createLoadBalancerPolicyRequest.policyTypeName] forKey:[NSString stringWithFormat:@"%@", @"PolicyTypeName"]];
        }
    }

    if (createLoadBalancerPolicyRequest != nil) {
        int policyAttributesListIndex = 1;
        for (ElasticLoadBalancingPolicyAttribute *policyAttributesListValue in createLoadBalancerPolicyRequest.policyAttributes) {
            if (policyAttributesListValue != nil) {
                if (policyAttributesListValue.attributeName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", policyAttributesListValue.attributeName] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"PolicyAttributes", policyAttributesListIndex, @"AttributeName"]];
                }
            }
            if (policyAttributesListValue != nil) {
                if (policyAttributesListValue.attributeValue != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", policyAttributesListValue.attributeValue] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"PolicyAttributes", policyAttributesListIndex, @"AttributeValue"]];
                }
            }

            policyAttributesListIndex++;
        }
    }


    return [request autorelease];
}

@end

