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

#import "ElasticLoadBalancingDescribeInstanceHealthRequestMarshaller.h"

@implementation ElasticLoadBalancingDescribeInstanceHealthRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDescribeInstanceHealthRequest *)describeInstanceHealthRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DescribeInstanceHealth"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[describeInstanceHealthRequest delegate]];
    [request setCredentials:[describeInstanceHealthRequest credentials]];
    [request setEndpoint:[describeInstanceHealthRequest requestEndpoint]];
    [request setRequestTag:[describeInstanceHealthRequest requestTag]];

    if (describeInstanceHealthRequest != nil) {
        if (describeInstanceHealthRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeInstanceHealthRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (describeInstanceHealthRequest != nil) {
        int instancesListIndex = 1;
        for (ElasticLoadBalancingInstance *instancesListValue in describeInstanceHealthRequest.instances) {
            if (instancesListValue != nil) {
                if (instancesListValue.instanceId != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", instancesListValue.instanceId] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Instances", instancesListIndex, @"InstanceId"]];
                }
            }

            instancesListIndex++;
        }
    }


    return [request autorelease];
}

@end

