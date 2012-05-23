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

/** Contains the parameters used for the completeMultipartUpload operation.
 *
 */
@interface S3CompleteMultipartUploadRequest:S3Request {
    NSMutableDictionary *parts;
    NSString            *uploadId;
}

@property (nonatomic, retain) NSString *uploadId;

/** Initialize the instance with the bucket, key, and uploadId from an S3MultipartUpload instance. */
-(id)initWithMultipartUpload:(S3MultipartUpload *)multipartUpload;

/** Add a part by part number and the ETag that was returned by uploadPart. */
-(void)addPartWithPartNumber:(int)partNumber withETag:(NSString *)etag;

/** Build the request body for the request */
-(NSData *)requestBody;

@end
