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

#import <Foundation/Foundation.h>
#import "S3Request.h"
#import "S3MultipartUpload.h"

/** Contains the parameters used for the listParts operation.
 *
 */
@interface S3ListPartsRequest:S3Request {
    NSString  *uploadId;
    NSInteger maxParts;
    NSInteger partNumberMarker;
}

/** The uploadId of the multipart upload to list */
@property (nonatomic, retain) NSString *uploadId;

/** The maximum number of parts to return.
 *
 * The default value is 1000.
 */
@property (nonatomic) int maxParts;

/** The part after which to start the listing. */
@property (nonatomic) int partNumberMarker;

/** Initializes the instance with the bucket, key, and uploadId from an S3MultipartUpload instance returned in an S3MultipartUploadResponse. */
-(id)initWithMultipartUpload:(S3MultipartUpload *)multipartUpload;

@end
