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

#import "EC2ExportToS3TaskSpecification.h"


@implementation EC2ExportToS3TaskSpecification

@synthesize diskImageFormat;
@synthesize containerFormat;
@synthesize s3Bucket;
@synthesize s3Prefix;


-(id)init
{
    if (self = [super init]) {
        diskImageFormat = nil;
        containerFormat = nil;
        s3Bucket        = nil;
        s3Prefix        = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DiskImageFormat: %@,", diskImageFormat] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ContainerFormat: %@,", containerFormat] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"S3Bucket: %@,", s3Bucket] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"S3Prefix: %@,", s3Prefix] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [diskImageFormat release];
    [containerFormat release];
    [s3Bucket release];
    [s3Prefix release];

    [super dealloc];
}


@end
