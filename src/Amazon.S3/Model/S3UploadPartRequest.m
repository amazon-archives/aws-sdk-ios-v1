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

#import "S3UploadPartRequest.h"
#import "AmazonMD5Util.h"

@implementation S3UploadPartRequest

-(id)initWithMultipartUpload:(S3MultipartUpload *)multipartUpload
{
    if(self = [super init])
    {
        self.bucket   = multipartUpload.bucket;
        self.key      = multipartUpload.key;
        self.uploadId = multipartUpload.uploadId;

        _contentMD5 = nil;
        _generateMD5 = YES;
    }

    return self;
}

-(NSMutableURLRequest *)configureURLRequest
{
    if (nil == self.contentMD5 && YES == self.generateMD5 && self.data != nil) {
        self.contentMD5 = [AmazonMD5Util base64md5FromData:self.data];
    }

    self.subResource = [NSString stringWithFormat:@"%@=%d&%@=%@", kS3QueryParamPartNumber, self.partNumber, kS3QueryParamUploadId, self.uploadId];

    if (self.contentLength < 1) {
        self.contentLength = [self.data length];
    }
    [super configureURLRequest];

    if (self.stream != nil) {
        [self.urlRequest setHTTPBodyStream:self.stream];
    }
    else {
        [self.urlRequest setHTTPBody:self.data];
    }
    if (nil != self.contentMD5) {
        [self.urlRequest setValue:self.contentMD5 forHTTPHeaderField:kHttpHdrContentMD5];
    }

    [urlRequest setHTTPMethod:kHttpMethodPut];

    return urlRequest;
}

-(void)dealloc
{
    [_contentMD5 release];
    [_uploadId release];
    [_data release];
    [_stream release];

    [super dealloc];
}

@end
