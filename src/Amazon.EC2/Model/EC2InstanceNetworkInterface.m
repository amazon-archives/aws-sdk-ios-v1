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

#import "EC2InstanceNetworkInterface.h"


@implementation EC2InstanceNetworkInterface

@synthesize networkInterfaceId;
@synthesize subnetId;
@synthesize vpcId;
@synthesize descriptionValue;
@synthesize ownerId;
@synthesize status;
@synthesize privateIpAddress;
@synthesize privateDnsName;
@synthesize sourceDestCheck;
@synthesize sourceDestCheckIsSet;
@synthesize groups;
@synthesize attachment;
@synthesize association;


-(id)init
{
    if (self = [super init]) {
        networkInterfaceId   = nil;
        subnetId             = nil;
        vpcId                = nil;
        descriptionValue     = nil;
        ownerId              = nil;
        status               = nil;
        privateIpAddress     = nil;
        privateDnsName       = nil;
        sourceDestCheck      = NO;
        sourceDestCheckIsSet = NO;
        groups               = [[NSMutableArray alloc] initWithCapacity:1];
        attachment           = nil;
        association          = nil;
    }

    return self;
}


-(void)addGroup:(EC2GroupIdentifier *)groupObject
{
    if (groups == nil) {
        groups = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [groups addObject:groupObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NetworkInterfaceId: %@,", networkInterfaceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SubnetId: %@,", subnetId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VpcId: %@,", vpcId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerId: %@,", ownerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Status: %@,", status] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateIpAddress: %@,", privateIpAddress] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PrivateDnsName: %@,", privateDnsName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceDestCheck: %d,", sourceDestCheck] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Groups: %@,", groups] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attachment: %@,", attachment] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Association: %@,", association] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setSourceDestCheck:(bool)theValue
{
    sourceDestCheck      = theValue;
    sourceDestCheckIsSet = YES;
}


-(void)dealloc
{
    [networkInterfaceId release];
    [subnetId release];
    [vpcId release];
    [descriptionValue release];
    [ownerId release];
    [status release];
    [privateIpAddress release];
    [privateDnsName release];
    [groups release];
    [attachment release];
    [association release];

    [super dealloc];
}


@end
