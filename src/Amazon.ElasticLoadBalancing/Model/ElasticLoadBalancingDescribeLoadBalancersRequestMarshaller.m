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

#import "ElasticLoadBalancingDescribeLoadBalancersRequestMarshaller.h"

@implementation ElasticLoadBalancingDescribeLoadBalancersRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDescribeLoadBalancersRequest *)describeLoadBalancersRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DescribeLoadBalancers"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[describeLoadBalancersRequest delegate]];
    [request setCredentials:[describeLoadBalancersRequest credentials]];
    [request setEndpoint:[describeLoadBalancersRequest requestEndpoint]];
    [request setRequestTag:[describeLoadBalancersRequest requestTag]];


    if (describeLoadBalancersRequest != nil) {
        int loadBalancerNamesListIndex = 1;
        for (NSString *loadBalancerNamesListValue in describeLoadBalancersRequest.loadBalancerNames) {
            if (loadBalancerNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", loadBalancerNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"LoadBalancerNames", loadBalancerNamesListIndex]];
            }

            loadBalancerNamesListIndex++;
        }
    }
    if (describeLoadBalancersRequest != nil) {
        if (describeLoadBalancersRequest.marker != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeLoadBalancersRequest.marker] forKey:[NSString stringWithFormat:@"%@", @"Marker"]];
        }
    }


    return [request autorelease];
}

@end

