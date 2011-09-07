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
@synthesize canonicalHostedZoneName;
@synthesize canonicalHostedZoneNameID;
@synthesize listenerDescriptions;
@synthesize policies;
@synthesize backendServerDescriptions;
@synthesize availabilityZones;
@synthesize instances;
@synthesize healthCheck;
@synthesize sourceSecurityGroup;
@synthesize createdTime;


-(id)init
{
    if (self = [super init]) {
        loadBalancerName          = nil;
        dNSName                   = nil;
        canonicalHostedZoneName   = nil;
        canonicalHostedZoneNameID = nil;
        listenerDescriptions      = [[NSMutableArray alloc] initWithCapacity:1];
        policies                  = nil;
        backendServerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
        availabilityZones         = [[NSMutableArray alloc] initWithCapacity:1];
        instances                 = [[NSMutableArray alloc] initWithCapacity:1];
        healthCheck               = nil;
        sourceSecurityGroup       = nil;
        createdTime               = nil;
    }

    return self;
}


-(void)addListenerDescription:(ElasticLoadBalancingListenerDescription *)listenerDescriptionObject
{
    if (listenerDescriptions == nil) {
        listenerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [listenerDescriptions addObject:listenerDescriptionObject];
}

-(void)addBackendServerDescription:(ElasticLoadBalancingBackendServerDescription *)backendServerDescriptionObject
{
    if (backendServerDescriptions == nil) {
        backendServerDescriptions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [backendServerDescriptions addObject:backendServerDescriptionObject];
}

-(void)addInstance:(ElasticLoadBalancingInstance *)instanceObject
{
    if (instances == nil) {
        instances = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instances addObject:instanceObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerName: %@,", loadBalancerName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DNSName: %@,", dNSName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CanonicalHostedZoneName: %@,", canonicalHostedZoneName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CanonicalHostedZoneNameID: %@,", canonicalHostedZoneNameID] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ListenerDescriptions: %@,", listenerDescriptions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Policies: %@,", policies] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BackendServerDescriptions: %@,", backendServerDescriptions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZones: %@,", availabilityZones] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Instances: %@,", instances] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HealthCheck: %@,", healthCheck] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceSecurityGroup: %@,", sourceSecurityGroup] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreatedTime: %@,", createdTime] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [loadBalancerName release];
    [dNSName release];
    [canonicalHostedZoneName release];
    [canonicalHostedZoneNameID release];
    [listenerDescriptions release];
    [policies release];
    [backendServerDescriptions release];
    [availabilityZones release];
    [instances release];
    [healthCheck release];
    [sourceSecurityGroup release];
    [createdTime release];

    [super dealloc];
}


@end
