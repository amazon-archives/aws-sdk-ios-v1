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

#import "CloudWatchDatapoint.h"


@implementation CloudWatchDatapoint

@synthesize timestamp;
@synthesize sampleCount;
@synthesize average;
@synthesize sum;
@synthesize minimum;
@synthesize maximum;
@synthesize unit;


-(id)init
{
    if (self = [super init]) {
        timestamp   = nil;
        sampleCount = nil;
        average     = nil;
        sum         = nil;
        minimum     = nil;
        maximum     = nil;
        unit        = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Timestamp: %@,", timestamp] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SampleCount: %@,", sampleCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Average: %@,", average] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Sum: %@,", sum] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Minimum: %@,", minimum] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Maximum: %@,", maximum] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Unit: %@,", unit] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [timestamp release];
    [sampleCount release];
    [average release];
    [sum release];
    [minimum release];
    [maximum release];
    [unit release];

    [super dealloc];
}


@end
