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

#import "S3VersionSummary.h"


@implementation S3VersionSummary

@synthesize displayName;
@synthesize isLatest;
@synthesize versionId;
@synthesize isDeleteMarker;


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Key: %@,", key] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ETag: %@,", etag] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Size: %d,", size] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Last Modified: %@,", lastModified] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Storage Class: %@,", storageClass] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Owner: %@,", owner] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Display Name: %@,", displayName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Is Latest: %d,", isLatest] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Is DeleteMarker: %d,", isDeleteMarker] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Version Id: %@,", versionId] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}

-(void)dealloc
{
    [versionId release];
    [displayName release];

    [super dealloc];
}

@end
