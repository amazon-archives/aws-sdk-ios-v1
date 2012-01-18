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

#import "ElasticLoadBalancingAttachLoadBalancerToSubnetsRequestMarshaller.h"

@implementation ElasticLoadBalancingAttachLoadBalancerToSubnetsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingAttachLoadBalancerToSubnetsRequest *)attachLoadBalancerToSubnetsRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"AttachLoadBalancerToSubnets"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[attachLoadBalancerToSubnetsRequest delegate]];
    [request setCredentials:[attachLoadBalancerToSubnetsRequest credentials]];
    [request setEndpoint:[attachLoadBalancerToSubnetsRequest requestEndpoint]];
    [request setRequestTag:[attachLoadBalancerToSubnetsRequest requestTag]];

    if (attachLoadBalancerToSubnetsRequest != nil) {
        if (attachLoadBalancerToSubnetsRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", attachLoadBalancerToSubnetsRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (attachLoadBalancerToSubnetsRequest != nil) {
        int subnetsListIndex = 1;
        for (NSString *subnetsListValue in attachLoadBalancerToSubnetsRequest.subnets) {
            if (subnetsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", subnetsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Subnets", subnetsListIndex]];
            }

            subnetsListIndex++;
        }
    }


    return [request autorelease];
}

@end

