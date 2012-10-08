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

#import "EC2PurchaseReservedInstancesOfferingRequest.h"


@implementation EC2PurchaseReservedInstancesOfferingRequest

@synthesize reservedInstancesOfferingId;
@synthesize instanceCount;
@synthesize limitPrice;


-(id)init
{
    if (self = [super init]) {
        reservedInstancesOfferingId = nil;
        instanceCount               = nil;
        limitPrice                  = nil;
    }

    return self;
}

-(id)initWithReservedInstancesOfferingId:(NSString *)theReservedInstancesOfferingId andInstanceCount:(NSNumber *)theInstanceCount
{
    if (self = [self init]) {
        self.reservedInstancesOfferingId = theReservedInstancesOfferingId;
        self.instanceCount               = theInstanceCount;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservedInstancesOfferingId: %@,", reservedInstancesOfferingId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceCount: %@,", instanceCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LimitPrice: %@,", limitPrice] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [reservedInstancesOfferingId release];
    [instanceCount release];
    [limitPrice release];

    [super dealloc];
}


@end
