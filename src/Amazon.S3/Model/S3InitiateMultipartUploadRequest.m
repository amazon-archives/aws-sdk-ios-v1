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

#import "S3InitiateMultipartUploadRequest.h"

@implementation S3InitiateMultipartUploadRequest

@synthesize cacheControl;
@synthesize contentDisposition;
@synthesize contentEncoding;
@synthesize redirectLocation;
@synthesize expires;

-(id)init
{
    if (self = [super init])
    {
        cacheControl = nil;
        contentDisposition = nil;
        contentEncoding = nil;
        redirectLocation = nil;
        expires = 0;
        
        expiresSet = NO;
    }
    
    return self;
}

-(id)initWithKey:(NSString *)aKey inBucket:(NSString *)aBucket
{
    if(self = [self init])
    {
        self.key    = aKey;
        self.bucket = aBucket;
    }

    return self;
}

-(void)setExpires:(NSInteger)exp
{
    expires    = exp;
    expiresSet = YES;
}

-(NSMutableURLRequest *)configureURLRequest
{
    [self setSubResource:kS3SubResourceUploads];

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodPost];

    if (nil != self.contentEncoding) {
        [self.urlRequest setValue:self.contentEncoding
               forHTTPHeaderField:kHttpHdrContentEncoding];
    }
    if (nil != self.contentDisposition) {
        [self.urlRequest setValue:self.contentDisposition
               forHTTPHeaderField:kHttpHdrContentDisposition];
    }
    if (nil != self.cacheControl) {
        [self.urlRequest setValue:self.cacheControl
               forHTTPHeaderField:kHttpHdrCacheControl];
    }
    if (nil != self.redirectLocation) {
        [self.urlRequest setValue:self.redirectLocation
               forHTTPHeaderField:kHttpHdrAmzWebsiteRedirectLocation];
    }

    if (expiresSet) {
        [self.urlRequest setValue:[NSString stringWithFormat:@"%d", self.expires]
               forHTTPHeaderField:kHttpHdrExpires];
    }

    return urlRequest;
}

-(void)dealloc
{
    [cacheControl release];
    [contentEncoding release];
    [contentDisposition release];
    [redirectLocation release];

    [super dealloc];
}

@end
