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

#import "SESSendDataPoint.h"


@implementation SESSendDataPoint

@synthesize timestamp;
@synthesize deliveryAttempts;
@synthesize bounces;
@synthesize complaints;
@synthesize rejects;


-(id)init
{
    if (self = [super init]) {
        timestamp        = nil;
        deliveryAttempts = nil;
        bounces          = nil;
        complaints       = nil;
        rejects          = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Timestamp: %@,", timestamp] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DeliveryAttempts: %@,", deliveryAttempts] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Bounces: %@,", bounces] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Complaints: %@,", complaints] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Rejects: %@,", rejects] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [timestamp release];
    [deliveryAttempts release];
    [bounces release];
    [complaints release];
    [rejects release];

    [super dealloc];
}


@end
