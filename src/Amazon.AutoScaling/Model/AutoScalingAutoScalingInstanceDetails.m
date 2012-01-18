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

#import "AutoScalingAutoScalingInstanceDetails.h"


@implementation AutoScalingAutoScalingInstanceDetails

@synthesize instanceId;
@synthesize autoScalingGroupName;
@synthesize availabilityZone;
@synthesize lifecycleState;
@synthesize healthStatus;
@synthesize launchConfigurationName;


-(id)init
{
    if (self = [super init]) {
        instanceId              = nil;
        autoScalingGroupName    = nil;
        availabilityZone        = nil;
        lifecycleState          = nil;
        healthStatus            = nil;
        launchConfigurationName = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LifecycleState: %@,", lifecycleState] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HealthStatus: %@,", healthStatus] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchConfigurationName: %@,", launchConfigurationName] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [instanceId release];
    [autoScalingGroupName release];
    [availabilityZone release];
    [lifecycleState release];
    [healthStatus release];
    [launchConfigurationName release];

    [super dealloc];
}


@end
