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


#import "S3AbortMultipartUploadRequest.h"


@implementation S3AbortMultipartUploadRequest

-(id)initWithMultipartUpload:(S3MultipartUpload *)multipartUpload
{
    if(self = [super init])
    {
        self.bucket   = multipartUpload.bucket;
        self.key      = multipartUpload.key;
        self.uploadId = multipartUpload.uploadId;
    }

    return self;
}

-(NSMutableURLRequest *)configureURLRequest
{
    [self setSubResource:[NSString stringWithFormat:@"%@=%@", kS3SubResourceUploadId, self.uploadId]];

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodDelete];

    return urlRequest;
}

@synthesize uploadId;

-(void)dealloc
{
    [uploadId release];

    [super dealloc];
}

@end
