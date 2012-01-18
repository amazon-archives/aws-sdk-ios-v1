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

#import "EC2SecurityGroup.h"


@implementation EC2SecurityGroup

@synthesize ownerId;
@synthesize groupName;
@synthesize groupId;
@synthesize descriptionValue;
@synthesize ipPermissions;
@synthesize ipPermissionsEgress;
@synthesize vpcId;
@synthesize tags;


-(id)init
{
    if (self = [super init]) {
        ownerId             = nil;
        groupName           = nil;
        groupId             = nil;
        descriptionValue    = nil;
        ipPermissions       = [[NSMutableArray alloc] initWithCapacity:1];
        ipPermissionsEgress = [[NSMutableArray alloc] initWithCapacity:1];
        vpcId               = nil;
        tags                = [[NSMutableArray alloc] initWithCapacity:1];
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

-(void)addIpPermissionsEgres:(EC2IpPermission *)ipPermissionsEgresObject
{
    if (ipPermissionsEgress == nil) {
        ipPermissionsEgress = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [ipPermissionsEgress addObject:ipPermissionsEgresObject];
}

-(void)addTag:(EC2Tag *)tagObject
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerId: %@,", ownerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GroupName: %@,", groupName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GroupId: %@,", groupId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IpPermissions: %@,", ipPermissions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IpPermissionsEgress: %@,", ipPermissionsEgress] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VpcId: %@,", vpcId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [ownerId release];
    [groupName release];
    [groupId release];
    [descriptionValue release];
    [ipPermissions release];
    [ipPermissionsEgress release];
    [vpcId release];
    [tags release];

    [super dealloc];
}


@end
