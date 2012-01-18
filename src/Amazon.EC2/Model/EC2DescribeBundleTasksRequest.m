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

#import "EC2DescribeBundleTasksRequest.h"


@implementation EC2DescribeBundleTasksRequest

@synthesize bundleIds;
@synthesize filters;


-(id)init
{
    if (self = [super init]) {
        bundleIds = [[NSMutableArray alloc] initWithCapacity:1];
        filters   = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addBundleId:(NSString *)bundleIdObject
{
    if (bundleIds == nil) {
        bundleIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [bundleIds addObject:bundleIdObject];
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"BundleIds: %@,", bundleIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Filters: %@,", filters] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [bundleIds release];
    [filters release];

    [super dealloc];
}


@end
