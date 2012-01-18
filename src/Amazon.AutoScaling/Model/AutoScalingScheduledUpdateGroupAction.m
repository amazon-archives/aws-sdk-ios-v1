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

#import "AutoScalingScheduledUpdateGroupAction.h"


@implementation AutoScalingScheduledUpdateGroupAction

@synthesize autoScalingGroupName;
@synthesize scheduledActionName;
@synthesize scheduledActionARN;
@synthesize time;
@synthesize startTime;
@synthesize endTime;
@synthesize recurrence;
@synthesize minSize;
@synthesize maxSize;
@synthesize desiredCapacity;


-(id)init
{
    if (self = [super init]) {
        autoScalingGroupName = nil;
        scheduledActionName  = nil;
        scheduledActionARN   = nil;
        time                 = nil;
        startTime            = nil;
        endTime              = nil;
        recurrence           = nil;
        minSize              = nil;
        maxSize              = nil;
        desiredCapacity      = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ScheduledActionName: %@,", scheduledActionName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ScheduledActionARN: %@,", scheduledActionARN] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Time: %@,", time] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StartTime: %@,", startTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"EndTime: %@,", endTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Recurrence: %@,", recurrence] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MinSize: %@,", minSize] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MaxSize: %@,", maxSize] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DesiredCapacity: %@,", desiredCapacity] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [autoScalingGroupName release];
    [scheduledActionName release];
    [scheduledActionARN release];
    [time release];
    [startTime release];
    [endTime release];
    [recurrence release];
    [minSize release];
    [maxSize release];
    [desiredCapacity release];

    [super dealloc];
}


@end
