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

#import "ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequestMarshaller.h"

@implementation ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequest *)detachLoadBalancerFromSubnetsRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DetachLoadBalancerFromSubnets"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[detachLoadBalancerFromSubnetsRequest delegate]];
    [request setCredentials:[detachLoadBalancerFromSubnetsRequest credentials]];
    [request setEndpoint:[detachLoadBalancerFromSubnetsRequest requestEndpoint]];
    [request setRequestTag:[detachLoadBalancerFromSubnetsRequest requestTag]];

    if (detachLoadBalancerFromSubnetsRequest != nil) {
        if (detachLoadBalancerFromSubnetsRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", detachLoadBalancerFromSubnetsRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (detachLoadBalancerFromSubnetsRequest != nil) {
        int subnetsListIndex = 1;
        for (NSString *subnetsListValue in detachLoadBalancerFromSubnetsRequest.subnets) {
            if (subnetsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", subnetsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Subnets", subnetsListIndex]];
            }

            subnetsListIndex++;
        }
    }


    return [request autorelease];
}

@end

