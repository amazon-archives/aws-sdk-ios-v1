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

#import "S3ListObjectsResult.h"

@implementation S3ListObjectsResult

-(NSMutableArray *)objectSummaries
{
    if (nil == _objectSummaries) {
        _objectSummaries = [NSMutableArray new];
    }
    return _objectSummaries;
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Summaries: %@,", self.objectSummaries] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Common Prefixes: %@,", self.commonPrefixes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", self.bucketName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Prefix: %@,", self.prefix] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Marker: %@,", self.marker] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Delimiter: %@,", self.delimiter] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Max Keys: %d,", self.maxKeys] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Is Truncated: %d,", self.isTruncated] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}

-(void)dealloc
{
    [_objectSummaries release];
    [_bucketName release];
    [_prefix release];
    [_marker release];
    [_delimiter release];
    [_commonPrefixes release];

    [super dealloc];
}


@end
