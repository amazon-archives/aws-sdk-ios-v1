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

#import "S3CopyObjectRequest.h"

@implementation S3CopyObjectRequest

@synthesize sourceKey;
@synthesize sourceBucket;
@synthesize metadataDirective;
@synthesize ifMatch;
@synthesize ifNoneMatch;
@synthesize ifModifiedSince;
@synthesize ifUnmodifiedSince;
@synthesize redirectLocation;

- (id)init
{
    if(self = [super init])
    {
        sourceKey = nil;
        sourceBucket = nil;
        metadataDirective = nil;
        ifMatch = nil;
        ifNoneMatch = nil;
        ifModifiedSince = nil;
        ifUnmodifiedSince = nil;
        redirectLocation = nil;
    }

    return self;
}

-(id)initWithSourceKey:(NSString *)srcKey sourceBucket:(NSString *)srcBucket destinationKey:(NSString *)dstKey destinationBucket:(NSString *)dstBucket
{
    if (self = [self init])
    {
        self.sourceKey    = srcKey;
        self.sourceBucket = srcBucket;
        self.key          = dstKey;
        self.bucket       = dstBucket;
    }

    return self;
}

-(NSMutableURLRequest *)configureURLRequest
{
    [super configureURLRequest];

    // Assume that the destination bucket is the same as the source if not explicitly set
    if (nil == self.bucket) {
        self.bucket = self.sourceBucket;
    }

    //Assume that the destination key is the same as the source if not explicitly set
    if (nil == self.key) {
        self.key = self.sourceKey;
    }

    [self.urlRequest setHTTPMethod:kHttpMethodPut];

    [self.urlRequest setValue:[NSString stringWithFormat:@"%@/%@", self.sourceBucket, self.sourceKey, nil]
           forHTTPHeaderField:kHttpHdrAmzCopySource];

    if (nil != self.metadataDirective) {
        [self.urlRequest setValue:self.metadataDirective
               forHTTPHeaderField:kHttpHdrAmzMetaDirective];
    }
    if (nil != self.ifMatch) {
        [self.urlRequest setValue:self.ifMatch
               forHTTPHeaderField:kHttpHdrAmzCopySourceIfMatch];
    }
    if (nil != self.ifNoneMatch) {
        [self.urlRequest setValue:self.ifNoneMatch
               forHTTPHeaderField:kHttpHdrAmzCopySourceIfNoneMatch];
    }
    if (nil != self.ifModifiedSince) {
        [self.urlRequest setValue:[self.ifModifiedSince requestFormat]
               forHTTPHeaderField:kHttpHdrAmzCopySourceIfModified];
    }
    if (nil != self.ifUnmodifiedSince) {
        [self.urlRequest setValue:[self.ifUnmodifiedSince requestFormat]
               forHTTPHeaderField:kHttpHdrAmzCopySourceIfUnmodified];
    }
    if (nil != self.redirectLocation) {
        [self.urlRequest setValue:self.redirectLocation
               forHTTPHeaderField:kHttpHdrAmzWebsiteRedirectLocation];
    }

    return urlRequest;
}

-(void)dealloc
{
    [sourceKey release];
    [sourceBucket release];
    [metadataDirective release];
    [ifMatch release];
    [ifNoneMatch release];
    [ifModifiedSince release];
    [ifUnmodifiedSince release];
    [redirectLocation release];

    [super dealloc];
}

@end
