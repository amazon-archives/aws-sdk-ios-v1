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

#import "CloudWatchStatisticSet.h"


@implementation CloudWatchStatisticSet

@synthesize sampleCount;
@synthesize sum;
@synthesize minimum;
@synthesize maximum;


-(id)init
{
    if (self = [super init]) {
        sampleCount = nil;
        sum         = nil;
        minimum     = nil;
        maximum     = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SampleCount: %@,", sampleCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Sum: %@,", sum] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Minimum: %@,", minimum] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Maximum: %@,", maximum] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [sampleCount release];
    [sum release];
    [minimum release];
    [maximum release];

    [super dealloc];
}


@end
