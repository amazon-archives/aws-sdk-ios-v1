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

#import "EC2VolumeStatusItem.h"


@implementation EC2VolumeStatusItem

@synthesize volumeId;
@synthesize availabilityZone;
@synthesize volumeStatus;
@synthesize events;
@synthesize actions;


-(id)init
{
    if (self = [super init]) {
        volumeId         = nil;
        availabilityZone = nil;
        volumeStatus     = nil;
        events           = [[NSMutableArray alloc] initWithCapacity:1];
        actions          = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addEvent:(EC2VolumeStatusEvent *)eventObject
{
    if (events == nil) {
        events = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [events addObject:eventObject];
}

-(void)addAction:(EC2VolumeStatusAction *)actionObject
{
    if (actions == nil) {
        actions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [actions addObject:actionObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeId: %@,", volumeId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeStatus: %@,", volumeStatus] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Events: %@,", events] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Actions: %@,", actions] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [volumeId release];
    [availabilityZone release];
    [volumeStatus release];
    [events release];
    [actions release];

    [super dealloc];
}


@end
