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

#import "EC2ReservedInstances.h"


@implementation EC2ReservedInstances

@synthesize reservedInstancesId;
@synthesize instanceType;
@synthesize availabilityZone;
@synthesize start;
@synthesize duration;
@synthesize usagePrice;
@synthesize fixedPrice;
@synthesize instanceCount;
@synthesize productDescription;
@synthesize state;
@synthesize tags;
@synthesize instanceTenancy;
@synthesize currencyCode;
@synthesize offeringType;
@synthesize recurringCharges;


-(id)init
{
    if (self = [super init]) {
        reservedInstancesId = nil;
        instanceType        = nil;
        availabilityZone    = nil;
        start               = nil;
        duration            = nil;
        usagePrice          = nil;
        fixedPrice          = nil;
        instanceCount       = nil;
        productDescription  = nil;
        state               = nil;
        tags                = [[NSMutableArray alloc] initWithCapacity:1];
        instanceTenancy     = nil;
        currencyCode        = nil;
        offeringType        = nil;
        recurringCharges    = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addTag:(EC2Tag *)tagObject
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}

-(void)addRecurringCharge:(EC2RecurringCharge *)recurringChargeObject
{
    if (recurringCharges == nil) {
        recurringCharges = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [recurringCharges addObject:recurringChargeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesId: %@,", reservedInstancesId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceType: %@,", instanceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Start: %@,", start] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Duration: %@,", duration] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UsagePrice: %@,", usagePrice] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"FixedPrice: %@,", fixedPrice] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceCount: %@,", instanceCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductDescription: %@,", productDescription] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceTenancy: %@,", instanceTenancy] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CurrencyCode: %@,", currencyCode] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OfferingType: %@,", offeringType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RecurringCharges: %@,", recurringCharges] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [reservedInstancesId release];
    [instanceType release];
    [availabilityZone release];
    [start release];
    [duration release];
    [usagePrice release];
    [fixedPrice release];
    [instanceCount release];
    [productDescription release];
    [state release];
    [tags release];
    [instanceTenancy release];
    [currencyCode release];
    [offeringType release];
    [recurringCharges release];

    [super dealloc];
}


@end
