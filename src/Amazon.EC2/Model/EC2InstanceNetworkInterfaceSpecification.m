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

#import "EC2InstanceNetworkInterfaceSpecification.h"


@implementation EC2InstanceNetworkInterfaceSpecification

@synthesize networkInterfaceId;
@synthesize deviceIndex;
@synthesize subnetId;
@synthesize descriptionValue;
@synthesize privateIpAddress;
@synthesize groups;
@synthesize deleteOnTermination;
@synthesize deleteOnTerminationIsSet;
@synthesize privateIpAddresses;
@synthesize secondaryPrivateIpAddressCount;


-(id)init
{
    if (self = [super init]) {
        networkInterfaceId             = nil;
        deviceIndex                    = nil;
        subnetId                       = nil;
        descriptionValue               = nil;
        privateIpAddress               = nil;
        groups                         = [[NSMutableArray alloc] initWithCapacity:1];
        deleteOnTermination            = NO;
        deleteOnTerminationIsSet       = NO;
        privateIpAddresses             = [[NSMutableArray alloc] initWithCapacity:1];
        secondaryPrivateIpAddressCount = nil;
    }

    return self;
}


-(void)addGroup:(NSString *)groupObject
{
    if (groups == nil) {
        groups = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [groups addObject:groupObject];
}

-(void)addPrivateIpAddresse:(EC2PrivateIpAddressSpecification *)privateIpAddresseObject
{
    if (privateIpAddresses == nil) {
        privateIpAddresses = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [privateIpAddresses addObject:privateIpAddresseObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NetworkInterfaceId: %@,", networkInterfaceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DeviceIndex: %@,", deviceIndex] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SubnetId: %@,", subnetId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateIpAddress: %@,", privateIpAddress] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Groups: %@,", groups] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DeleteOnTermination: %d,", deleteOnTermination] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateIpAddresses: %@,", privateIpAddresses] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SecondaryPrivateIpAddressCount: %@,", secondaryPrivateIpAddressCount] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setDeleteOnTermination:(bool)theValue
{
    deleteOnTermination      = theValue;
    deleteOnTerminationIsSet = YES;
}


-(void)dealloc
{
    [networkInterfaceId release];
    [deviceIndex release];
    [subnetId release];
    [descriptionValue release];
    [privateIpAddress release];
    [groups release];
    [privateIpAddresses release];
    [secondaryPrivateIpAddressCount release];

    [super dealloc];
}


@end
