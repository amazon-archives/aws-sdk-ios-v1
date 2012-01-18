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

#import "EC2SpotInstanceRequest.h"


@implementation EC2SpotInstanceRequest

@synthesize spotInstanceRequestId;
@synthesize spotPrice;
@synthesize type;
@synthesize state;
@synthesize fault;
@synthesize validFrom;
@synthesize validUntil;
@synthesize launchGroup;
@synthesize availabilityZoneGroup;
@synthesize launchSpecification;
@synthesize instanceId;
@synthesize createTime;
@synthesize productDescription;
@synthesize tags;
@synthesize launchedAvailabilityZone;


-(id)init
{
    if (self = [super init]) {
        spotInstanceRequestId    = nil;
        spotPrice                = nil;
        type                     = nil;
        state                    = nil;
        fault                    = nil;
        validFrom                = nil;
        validUntil               = nil;
        launchGroup              = nil;
        availabilityZoneGroup    = nil;
        launchSpecification      = nil;
        instanceId               = nil;
        createTime               = nil;
        productDescription       = nil;
        tags                     = [[NSMutableArray alloc] initWithCapacity:1];
        launchedAvailabilityZone = nil;
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SpotInstanceRequestId: %@,", spotInstanceRequestId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SpotPrice: %@,", spotPrice] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Type: %@,", type] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Fault: %@,", fault] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ValidFrom: %@,", validFrom] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ValidUntil: %@,", validUntil] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchGroup: %@,", launchGroup] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZoneGroup: %@,", availabilityZoneGroup] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchSpecification: %@,", launchSpecification] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreateTime: %@,", createTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductDescription: %@,", productDescription] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LaunchedAvailabilityZone: %@,", launchedAvailabilityZone] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [spotInstanceRequestId release];
    [spotPrice release];
    [type release];
    [state release];
    [fault release];
    [validFrom release];
    [validUntil release];
    [launchGroup release];
    [availabilityZoneGroup release];
    [launchSpecification release];
    [instanceId release];
    [createTime release];
    [productDescription release];
    [tags release];
    [launchedAvailabilityZone release];

    [super dealloc];
}


@end
