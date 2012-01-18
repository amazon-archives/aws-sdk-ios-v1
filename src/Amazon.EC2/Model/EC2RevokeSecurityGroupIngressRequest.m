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

#import "EC2RevokeSecurityGroupIngressRequest.h"


@implementation EC2RevokeSecurityGroupIngressRequest

@synthesize groupName;
@synthesize groupId;
@synthesize sourceSecurityGroupName;
@synthesize sourceSecurityGroupOwnerId;
@synthesize ipProtocol;
@synthesize fromPort;
@synthesize toPort;
@synthesize cidrIp;
@synthesize ipPermissions;


-(id)init
{
    if (self = [super init]) {
        groupName                  = nil;
        groupId                    = nil;
        sourceSecurityGroupName    = nil;
        sourceSecurityGroupOwnerId = nil;
        ipProtocol                 = nil;
        fromPort                   = nil;
        toPort                     = nil;
        cidrIp                     = nil;
        ipPermissions              = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithGroupName:(NSString *)theGroupName andIpPermissions:(NSMutableArray *)theIpPermissions
{
    if (self = [self init]) {
        self.groupName     = theGroupName;
        self.ipPermissions = theIpPermissions;
    }

    return self;
}


-(void)addIpPermission:(EC2IpPermission *)ipPermissionObject
{
    if (ipPermissions == nil) {
        ipPermissions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [ipPermissions addObject:ipPermissionObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GroupName: %@,", groupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GroupId: %@,", groupId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceSecurityGroupName: %@,", sourceSecurityGroupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SourceSecurityGroupOwnerId: %@,", sourceSecurityGroupOwnerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IpProtocol: %@,", ipProtocol] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"FromPort: %@,", fromPort] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ToPort: %@,", toPort] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CidrIp: %@,", cidrIp] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IpPermissions: %@,", ipPermissions] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [groupName release];
    [groupId release];
    [sourceSecurityGroupName release];
    [sourceSecurityGroupOwnerId release];
    [ipProtocol release];
    [fromPort release];
    [toPort release];
    [cidrIp release];
    [ipPermissions release];

    [super dealloc];
}


@end
