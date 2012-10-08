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

#import "EC2CreateVolumeRequest.h"


@implementation EC2CreateVolumeRequest

@synthesize size;
@synthesize snapshotId;
@synthesize availabilityZone;
@synthesize volumeType;
@synthesize iops;


-(id)init
{
    if (self = [super init]) {
        size             = nil;
        snapshotId       = nil;
        availabilityZone = nil;
        volumeType       = nil;
        iops             = nil;
    }

    return self;
}

-(id)initWithSize:(NSNumber *)theSize andAvailabilityZone:(NSString *)theAvailabilityZone
{
    if (self = [self init]) {
        self.size             = theSize;
        self.availabilityZone = theAvailabilityZone;
    }

    return self;
}

-(id)initWithSnapshotId:(NSString *)theSnapshotId andAvailabilityZone:(NSString *)theAvailabilityZone
{
    if (self = [self init]) {
        self.snapshotId       = theSnapshotId;
        self.availabilityZone = theAvailabilityZone;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Size: %@,", size] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SnapshotId: %@,", snapshotId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AvailabilityZone: %@,", availabilityZone] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeType: %@,", volumeType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Iops: %@,", iops] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [size release];
    [snapshotId release];
    [availabilityZone release];
    [volumeType release];
    [iops release];

    [super dealloc];
}


@end
