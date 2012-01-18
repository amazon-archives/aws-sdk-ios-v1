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

#import "EC2DescribeAddressesRequest.h"


@implementation EC2DescribeAddressesRequest

@synthesize publicIps;
@synthesize filters;
@synthesize allocationIds;


-(id)init
{
    if (self = [super init]) {
        publicIps     = [[NSMutableArray alloc] initWithCapacity:1];
        filters       = [[NSMutableArray alloc] initWithCapacity:1];
        allocationIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addPublicIp:(NSString *)publicIpObject
{
    if (publicIps == nil) {
        publicIps = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [publicIps addObject:publicIpObject];
}

-(void)addFilter:(EC2Filter *)filterObject
{
    if (filters == nil) {
        filters = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [filters addObject:filterObject];
}

-(void)addAllocationId:(NSString *)allocationIdObject
{
    if (allocationIds == nil) {
        allocationIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [allocationIds addObject:allocationIdObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PublicIps: %@,", publicIps] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Filters: %@,", filters] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AllocationIds: %@,", allocationIds] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [publicIps release];
    [filters release];
    [allocationIds release];

    [super dealloc];
}


@end
