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

#import "EC2DescribeSnapshotsRequest.h"


@implementation EC2DescribeSnapshotsRequest

@synthesize snapshotIds;
@synthesize ownerIds;
@synthesize restorableByUserIds;
@synthesize filters;


-(id)init
{
    if (self = [super init]) {
        snapshotIds         = [[NSMutableArray alloc] initWithCapacity:1];
        ownerIds            = [[NSMutableArray alloc] initWithCapacity:1];
        restorableByUserIds = [[NSMutableArray alloc] initWithCapacity:1];
        filters             = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addSnapshotId:(NSString *)snapshotIdObject
{
    if (snapshotIds == nil) {
        snapshotIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [snapshotIds addObject:snapshotIdObject];
}

-(void)addOwnerId:(NSString *)ownerIdObject
{
    if (ownerIds == nil) {
        ownerIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [ownerIds addObject:ownerIdObject];
}

-(void)addRestorableByUserId:(NSString *)restorableByUserIdObject
{
    if (restorableByUserIds == nil) {
        restorableByUserIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [restorableByUserIds addObject:restorableByUserIdObject];
}

-(void)addFilter:(EC2Filter *)filterObject
{
    if (filters == nil) {
        filters = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [filters addObject:filterObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SnapshotIds: %@,", snapshotIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerIds: %@,", ownerIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RestorableByUserIds: %@,", restorableByUserIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Filters: %@,", filters] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [snapshotIds release];
    [ownerIds release];
    [restorableByUserIds release];
    [filters release];

    [super dealloc];
}


@end
