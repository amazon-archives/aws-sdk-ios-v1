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

/** Contains the parameters used for the uploadPart operation.
 *
 */
@interface S3CopyPartRequest:S3Request {
    int      partNumber;
    NSString *uploadId;

    NSString *sourceBucketName;
    NSString *sourceKey;
    NSString *sourceVersionId;

    NSString *destinationBucketName;
    NSString *destinationKey;

    NSString *ifMatch;
    NSString *ifNoneMatch;

    NSDate   *ifModifiedSince;
    NSDate   *ifUnmodifiedSince;

    NSNumber *firstByte;
    NSNumber *lastByte;
}

/** Identifies which part this is. */
@property (nonatomic) int partNumber;

/** The uploadId of the multipart upload that this part is for. */
@property (nonatomic, retain) NSString *uploadId;

@property (nonatomic, retain) NSString *sourceBucketName;
@property (nonatomic, retain) NSString *sourceKey;
@property (nonatomic, retain) NSString *sourceVersionId;

@property (nonatomic, retain) NSString *destinationBucketName;
@property (nonatomic, retain) NSString *destinationKey;

@property (nonatomic, retain) NSString *ifMatch;
@property (nonatomic, retain) NSString *ifNoneMatch;

@property (nonatomic, retain) NSDate   *ifModifiedSince;
@property (nonatomic, retain) NSDate   *ifUnmodifiedSince;

@property (nonatomic, retain) NSNumber *firstByte;
@property (nonatomic, retain) NSNumber *lastByte;

@end
