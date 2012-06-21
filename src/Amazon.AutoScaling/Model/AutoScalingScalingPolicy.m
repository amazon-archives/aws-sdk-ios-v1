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

#import "AutoScalingScalingPolicy.h"


@implementation AutoScalingScalingPolicy

@synthesize autoScalingGroupName;
@synthesize policyName;
@synthesize scalingAdjustment;
@synthesize adjustmentType;
@synthesize cooldown;
@synthesize policyARN;
@synthesize alarms;
@synthesize minAdjustmentStep;


-(id)init
{
    if (self = [super init]) {
        autoScalingGroupName = nil;
        policyName           = nil;
        scalingAdjustment    = nil;
        adjustmentType       = nil;
        cooldown             = nil;
        policyARN            = nil;
        alarms               = [[NSMutableArray alloc] initWithCapacity:1];
        minAdjustmentStep    = nil;
    }

    return self;
}


-(void)addAlarm:(AutoScalingAlarm *)alarmObject
{
    if (alarms == nil) {
        alarms = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [alarms addObject:alarmObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PolicyName: %@,", policyName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ScalingAdjustment: %@,", scalingAdjustment] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AdjustmentType: %@,", adjustmentType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Cooldown: %@,", cooldown] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PolicyARN: %@,", policyARN] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Alarms: %@,", alarms] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MinAdjustmentStep: %@,", minAdjustmentStep] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [autoScalingGroupName release];
    [policyName release];
    [scalingAdjustment release];
    [adjustmentType release];
    [cooldown release];
    [policyARN release];
    [alarms release];
    [minAdjustmentStep release];

    [super dealloc];
}


@end
