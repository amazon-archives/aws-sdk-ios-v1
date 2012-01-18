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

#import "S3ListObjectsResult.h"


@implementation S3ListObjectsResult

@synthesize objectSummaries;
@synthesize bucketName;
@synthesize prefix;
@synthesize marker;
@synthesize delimiter;
@synthesize maxKeys;
@synthesize isTruncated;
@synthesize commonPrefixes;


-(void)setObjectSummaries:(NSMutableArray *)theSummaries
{
    objectSummaries = theSummaries;
}

-(NSMutableArray *)objectSummaries
{
    if (nil == objectSummaries) {
        objectSummaries = [[NSMutableArray alloc] init];
    }
    return objectSummaries;
}

-(void)setCommonPrefixes:(NSMutableArray *)prefixes
{
    commonPrefixes = prefixes;
}

-(NSMutableArray *)commonPrefixes
{
    if (nil == commonPrefixes) {
        commonPrefixes = [[NSMutableArray alloc] init];
    }
    return commonPrefixes;
}

-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Summaries: %@,", objectSummaries] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Common Prefixes: %@,", commonPrefixes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", bucketName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Prefix: %@,", prefix] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Marker: %@,", marker] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Delimiter: %@,", delimiter] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Max Keys: %d,", maxKeys] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Is Truncated: %d,", isTruncated] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}

-(void)dealloc
{
    [objectSummaries release];
    [bucketName release];
    [prefix release];
    [marker release];
    [delimiter release];
    [commonPrefixes release];

    [super dealloc];
}


@end
