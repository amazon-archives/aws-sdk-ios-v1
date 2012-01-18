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

#import "EC2AvailabilityZone.h"


@implementation EC2AvailabilityZone

@synthesize zoneName;
@synthesize state;
@synthesize regionName;
@synthesize messages;


-(id)init
{
    if (self = [super init]) {
        zoneName   = nil;
        state      = nil;
        regionName = nil;
        messages   = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addMessage:(EC2AvailabilityZoneMessage *)messageObject
{
    if (messages == nil) {
        messages = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [messages addObject:messageObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ZoneName: %@,", zoneName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RegionName: %@,", regionName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Messages: %@,", messages] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [zoneName release];
    [state release];
    [regionName release];
    [messages release];

    [super dealloc];
}


@end
