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

#import "EC2CreateReservedInstancesListingRequest.h"


@implementation EC2CreateReservedInstancesListingRequest

@synthesize reservedInstancesId;
@synthesize instanceCount;
@synthesize priceSchedules;
@synthesize clientToken;


-(id)init
{
    if (self = [super init]) {
        reservedInstancesId = nil;
        instanceCount       = nil;
        priceSchedules      = [[NSMutableArray alloc] initWithCapacity:1];
        clientToken         = nil;
    }

    return self;
}


-(void)addPriceSchedule:(EC2PriceScheduleSpecification *)priceScheduleObject
{
    if (priceSchedules == nil) {
        priceSchedules = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [priceSchedules addObject:priceScheduleObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesId: %@,", reservedInstancesId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceCount: %@,", instanceCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PriceSchedules: %@,", priceSchedules] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ClientToken: %@,", clientToken] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [reservedInstancesId release];
    [instanceCount release];
    [priceSchedules release];
    [clientToken release];

    [super dealloc];
}


@end
