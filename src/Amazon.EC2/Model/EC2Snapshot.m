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

#import "EC2Snapshot.h"


@implementation EC2Snapshot

@synthesize snapshotId;
@synthesize volumeId;
@synthesize state;
@synthesize startTime;
@synthesize progress;
@synthesize ownerId;
@synthesize descriptionValue;
@synthesize volumeSize;
@synthesize ownerAlias;
@synthesize tags;


-(id)init
{
    if (self = [super init]) {
        snapshotId       = nil;
        volumeId         = nil;
        state            = nil;
        startTime        = nil;
        progress         = nil;
        ownerId          = nil;
        descriptionValue = nil;
        volumeSize       = nil;
        ownerAlias       = nil;
        tags             = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SnapshotId: %@,", snapshotId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeId: %@,", volumeId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StartTime: %@,", startTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Progress: %@,", progress] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerId: %@,", ownerId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeSize: %@,", volumeSize] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"OwnerAlias: %@,", ownerAlias] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [snapshotId release];
    [volumeId release];
    [state release];
    [startTime release];
    [progress release];
    [ownerId release];
    [descriptionValue release];
    [volumeSize release];
    [ownerAlias release];
    [tags release];

    [super dealloc];
}


@end
