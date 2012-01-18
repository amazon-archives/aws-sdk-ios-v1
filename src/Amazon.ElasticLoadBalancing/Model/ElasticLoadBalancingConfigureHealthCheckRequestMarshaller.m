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

#import "ElasticLoadBalancingConfigureHealthCheckRequestMarshaller.h"

@implementation ElasticLoadBalancingConfigureHealthCheckRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingConfigureHealthCheckRequest *)configureHealthCheckRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"ConfigureHealthCheck"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[configureHealthCheckRequest delegate]];
    [request setCredentials:[configureHealthCheckRequest credentials]];
    [request setEndpoint:[configureHealthCheckRequest requestEndpoint]];
    [request setRequestTag:[configureHealthCheckRequest requestTag]];

    if (configureHealthCheckRequest != nil) {
        if (configureHealthCheckRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", configureHealthCheckRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (configureHealthCheckRequest != nil) {
        ElasticLoadBalancingHealthCheck *healthCheck = configureHealthCheckRequest.healthCheck;
        if (healthCheck != nil) {
            if (healthCheck.target != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", healthCheck.target] forKey:[NSString stringWithFormat:@"%@.%@", @"HealthCheck", @"Target"]];
            }
        }
        if (healthCheck != nil) {
            if (healthCheck.interval != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", healthCheck.interval] forKey:[NSString stringWithFormat:@"%@.%@", @"HealthCheck", @"Interval"]];
            }
        }
        if (healthCheck != nil) {
            if (healthCheck.timeout != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", healthCheck.timeout] forKey:[NSString stringWithFormat:@"%@.%@", @"HealthCheck", @"Timeout"]];
            }
        }
        if (healthCheck != nil) {
            if (healthCheck.unhealthyThreshold != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", healthCheck.unhealthyThreshold] forKey:[NSString stringWithFormat:@"%@.%@", @"HealthCheck", @"UnhealthyThreshold"]];
            }
        }
        if (healthCheck != nil) {
            if (healthCheck.healthyThreshold != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", healthCheck.healthyThreshold] forKey:[NSString stringWithFormat:@"%@.%@", @"HealthCheck", @"HealthyThreshold"]];
            }
        }
    }


    return [request autorelease];
}

@end

