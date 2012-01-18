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

#import "EC2IpPermission.h"


@implementation EC2IpPermission

@synthesize ipProtocol;
@synthesize fromPort;
@synthesize toPort;
@synthesize userIdGroupPairs;
@synthesize ipRanges;


-(id)init
{
    if (self = [super init]) {
        ipProtocol       = nil;
        fromPort         = nil;
        toPort           = nil;
        userIdGroupPairs = [[NSMutableArray alloc] initWithCapacity:1];
        ipRanges         = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addUserIdGroupPair:(EC2UserIdGroupPair *)userIdGroupPairObject
{
    if (userIdGroupPairs == nil) {
        userIdGroupPairs = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [userIdGroupPairs addObject:userIdGroupPairObject];
}

-(void)addIpRange:(NSString *)ipRangeObject
{
    if (ipRanges == nil) {
        ipRanges = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [ipRanges addObject:ipRangeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IpProtocol: %@,", ipProtocol] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"FromPort: %@,", fromPort] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ToPort: %@,", toPort] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UserIdGroupPairs: %@,", userIdGroupPairs] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IpRanges: %@,", ipRanges] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [ipProtocol release];
    [fromPort release];
    [toPort release];
    [userIdGroupPairs release];
    [ipRanges release];

    [super dealloc];
}


@end
