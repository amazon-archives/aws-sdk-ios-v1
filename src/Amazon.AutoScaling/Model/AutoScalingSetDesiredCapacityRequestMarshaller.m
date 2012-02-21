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

#import "AutoScalingSetDesiredCapacityRequestMarshaller.h"

@implementation AutoScalingSetDesiredCapacityRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingSetDesiredCapacityRequest *)setDesiredCapacityRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"SetDesiredCapacity"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[setDesiredCapacityRequest delegate]];
    [request setCredentials:[setDesiredCapacityRequest credentials]];
    [request setEndpoint:[setDesiredCapacityRequest requestEndpoint]];
    [request setRequestTag:[setDesiredCapacityRequest requestTag]];

    if (setDesiredCapacityRequest != nil) {
        if (setDesiredCapacityRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setDesiredCapacityRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (setDesiredCapacityRequest != nil) {
        if (setDesiredCapacityRequest.desiredCapacity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setDesiredCapacityRequest.desiredCapacity] forKey:[NSString stringWithFormat:@"%@", @"DesiredCapacity"]];
        }
    }
    if (setDesiredCapacityRequest != nil) {
        if (setDesiredCapacityRequest.honorCooldownIsSet) {
            [request setParameterValue:(setDesiredCapacityRequest.honorCooldown ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"HonorCooldown"]];
        }
    }


    return [request autorelease];
}

@end

