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

#import "EC2LicenseCapacity.h"


@implementation EC2LicenseCapacity

@synthesize capacity;
@synthesize instanceCapacity;
@synthesize state;
@synthesize earliestAllowedDeactivationTime;


-(id)init
{
    if (self = [super init]) {
        capacity                        = nil;
        instanceCapacity                = nil;
        state                           = nil;
        earliestAllowedDeactivationTime = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Capacity: %@,", capacity] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceCapacity: %@,", instanceCapacity] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"EarliestAllowedDeactivationTime: %@,", earliestAllowedDeactivationTime] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [capacity release];
    [instanceCapacity release];
    [state release];
    [earliestAllowedDeactivationTime release];

    [super dealloc];
}


@end
