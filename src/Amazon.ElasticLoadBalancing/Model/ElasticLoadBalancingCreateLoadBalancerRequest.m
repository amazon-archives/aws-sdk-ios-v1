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

#import "ElasticLoadBalancingCreateLoadBalancerRequest.h"


@implementation ElasticLoadBalancingCreateLoadBalancerRequest

@synthesize loadBalancerName;
@synthesize listeners;
@synthesize availabilityZones;
@synthesize subnets;
@synthesize securityGroups;


-(id)init
{
    if (self = [super init]) {
        loadBalancerName  = nil;
        listeners         = [[NSMutableArray alloc] initWithCapacity:1];
        availabilityZones = [[NSMutableArray alloc] initWithCapacity:1];
        subnets           = [[NSMutableArray alloc] initWithCapacity:1];
        securityGroups    = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName
{
    if (self = [self init]) {
        self.loadBalancerName = theLoadBalancerName;
    }

    return self;
}

-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andListeners:(NSMutableArray *)theListeners andAvailabilityZones:(NSMutableArray *)theAvailabilityZones
{
    if (self = [self init]) {
        self.loadBalancerName  = theLoadBalancerName;
        self.listeners         = theListeners;
        self.availabilityZones = theAvailabilityZones;
    }

    return self;
}


-(void)addListener:(ElasticLoadBalancingListener *)listenerObject
{
    if (listeners == nil) {
        listeners = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [listeners addObject:listenerObject];
}

-(void)addAvailabilityZone:(NSString *)availabilityZoneObject
{
    if (availabilityZones == nil) {
        availabilityZones = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [availabilityZones addObject:availabilityZoneObject];
}

-(void)addSubnet:(NSString *)subnetObject
{
    if (subnets == nil) {
        subnets = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [subnets addObject:subnetObject];
}

-(void)addSecurityGroup:(NSString *)securityGroupObject
{
    if (securityGroups == nil) {
        securityGroups = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [securityGroups addObject:securityGroupObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerName: %@,", loadBalancerName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Listeners: %@,", listeners] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZones: %@,", availabilityZones] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Subnets: %@,", subnets] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SecurityGroups: %@,", securityGroups] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [loadBalancerName release];
    [listeners release];
    [availabilityZones release];
    [subnets release];
    [securityGroups release];

    [super dealloc];
}


@end
