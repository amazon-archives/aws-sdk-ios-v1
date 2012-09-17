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

#import "S3InitiateMultipartUploadRequest.h"

@implementation S3InitiateMultipartUploadRequest

@synthesize cacheControl;
@synthesize contentDisposition;
@synthesize contentEncoding;

-(id)init
{
    if (self = [super init])
    {
        expiresSet = NO;
    }
    return self;
}

-(void)setExpires:(NSInteger)exp
{
    expires    = exp;
    expiresSet = YES;
}

-(NSInteger)expires
{
    return expires;
}

-(NSMutableURLRequest *)configureURLRequest
{
    [self setSubResource:kS3SubResourceUploads];

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodPost];

    if (nil != self.contentEncoding) {
        [self.urlRequest setValue:self.contentEncoding forHTTPHeaderField:kHttpHdrContentEncoding];
    }
    if (nil != self.contentDisposition) {
        [self.urlRequest setValue:self.contentDisposition forHTTPHeaderField:kHttpHdrContentDisposition];
    }
    if (nil != self.cacheControl) {
        [self.urlRequest setValue:self.cacheControl forHTTPHeaderField:kHttpHdrCacheControl];
    }

    if (expiresSet) {
        [self.urlRequest setValue:[NSString stringWithFormat:@"%d", self.expires] forHTTPHeaderField:kHttpHdrExpires];
    }

    return urlRequest;
}

-(id)initWithKey:(NSString *)aKey inBucket:(NSString *)aBucket
{
    if(self = [super init])
    {
        self.key    = aKey;
        self.bucket = aBucket;
    }

    return self;
}

-(void)dealloc
{
    [cacheControl release];
    [contentEncoding release];
    [contentDisposition release];

    [super dealloc];
}

@end
