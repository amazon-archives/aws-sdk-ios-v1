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

#import "S3CopyPartRequest.h"


@implementation S3CopyPartRequest

@synthesize uploadId;
@synthesize partNumber;

@synthesize sourceBucketName;
@synthesize sourceKey;
@synthesize sourceVersionId;

@synthesize destinationBucketName;
@synthesize destinationKey;

@synthesize ifMatch;
@synthesize ifNoneMatch;
@synthesize ifModifiedSince;
@synthesize ifUnmodifiedSince;

@synthesize firstByte;
@synthesize lastByte;


-(NSMutableURLRequest *)configureURLRequest
{
    self.bucket = destinationBucketName;
    self.key    = destinationKey;

    NSString *sourceHeader = [NSString stringWithFormat:@"/%@/%@", [AmazonSDKUtil urlEncode:self.sourceBucketName], [AmazonSDKUtil urlEncode:self.sourceKey]];
    if (sourceVersionId != nil) {
        sourceHeader = [NSString stringWithFormat:@"%@?%@=%@", sourceHeader, kS3SubResourceVersionId, sourceVersionId];
    }
    [self.urlRequest setValue:sourceHeader forHTTPHeaderField:kHttpHdrAmzCopySource];

    if (nil != self.ifModifiedSince) {
        [self.urlRequest setValue:[self.ifModifiedSince requestFormat] forHTTPHeaderField:kHttpHdrAmzCopySourceIfModified];
    }
    if (nil != self.ifUnmodifiedSince) {
        [self.urlRequest setValue:[self.ifUnmodifiedSince requestFormat] forHTTPHeaderField:kHttpHdrAmzCopySourceIfUnmodified];
    }

    if (nil != self.ifMatch) {
        [self.urlRequest setValue:self.ifMatch forHTTPHeaderField:kHttpHdrAmzCopySourceIfMatch];
    }
    if (nil != self.ifNoneMatch) {
        [self.urlRequest setValue:self.ifNoneMatch forHTTPHeaderField:kHttpHdrAmzCopySourceIfNoneMatch];
    }

    if (nil != self.firstByte && nil != self.lastByte) {
        NSString *range = [NSString stringWithFormat:@"bytes=%ld-%ld", [firstByte longValue], [lastByte longValue]];
        [self.urlRequest setValue:range forHTTPHeaderField:kHttpHdrRange];
    }

    self.subResource = [NSString stringWithFormat:@"%@=%d&%@=%@", kS3QueryParamPartNumber, self.partNumber, kS3QueryParamUploadId, self.uploadId];

    self.contentLength = 0;
    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodPut];

    return urlRequest;
}

-(void)dealloc
{
    [uploadId release];

    [super dealloc];
}

@end
