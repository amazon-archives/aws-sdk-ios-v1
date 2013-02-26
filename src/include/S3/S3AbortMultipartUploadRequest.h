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


#import <Foundation/Foundation.h>
#import "S3Request.h"
#import "S3MultipartUpload.h"


/** Contains the parameters used for the abortMultipartUpload operation.
 *
 */
@interface S3AbortMultipartUploadRequest:S3Request {
    NSString *uploadId;
}

/** The id of the upload to abort. */
@property (nonatomic, retain) NSString *uploadId;

/** Initializes the instance with the bucket, key, and uploadId from an S3MultipartUpload instance returned in an S3MultipartUploadResponse. */
-(id)initWithMultipartUpload:(S3MultipartUpload *)multipartUpload;

@end
