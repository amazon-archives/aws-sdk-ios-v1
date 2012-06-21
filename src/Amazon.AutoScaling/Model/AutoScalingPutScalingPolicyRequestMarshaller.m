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

#import "AutoScalingPutScalingPolicyRequestMarshaller.h"

@implementation AutoScalingPutScalingPolicyRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingPutScalingPolicyRequest *)putScalingPolicyRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"PutScalingPolicy"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[putScalingPolicyRequest delegate]];
    [request setCredentials:[putScalingPolicyRequest credentials]];
    [request setEndpoint:[putScalingPolicyRequest requestEndpoint]];
    [request setRequestTag:[putScalingPolicyRequest requestTag]];

    if (putScalingPolicyRequest != nil) {
        if (putScalingPolicyRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScalingPolicyRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (putScalingPolicyRequest != nil) {
        if (putScalingPolicyRequest.policyName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScalingPolicyRequest.policyName] forKey:[NSString stringWithFormat:@"%@", @"PolicyName"]];
        }
    }
    if (putScalingPolicyRequest != nil) {
        if (putScalingPolicyRequest.scalingAdjustment != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScalingPolicyRequest.scalingAdjustment] forKey:[NSString stringWithFormat:@"%@", @"ScalingAdjustment"]];
        }
    }
    if (putScalingPolicyRequest != nil) {
        if (putScalingPolicyRequest.adjustmentType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScalingPolicyRequest.adjustmentType] forKey:[NSString stringWithFormat:@"%@", @"AdjustmentType"]];
        }
    }
    if (putScalingPolicyRequest != nil) {
        if (putScalingPolicyRequest.cooldown != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScalingPolicyRequest.cooldown] forKey:[NSString stringWithFormat:@"%@", @"Cooldown"]];
        }
    }
    if (putScalingPolicyRequest != nil) {
        if (putScalingPolicyRequest.minAdjustmentStep != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScalingPolicyRequest.minAdjustmentStep] forKey:[NSString stringWithFormat:@"%@", @"MinAdjustmentStep"]];
        }
    }


    return [request autorelease];
}

@end

