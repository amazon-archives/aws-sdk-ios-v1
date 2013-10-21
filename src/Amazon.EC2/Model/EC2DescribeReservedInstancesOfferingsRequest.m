/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

@synthesize dryRun;
@synthesize dryRunIsSet;
@synthesize reservedInstancesOfferingIds;
@synthesize instanceType;
@synthesize availabilityZone;
@synthesize productDescription;
@synthesize filters;
@synthesize instanceTenancy;
@synthesize offeringType;
@synthesize nextToken;
@synthesize maxResults;
@synthesize includeMarketplace;
@synthesize includeMarketplaceIsSet;
@synthesize minDuration;
@synthesize maxDuration;
@synthesize maxInstanceCount;


-(id)init
{
    if (self = [super init]) {
        dryRun                       = NO;
        dryRunIsSet                  = NO;
        reservedInstancesOfferingIds = [[NSMutableArray alloc] initWithCapacity:1];
        instanceType                 = nil;
        availabilityZone             = nil;
        productDescription           = nil;
        filters                      = [[NSMutableArray alloc] initWithCapacity:1];
        instanceTenancy              = nil;
        offeringType                 = nil;
        nextToken                    = nil;
        maxResults                   = nil;
        includeMarketplace           = NO;
        includeMarketplaceIsSet      = NO;
        minDuration                  = nil;
        maxDuration                  = nil;
        maxInstanceCount             = nil;
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DryRun: %d,", dryRun] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesOfferingIds: %@,", reservedInstancesOfferingIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceType: %@,", instanceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductDescription: %@,", productDescription] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Filters: %@,", filters] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceTenancy: %@,", instanceTenancy] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OfferingType: %@,", offeringType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MaxResults: %@,", maxResults] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IncludeMarketplace: %d,", includeMarketplace] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MinDuration: %@,", minDuration] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MaxDuration: %@,", maxDuration] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MaxInstanceCount: %@,", maxInstanceCount] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setDryRun:(BOOL)theValue
{
    dryRun      = theValue;
    dryRunIsSet = YES;
}

-(void)setIncludeMarketplace:(BOOL)theValue
{
    includeMarketplace      = theValue;
    includeMarketplaceIsSet = YES;
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
    [nextToken release];
    [maxResults release];
    [minDuration release];
    [maxDuration release];
    [maxInstanceCount release];

    [super dealloc];
}


@end
