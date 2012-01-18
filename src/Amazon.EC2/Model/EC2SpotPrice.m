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

#import "EC2SpotPrice.h"


@implementation EC2SpotPrice

@synthesize instanceType;
@synthesize productDescription;
@synthesize spotPrice;
@synthesize timestamp;
@synthesize availabilityZone;


-(id)init
{
    if (self = [super init]) {
        instanceType       = nil;
        productDescription = nil;
        spotPrice          = nil;
        timestamp          = nil;
        availabilityZone   = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceType: %@,", instanceType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProductDescription: %@,", productDescription] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SpotPrice: %@,", spotPrice] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Timestamp: %@,", timestamp] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [instanceType release];
    [productDescription release];
    [spotPrice release];
    [timestamp release];
    [availabilityZone release];

    [super dealloc];
}


@end
