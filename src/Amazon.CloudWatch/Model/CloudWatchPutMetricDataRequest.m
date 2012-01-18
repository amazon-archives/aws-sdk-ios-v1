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

#import "CloudWatchPutMetricDataRequest.h"


@implementation CloudWatchPutMetricDataRequest

@synthesize namespace;
@synthesize metricDatas;


-(id)init
{
    if (self = [super init]) {
        namespace   = nil;
        metricDatas = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addMetricData:(CloudWatchMetricDatum *)metricDataObject
{
    if (metricDatas == nil) {
        metricDatas = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [metricDatas addObject:metricDataObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Namespace: %@,", namespace] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MetricDatas: %@,", metricDatas] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [namespace release];
    [metricDatas release];

    [super dealloc];
}


@end
