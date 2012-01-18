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

#import "CloudWatchDescribeAlarmsForMetricRequest.h"


@implementation CloudWatchDescribeAlarmsForMetricRequest

@synthesize metricName;
@synthesize namespace;
@synthesize statistic;
@synthesize dimensions;
@synthesize period;
@synthesize unit;


-(id)init
{
    if (self = [super init]) {
        metricName = nil;
        namespace  = nil;
        statistic  = nil;
        dimensions = [[NSMutableArray alloc] initWithCapacity:1];
        period     = nil;
        unit       = nil;
    }

    return self;
}


-(void)addDimension:(CloudWatchDimension *)dimensionObject
{
    if (dimensions == nil) {
        dimensions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [dimensions addObject:dimensionObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MetricName: %@,", metricName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Namespace: %@,", namespace] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Statistic: %@,", statistic] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Dimensions: %@,", dimensions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Period: %@,", period] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Unit: %@,", unit] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [metricName release];
    [namespace release];
    [statistic release];
    [dimensions release];
    [period release];
    [unit release];

    [super dealloc];
}


@end
