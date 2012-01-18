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

#import "EC2DescribeReservedInstancesOfferingsRequest.h"


@implementation EC2DescribeReservedInstancesOfferingsRequest

@synthesize reservedInstancesOfferingIds;
@synthesize instanceType;
@synthesize availabilityZone;
@synthesize productDescription;
@synthesize filters;
@synthesize instanceTenancy;
@synthesize offeringType;


-(id)init
{
    if (self = [super init]) {
        reservedInstancesOfferingIds = [[NSMutableArray alloc] initWithCapacity:1];
        instanceType                 = nil;
        availabilityZone             = nil;
        productDescription           = nil;
        filters                      = [[NSMutableArray alloc] initWithCapacity:1];
        instanceTenancy              = nil;
        offeringType                 = nil;
    }

    return self;
}


-(void)addReservedInstancesOfferingId:(NSString *)reservedInstancesOfferingIdObject
{
    if (reservedInstancesOfferingIds == nil) {
        reservedInstancesOfferingIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [reservedInstancesOfferingIds addObject:reservedInstancesOfferingIdObject];
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesOfferingIds: %@,", reservedInstancesOfferingIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceType: %@,", instanceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductDescription: %@,", productDescription] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Filters: %@,", filters] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceTenancy: %@,", instanceTenancy] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OfferingType: %@,", offeringType] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [reservedInstancesOfferingIds release];
    [instanceType release];
    [availabilityZone release];
    [productDescription release];
    [filters release];
    [instanceTenancy release];
    [offeringType release];

    [super dealloc];
}


@end
