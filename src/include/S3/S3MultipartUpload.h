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
#import "S3Owner.h"

/** The result of an initiateMultipartUpload request. The uploadId is used in all subsequent
 * interactions for this multipart upload.
 *
 */
@interface S3MultipartUpload:NSObject {
    NSString *key;
    NSString *bucket;
    NSString *uploadId;
    NSString *storageClass;
    NSDate   *initiated;
    S3Owner  *initiator;
    S3Owner  *owner;
}

/** Object key for which the multipart upload was initiated. */
@property (nonatomic, retain) NSString *key;

/** Name of the bucket to which the multipart upload was initiated. */
@property (nonatomic, retain) NSString *bucket;

/** ID for the initiated multipart upload. */
@property (nonatomic, retain) NSString *uploadId;

/** The class of storage (STANDARD or REDUCED_REDUDANCY) that will be used to store the object when the multipart upload is complete. */
@property (nonatomic, retain) NSString *storageClass;

/** Who initiated the multipart upload. */
@property (nonatomic, retain) S3Owner *initiator;

/** Container element that identifies the object owner, after the object is created. */
@property (nonatomic, retain) S3Owner *owner;

/** Date and time at which the multipart upload was initiated. */
@property (nonatomic, retain) NSDate *initiated;

@end
