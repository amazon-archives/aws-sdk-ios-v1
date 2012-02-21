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

#import "AutoScalingSetInstanceHealthRequestMarshaller.h"

@implementation AutoScalingSetInstanceHealthRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingSetInstanceHealthRequest *)setInstanceHealthRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"SetInstanceHealth"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[setInstanceHealthRequest delegate]];
    [request setCredentials:[setInstanceHealthRequest credentials]];
    [request setEndpoint:[setInstanceHealthRequest requestEndpoint]];
    [request setRequestTag:[setInstanceHealthRequest requestTag]];

    if (setInstanceHealthRequest != nil) {
        if (setInstanceHealthRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setInstanceHealthRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (setInstanceHealthRequest != nil) {
        if (setInstanceHealthRequest.healthStatus != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setInstanceHealthRequest.healthStatus] forKey:[NSString stringWithFormat:@"%@", @"HealthStatus"]];
        }
    }
    if (setInstanceHealthRequest != nil) {
        if (setInstanceHealthRequest.shouldRespectGracePeriodIsSet) {
            [request setParameterValue:(setInstanceHealthRequest.shouldRespectGracePeriod ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"ShouldRespectGracePeriod"]];
        }
    }


    return [request autorelease];
}

@end

