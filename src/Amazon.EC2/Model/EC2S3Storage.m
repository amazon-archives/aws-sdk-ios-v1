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

#import "EC2S3Storage.h"


@implementation EC2S3Storage

@synthesize bucket;
@synthesize prefix;
@synthesize aWSAccessKeyId;
@synthesize uploadPolicy;
@synthesize uploadPolicySignature;


-(id)init
{
    if (self = [super init]) {
        bucket                = nil;
        prefix                = nil;
        aWSAccessKeyId        = nil;
        uploadPolicy          = nil;
        uploadPolicySignature = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Bucket: %@,", bucket] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Prefix: %@,", prefix] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AWSAccessKeyId: %@,", aWSAccessKeyId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UploadPolicy: %@,", uploadPolicy] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UploadPolicySignature: %@,", uploadPolicySignature] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [bucket release];
    [prefix release];
    [aWSAccessKeyId release];
    [uploadPolicy release];
    [uploadPolicySignature release];

    [super dealloc];
}


@end
