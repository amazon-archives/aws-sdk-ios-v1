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

#import "AutoScalingDescribeMetricCollectionTypesResponse.h"


@implementation AutoScalingDescribeMetricCollectionTypesResponse

@synthesize metrics;
@synthesize granularities;


-(id)init
{
    if (self = [super init]) {
        metrics       = [[NSMutableArray alloc] initWithCapacity:1];
        granularities = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        [exception release];
        exception = newException;
    }
    else {
        [exception release];
        exception = [theException retain];
    }
}



-(AutoScalingMetricCollectionType *)metricsObjectAtIndex:(int)index
{
    return (AutoScalingMetricCollectionType *)[metrics objectAtIndex:index];
}


-(AutoScalingMetricGranularityType *)granularitiesObjectAtIndex:(int)index
{
    return (AutoScalingMetricGranularityType *)[granularities objectAtIndex:index];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Metrics: %@,", metrics] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Granularities: %@,", granularities] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [metrics release];
    [granularities release];

    [super dealloc];
}


@end
