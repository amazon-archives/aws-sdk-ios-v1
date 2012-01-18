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

#import "AutoScalingDisableMetricsCollectionRequest.h"


@implementation AutoScalingDisableMetricsCollectionRequest

@synthesize autoScalingGroupName;
@synthesize metrics;


-(id)init
{
    if (self = [super init]) {
        autoScalingGroupName = nil;
        metrics              = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addMetric:(NSString *)metricObject
{
    if (metrics == nil) {
        metrics = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [metrics addObject:metricObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupName: %@,", autoScalingGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Metrics: %@,", metrics] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [autoScalingGroupName release];
    [metrics release];

    [super dealloc];
}


@end
