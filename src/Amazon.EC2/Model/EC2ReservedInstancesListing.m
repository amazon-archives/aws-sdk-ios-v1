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

#import "EC2ReservedInstancesListing.h"


@implementation EC2ReservedInstancesListing

@synthesize reservedInstancesListingId;
@synthesize reservedInstancesId;
@synthesize createDate;
@synthesize updateDate;
@synthesize status;
@synthesize statusMessage;
@synthesize instanceCounts;
@synthesize priceSchedules;
@synthesize tags;
@synthesize clientToken;


-(id)init
{
    if (self = [super init]) {
        reservedInstancesListingId = nil;
        reservedInstancesId        = nil;
        createDate                 = nil;
        updateDate                 = nil;
        status                     = nil;
        statusMessage              = nil;
        instanceCounts             = [[NSMutableArray alloc] initWithCapacity:1];
        priceSchedules             = [[NSMutableArray alloc] initWithCapacity:1];
        tags                       = [[NSMutableArray alloc] initWithCapacity:1];
        clientToken                = nil;
    }

    return self;
}


-(void)addInstanceCount:(EC2InstanceCount *)instanceCountObject
{
    if (instanceCounts == nil) {
        instanceCounts = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instanceCounts addObject:instanceCountObject];
}

-(void)addPriceSchedule:(EC2PriceSchedule *)priceScheduleObject
{
    if (priceSchedules == nil) {
        priceSchedules = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [priceSchedules addObject:priceScheduleObject];
}

-(void)addTag:(EC2Tag *)tagObject
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesListingId: %@,", reservedInstancesListingId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesId: %@,", reservedInstancesId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreateDate: %@,", createDate] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UpdateDate: %@,", updateDate] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Status: %@,", status] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StatusMessage: %@,", statusMessage] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceCounts: %@,", instanceCounts] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PriceSchedules: %@,", priceSchedules] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ClientToken: %@,", clientToken] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [reservedInstancesListingId release];
    [reservedInstancesId release];
    [createDate release];
    [updateDate release];
    [status release];
    [statusMessage release];
    [instanceCounts release];
    [priceSchedules release];
    [tags release];
    [clientToken release];

    [super dealloc];
}


@end
