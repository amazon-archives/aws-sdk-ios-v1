/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "S3ListVersionsResult.h"


@implementation S3ListVersionsResult


-(NSMutableArray *)versionSummaries
{
    if (nil == _versionSummaries) {
        _versionSummaries = [NSMutableArray new];
    }
    return _versionSummaries;
}

-(NSMutableArray *)commonPrefixes
{
    if (nil == _commonPrefixes) {
        _commonPrefixes = [NSMutableArray new];
    }
    return _commonPrefixes;
}

-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Summaries: %@,", self.versionSummaries] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Common Prefixes: %@,", self.commonPrefixes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", self.name] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Prefix: %@,", self.prefix] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Key Marker: %@,", self.keyMarker] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Next Key Marker: %@,", self.nextKeyMarker] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Version Id Marker: %@,", self.versionIdMarker] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Next Version Id Marker: %@,", self.nextVersionIdMarker] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Delimiter: %@,", self.delimiter] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Max Keys: %d,", self.maxKeys] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Is Truncated: %d,", self.isTruncated] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}

-(void)addDeleteMarker:(S3VersionSummary *)deleteMarker
{
    deleteMarker.isDeleteMarker = YES;
    [self.versionSummaries addObject:deleteMarker];
}

-(void)dealloc
{
    [_versionSummaries release];
    [_name release];
    [_prefix release];
    [_keyMarker release];
    [_nextKeyMarker release];
    [_versionIdMarker release];
    [_nextVersionIdMarker release];
    [_delimiter release];
    [_commonPrefixes release];

    [super dealloc];
}


@end
