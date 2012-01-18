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

#import "EC2DetachVolumeRequest.h"


@implementation EC2DetachVolumeRequest

@synthesize volumeId;
@synthesize instanceId;
@synthesize device;
@synthesize force;
@synthesize forceIsSet;


-(id)init
{
    if (self = [super init]) {
        volumeId   = nil;
        instanceId = nil;
        device     = nil;
        force      = NO;
        forceIsSet = NO;
    }

    return self;
}

-(id)initWithVolumeId:(NSString *)theVolumeId
{
    if (self = [self init]) {
        self.volumeId = theVolumeId;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeId: %@,", volumeId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Device: %@,", device] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Force: %d,", force] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setForce:(bool)theValue
{
    force      = theValue;
    forceIsSet = YES;
}


-(void)dealloc
{
    [volumeId release];
    [instanceId release];
    [device release];

    [super dealloc];
}


@end
