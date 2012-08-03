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

#import "EC2Address.h"


@implementation EC2Address

@synthesize instanceId;
@synthesize publicIp;
@synthesize allocationId;
@synthesize associationId;
@synthesize domain;
@synthesize networkInterfaceId;
@synthesize networkInterfaceOwnerId;
@synthesize privateIpAddress;


-(id)init
{
    if (self = [super init]) {
        instanceId              = nil;
        publicIp                = nil;
        allocationId            = nil;
        associationId           = nil;
        domain                  = nil;
        networkInterfaceId      = nil;
        networkInterfaceOwnerId = nil;
        privateIpAddress        = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PublicIp: %@,", publicIp] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AllocationId: %@,", allocationId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AssociationId: %@,", associationId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Domain: %@,", domain] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NetworkInterfaceId: %@,", networkInterfaceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NetworkInterfaceOwnerId: %@,", networkInterfaceOwnerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateIpAddress: %@,", privateIpAddress] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [instanceId release];
    [publicIp release];
    [allocationId release];
    [associationId release];
    [domain release];
    [networkInterfaceId release];
    [networkInterfaceOwnerId release];
    [privateIpAddress release];

    [super dealloc];
}


@end
