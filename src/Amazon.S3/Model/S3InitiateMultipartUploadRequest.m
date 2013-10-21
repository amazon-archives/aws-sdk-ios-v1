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

@interface S3InitiateMultipartUploadRequest () {
}

@property (nonatomic, assign) BOOL expiresSet;

@end


@implementation S3InitiateMultipartUploadRequest

-(id)init
{
    if (self = [super init])
    {
        _expires = 0;
        _expiresSet = NO;
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

-(void)setExpires:(int32_t)exp
{
    _expires    = exp;
    _expiresSet = YES;
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

    if (self.expiresSet) {
        [self.urlRequest setValue:[NSString stringWithFormat:@"%d", self.expires]
               forHTTPHeaderField:kHttpHdrExpires];
    }

    return urlRequest;
}

-(void)dealloc
{
    [_cacheControl release];
    [_contentDisposition release];
    [_contentEncoding release];
    [_redirectLocation release];

    [super dealloc];
}

@end
