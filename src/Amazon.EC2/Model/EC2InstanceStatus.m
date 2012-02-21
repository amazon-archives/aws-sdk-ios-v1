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

#import "EC2InstanceStatus.h"


@implementation EC2InstanceStatus

@synthesize instanceId;
@synthesize availabilityZone;
@synthesize events;
@synthesize instanceState;
@synthesize systemStatus;
@synthesize instanceStatus;


-(id)init
{
    if (self = [super init]) {
        instanceId       = nil;
        availabilityZone = nil;
        events           = [[NSMutableArray alloc] initWithCapacity:1];
        instanceState    = nil;
        systemStatus     = nil;
        instanceStatus   = nil;
    }

    return self;
}


-(void)addEvent:(EC2InstanceStatusEvent *)eventObject
{
    if (events == nil) {
        events = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [events addObject:eventObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Events: %@,", events] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceState: %@,", instanceState] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SystemStatus: %@,", systemStatus] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceStatus: %@,", instanceStatus] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [instanceId release];
    [availabilityZone release];
    [events release];
    [instanceState release];
    [systemStatus release];
    [instanceStatus release];

    [super dealloc];
}


@end
