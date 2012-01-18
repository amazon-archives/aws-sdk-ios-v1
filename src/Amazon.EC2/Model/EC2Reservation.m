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

#import "EC2Reservation.h"


@implementation EC2Reservation

@synthesize reservationId;
@synthesize ownerId;
@synthesize requesterId;
@synthesize groups;
@synthesize groupNames;
@synthesize instances;


-(id)init
{
    if (self = [super init]) {
        reservationId = nil;
        ownerId       = nil;
        requesterId   = nil;
        groups        = [[NSMutableArray alloc] initWithCapacity:1];
        groupNames    = [[NSMutableArray alloc] initWithCapacity:1];
        instances     = [[NSMutableArray alloc] initWithCapacity:1];
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

-(void)addGroupName:(NSString *)groupNameObject
{
    if (groupNames == nil) {
        groupNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [groupNames addObject:groupNameObject];
}

-(void)addInstance:(EC2Instance *)instanceObject
{
    if (instances == nil) {
        instances = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instances addObject:instanceObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReservationId: %@,", reservationId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerId: %@,", ownerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RequesterId: %@,", requesterId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Groups: %@,", groups] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GroupNames: %@,", groupNames] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Instances: %@,", instances] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [reservationId release];
    [ownerId release];
    [requesterId release];
    [groups release];
    [groupNames release];
    [instances release];

    [super dealloc];
}


@end
