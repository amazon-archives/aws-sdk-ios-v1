/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "ElasticLoadBalancingLoadBalancerDescription.h"


@implementation ElasticLoadBalancingLoadBalancerDescription

@synthesize loadBalancerName;
@synthesize dNSName;
@synthesize listenerDescriptions;
@synthesize policies;
@synthesize availabilityZones;
@synthesize instances;
@synthesize healthCheck;
@synthesize createdTime;


-(id)init
{
    if (self = [super init]) {
        loadBalancerName     = nil;
        dNSName              = nil;
        listenerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
        policies             = nil;
        availabilityZones    = [[NSMutableArray alloc] initWithCapacity:1];
        instances            = [[NSMutableArray alloc] initWithCapacity:1];
        healthCheck          = nil;
        createdTime          = nil;
    }

    return self;
}


-(void)addListenerDescription:(ElasticLoadBalancingListenerDescription *)listenerDescription
{
    if (listenerDescriptions == nil) {
        listenerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [listenerDescriptions addObject:listenerDescription];
}

-(void)addInstance:(ElasticLoadBalancingInstance *)instance
{
    if (instances == nil) {
        instances = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instances addObject:instance];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerName: %@,", loadBalancerName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DNSName: %@,", dNSName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ListenerDescriptions: %@,", listenerDescriptions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Policies: %@,", policies] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZones: %@,", availabilityZones] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Instances: %@,", instances] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HealthCheck: %@,", healthCheck] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreatedTime: %@,", createdTime] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [loadBalancerName release];
    [dNSName release];
    [listenerDescriptions release];
    [policies release];
    [availabilityZones release];
    [instances release];
    [healthCheck release];
    [createdTime release];

    [super dealloc];
}


@end
