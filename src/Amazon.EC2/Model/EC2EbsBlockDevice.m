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

#import "EC2EbsBlockDevice.h"


@implementation EC2EbsBlockDevice

@synthesize snapshotId;
@synthesize volumeSize;
@synthesize deleteOnTermination;
@synthesize deleteOnTerminationIsSet;
@synthesize volumeType;
@synthesize iops;


-(id)init
{
    if (self = [super init]) {
        snapshotId               = nil;
        volumeSize               = nil;
        deleteOnTermination      = NO;
        deleteOnTerminationIsSet = NO;
        volumeType               = nil;
        iops                     = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SnapshotId: %@,", snapshotId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeSize: %@,", volumeSize] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DeleteOnTermination: %d,", deleteOnTermination] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeType: %@,", volumeType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Iops: %@,", iops] autorelease]];
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
    [snapshotId release];
    [volumeSize release];
    [volumeType release];
    [iops release];

    [super dealloc];
}


@end
