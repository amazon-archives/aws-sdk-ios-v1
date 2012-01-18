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

#import "ElasticLoadBalancingDeleteLoadBalancerRequestMarshaller.h"

@implementation ElasticLoadBalancingDeleteLoadBalancerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDeleteLoadBalancerRequest *)deleteLoadBalancerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DeleteLoadBalancer"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[deleteLoadBalancerRequest delegate]];
    [request setCredentials:[deleteLoadBalancerRequest credentials]];
    [request setEndpoint:[deleteLoadBalancerRequest requestEndpoint]];
    [request setRequestTag:[deleteLoadBalancerRequest requestTag]];

    if (deleteLoadBalancerRequest != nil) {
        if (deleteLoadBalancerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteLoadBalancerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }


    return [request autorelease];
}

@end

