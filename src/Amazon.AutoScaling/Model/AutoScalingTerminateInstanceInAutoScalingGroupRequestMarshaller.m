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

#import "AutoScalingTerminateInstanceInAutoScalingGroupRequestMarshaller.h"

@implementation AutoScalingTerminateInstanceInAutoScalingGroupRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingTerminateInstanceInAutoScalingGroupRequest *)terminateInstanceInAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"TerminateInstanceInAutoScalingGroup"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[terminateInstanceInAutoScalingGroupRequest delegate]];
    [request setCredentials:[terminateInstanceInAutoScalingGroupRequest credentials]];
    [request setEndpoint:[terminateInstanceInAutoScalingGroupRequest requestEndpoint]];
    [request setRequestTag:[terminateInstanceInAutoScalingGroupRequest requestTag]];

    if (terminateInstanceInAutoScalingGroupRequest != nil) {
        if (terminateInstanceInAutoScalingGroupRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", terminateInstanceInAutoScalingGroupRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }
    if (terminateInstanceInAutoScalingGroupRequest != nil) {
        if (terminateInstanceInAutoScalingGroupRequest.shouldDecrementDesiredCapacityIsSet) {
            [request setParameterValue:(terminateInstanceInAutoScalingGroupRequest.shouldDecrementDesiredCapacity ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"ShouldDecrementDesiredCapacity"]];
        }
    }


    return [request autorelease];
}

@end

