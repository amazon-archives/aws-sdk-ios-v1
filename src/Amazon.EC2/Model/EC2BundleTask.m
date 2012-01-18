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

#import "EC2BundleTask.h"


@implementation EC2BundleTask

@synthesize instanceId;
@synthesize bundleId;
@synthesize state;
@synthesize startTime;
@synthesize updateTime;
@synthesize storage;
@synthesize progress;
@synthesize bundleTaskError;


-(id)init
{
    if (self = [super init]) {
        instanceId      = nil;
        bundleId        = nil;
        state           = nil;
        startTime       = nil;
        updateTime      = nil;
        storage         = nil;
        progress        = nil;
        bundleTaskError = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BundleId: %@,", bundleId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StartTime: %@,", startTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UpdateTime: %@,", updateTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Storage: %@,", storage] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Progress: %@,", progress] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BundleTaskError: %@,", bundleTaskError] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [instanceId release];
    [bundleId release];
    [state release];
    [startTime release];
    [updateTime release];
    [storage release];
    [progress release];
    [bundleTaskError release];

    [super dealloc];
}


@end
