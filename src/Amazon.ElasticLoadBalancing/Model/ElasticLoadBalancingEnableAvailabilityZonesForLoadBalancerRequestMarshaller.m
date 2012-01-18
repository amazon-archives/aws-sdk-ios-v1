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

#import "ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequestMarshaller.h"

@implementation ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequest *)enableAvailabilityZonesForLoadBalancerRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"EnableAvailabilityZonesForLoadBalancer"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[enableAvailabilityZonesForLoadBalancerRequest delegate]];
    [request setCredentials:[enableAvailabilityZonesForLoadBalancerRequest credentials]];
    [request setEndpoint:[enableAvailabilityZonesForLoadBalancerRequest requestEndpoint]];
    [request setRequestTag:[enableAvailabilityZonesForLoadBalancerRequest requestTag]];

    if (enableAvailabilityZonesForLoadBalancerRequest != nil) {
        if (enableAvailabilityZonesForLoadBalancerRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", enableAvailabilityZonesForLoadBalancerRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }

    if (enableAvailabilityZonesForLoadBalancerRequest != nil) {
        int availabilityZonesListIndex = 1;
        for (NSString *availabilityZonesListValue in enableAvailabilityZonesForLoadBalancerRequest.availabilityZones) {
            if (availabilityZonesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", availabilityZonesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AvailabilityZones", availabilityZonesListIndex]];
            }

            availabilityZonesListIndex++;
        }
    }


    return [request autorelease];
}

@end

