/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "EC2Subnet.h"


@implementation EC2Subnet

@synthesize subnetId;
@synthesize state;
@synthesize vpcId;
@synthesize cidrBlock;
@synthesize availableIpAddressCount;
@synthesize availabilityZone;
@synthesize defaultForAz;
@synthesize defaultForAzIsSet;
@synthesize mapPublicIpOnLaunch;
@synthesize mapPublicIpOnLaunchIsSet;
@synthesize tags;


-(id)init
{
    if (self = [super init]) {
        subnetId                 = nil;
        state                    = nil;
        vpcId                    = nil;
        cidrBlock                = nil;
        availableIpAddressCount  = nil;
        availabilityZone         = nil;
        defaultForAz             = NO;
        defaultForAzIsSet        = NO;
        mapPublicIpOnLaunch      = NO;
        mapPublicIpOnLaunchIsSet = NO;
        tags                     = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addTag:(EC2Tag *)tagObject
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SubnetId: %@,", subnetId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VpcId: %@,", vpcId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CidrBlock: %@,", cidrBlock] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailableIpAddressCount: %@,", availableIpAddressCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DefaultForAz: %d,", defaultForAz] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MapPublicIpOnLaunch: %d,", mapPublicIpOnLaunch] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setDefaultForAz:(bool)theValue
{
    defaultForAz      = theValue;
    defaultForAzIsSet = YES;
}

-(void)setMapPublicIpOnLaunch:(bool)theValue
{
    mapPublicIpOnLaunch      = theValue;
    mapPublicIpOnLaunchIsSet = YES;
}


-(void)dealloc
{
    [subnetId release];
    [state release];
    [vpcId release];
    [cidrBlock release];
    [availableIpAddressCount release];
    [availabilityZone release];
    [tags release];

    [super dealloc];
}


@end
