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

#import "EC2DescribeInstanceStatusRequest.h"


@implementation EC2DescribeInstanceStatusRequest

@synthesize instanceIds;
@synthesize filters;
@synthesize nextToken;
@synthesize maxResults;
@synthesize includeAllInstances;
@synthesize includeAllInstancesIsSet;


-(id)init
{
    if (self = [super init]) {
        instanceIds              = [[NSMutableArray alloc] initWithCapacity:1];
        filters                  = [[NSMutableArray alloc] initWithCapacity:1];
        nextToken                = nil;
        maxResults               = nil;
        includeAllInstances      = NO;
        includeAllInstancesIsSet = NO;
    }

    return self;
}


-(void)addInstanceId:(NSString *)instanceIdObject
{
    if (instanceIds == nil) {
        instanceIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instanceIds addObject:instanceIdObject];
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceIds: %@,", instanceIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Filters: %@,", filters] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MaxResults: %@,", maxResults] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IncludeAllInstances: %d,", includeAllInstances] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setIncludeAllInstances:(bool)theValue
{
    includeAllInstances      = theValue;
    includeAllInstancesIsSet = YES;
}


-(void)dealloc
{
    [instanceIds release];
    [filters release];
    [nextToken release];
    [maxResults release];

    [super dealloc];
}


@end
