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

#import "AutoScalingAutoScalingGroup.h"


@implementation AutoScalingAutoScalingGroup

@synthesize autoScalingGroupName;
@synthesize autoScalingGroupARN;
@synthesize launchConfigurationName;
@synthesize minSize;
@synthesize maxSize;
@synthesize desiredCapacity;
@synthesize defaultCooldown;
@synthesize availabilityZones;
@synthesize loadBalancerNames;
@synthesize healthCheckType;
@synthesize healthCheckGracePeriod;
@synthesize instances;
@synthesize createdTime;
@synthesize suspendedProcesses;
@synthesize placementGroup;
@synthesize vPCZoneIdentifier;
@synthesize enabledMetrics;
@synthesize status;
@synthesize tags;
@synthesize terminationPolicies;


-(id)init
{
    if (self = [super init]) {
        autoScalingGroupName    = nil;
        autoScalingGroupARN     = nil;
        launchConfigurationName = nil;
        minSize                 = nil;
        maxSize                 = nil;
        desiredCapacity         = nil;
        defaultCooldown         = nil;
        availabilityZones       = [[NSMutableArray alloc] initWithCapacity:1];
        loadBalancerNames       = [[NSMutableArray alloc] initWithCapacity:1];
        healthCheckType         = nil;
        healthCheckGracePeriod  = nil;
        instances               = [[NSMutableArray alloc] initWithCapacity:1];
        createdTime             = nil;
        suspendedProcesses      = [[NSMutableArray alloc] initWithCapacity:1];
        placementGroup          = nil;
        vPCZoneIdentifier       = nil;
        enabledMetrics          = [[NSMutableArray alloc] initWithCapacity:1];
        status                  = nil;
        tags                    = [[NSMutableArray alloc] initWithCapacity:1];
        terminationPolicies     = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addAvailabilityZone:(NSString *)availabilityZoneObject
{
    if (availabilityZones == nil) {
        availabilityZones = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [availabilityZones addObject:availabilityZoneObject];
}

-(void)addLoadBalancerName:(NSString *)loadBalancerNameObject
{
    if (loadBalancerNames == nil) {
        loadBalancerNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [loadBalancerNames addObject:loadBalancerNameObject];
}

-(void)addInstance:(AutoScalingInstance *)instanceObject
{
    if (instances == nil) {
        instances = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instances addObject:instanceObject];
}

-(void)addSuspendedProcesse:(AutoScalingSuspendedProcess *)suspendedProcesseObject
{
    if (suspendedProcesses == nil) {
        suspendedProcesses = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [suspendedProcesses addObject:suspendedProcesseObject];
}

-(void)addEnabledMetric:(AutoScalingEnabledMetric *)enabledMetricObject
{
    if (enabledMetrics == nil) {
        enabledMetrics = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [enabledMetrics addObject:enabledMetricObject];
}

-(void)addTag:(AutoScalingTagDescription *)tagObject
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}

-(void)addTerminationPolicy:(NSString *)terminationPolicyObject
{
    if (terminationPolicies == nil) {
        terminationPolicies = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [terminationPolicies addObject:terminationPolicyObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupARN: %@,", autoScalingGroupARN] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchConfigurationName: %@,", launchConfigurationName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MinSize: %@,", minSize] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MaxSize: %@,", maxSize] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DesiredCapacity: %@,", desiredCapacity] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DefaultCooldown: %@,", defaultCooldown] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZones: %@,", availabilityZones] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerNames: %@,", loadBalancerNames] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HealthCheckType: %@,", healthCheckType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HealthCheckGracePeriod: %@,", healthCheckGracePeriod] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Instances: %@,", instances] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreatedTime: %@,", createdTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SuspendedProcesses: %@,", suspendedProcesses] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PlacementGroup: %@,", placementGroup] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VPCZoneIdentifier: %@,", vPCZoneIdentifier] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"EnabledMetrics: %@,", enabledMetrics] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Status: %@,", status] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TerminationPolicies: %@,", terminationPolicies] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [autoScalingGroupName release];
    [autoScalingGroupARN release];
    [launchConfigurationName release];
    [minSize release];
    [maxSize release];
    [desiredCapacity release];
    [defaultCooldown release];
    [availabilityZones release];
    [loadBalancerNames release];
    [healthCheckType release];
    [healthCheckGracePeriod release];
    [instances release];
    [createdTime release];
    [suspendedProcesses release];
    [placementGroup release];
    [vPCZoneIdentifier release];
    [enabledMetrics release];
    [status release];
    [tags release];
    [terminationPolicies release];

    [super dealloc];
}


@end
