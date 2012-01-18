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

#import "EC2DescribeRegionsRequest.h"


@implementation EC2DescribeRegionsRequest

@synthesize regionNames;
@synthesize filters;


-(id)init
{
    if (self = [super init]) {
        regionNames = [[NSMutableArray alloc] initWithCapacity:1];
        filters     = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addRegionName:(NSString *)regionNameObject
{
    if (regionNames == nil) {
        regionNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [regionNames addObject:regionNameObject];
}

-(void)addFilter:(EC2Filter *)filterObject
{
    if (filters == nil) {
        filters = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [filters addObject:filterObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RegionNames: %@,", regionNames] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Filters: %@,", filters] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [regionNames release];
    [filters release];

    [super dealloc];
}


@end
