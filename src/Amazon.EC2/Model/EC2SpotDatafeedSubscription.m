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

#import "EC2SpotDatafeedSubscription.h"


@implementation EC2SpotDatafeedSubscription

@synthesize ownerId;
@synthesize bucket;
@synthesize prefix;
@synthesize state;
@synthesize fault;


-(id)init
{
    if (self = [super init]) {
        ownerId = nil;
        bucket  = nil;
        prefix  = nil;
        state   = nil;
        fault   = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerId: %@,", ownerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Bucket: %@,", bucket] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Prefix: %@,", prefix] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Fault: %@,", fault] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [ownerId release];
    [bucket release];
    [prefix release];
    [state release];
    [fault release];

    [super dealloc];
}


@end
