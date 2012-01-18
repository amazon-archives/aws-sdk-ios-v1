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

#import "EC2CreateSnapshotRequest.h"


@implementation EC2CreateSnapshotRequest

@synthesize volumeId;
@synthesize descriptionValue;


-(id)init
{
    if (self = [super init]) {
        volumeId         = nil;
        descriptionValue = nil;
    }

    return self;
}

-(id)initWithVolumeId:(NSString *)theVolumeId andDescriptionValue:(NSString *)theDescriptionValue
{
    if (self = [self init]) {
        self.volumeId         = theVolumeId;
        self.descriptionValue = theDescriptionValue;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VolumeId: %@,", volumeId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [volumeId release];
    [descriptionValue release];

    [super dealloc];
}


@end
