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

#import "ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequestMarshaller.h"

@implementation ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequest *)deregisterInstancesFromLoadBalancerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"DeregisterInstancesFromLoadBalancer"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[deregisterInstancesFromLoadBalancerRequest delegate]];
    [request setCredentials:[deregisterInstancesFromLoadBalancerRequest credentials]];
    [request setEndpoint:[deregisterInstancesFromLoadBalancerRequest requestEndpoint]];
    [request setRequestTag:[deregisterInstancesFromLoadBalancerRequest requestTag]];

    if (deregisterInstancesFromLoadBalancerRequest != nil) {
        if (deregisterInstancesFromLoadBalancerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deregisterInstancesFromLoadBalancerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (deregisterInstancesFromLoadBalancerRequest != nil) {
        int instancesListIndex = 1;
        for (ElasticLoadBalancingInstance *instancesListValue in deregisterInstancesFromLoadBalancerRequest.instances) {
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

