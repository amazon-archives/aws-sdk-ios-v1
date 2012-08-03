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

/** The S3ListPartsResult contains all the information about the listParts method.
 *
 */
@interface S3ListPartsResult:NSObject {
    NSString       *bucket;
    NSString       *key;
    NSString       *uploadId;
    NSString       *storageClass;

    S3Owner        *owner;
    S3Owner        *initiator;

    NSInteger      partNumberMarker;
    NSInteger      nextPartNumberMarker;
    NSInteger      maxParts;

    bool           isTruncated;

    NSMutableArray *parts;
}

/** The name of the bucket to which the multipart upload was initiated. */
@property (nonatomic, retain) NSString *bucket;

/** Tthe object key for which the multipart upload was initiated. */
@property (nonatomic, retain) NSString *key;

/** The upload ID identifying the multipart upload whose parts are being listed. */
@property (nonatomic, retain) NSString *uploadId;

/** The class of storage used to store the uploaded object. */
@property (nonatomic, retain) NSString *storageClass;

/** The owner of the object that will be created from the parts */
@property (nonatomic, retain) S3Owner *owner;

/** The initiator of the multipart upload */
@property (nonatomic, retain) S3Owner *initiator;

/** The part number after which listing begins. */
@property (nonatomic) int partNumberMarker;

/** When a list is truncated, specifies the last part that should be skipped
 * over to resume listing. Use this value for the partNumberMarker
 * request property in a subsequent request.
 */
@property (nonatomic) int nextPartNumberMarker;

/** The maxParts which was supplied in the request. */
@property (nonatomic) int maxParts;

/** Indicates whether the returned list of parts is truncated. A value true
 * indicates the list was truncated. A list may be truncated if the number of
 * parts exceeds the limit specified by MaxParts.
 */
@property (nonatomic) bool isTruncated;

/** The list of S3Part objects representing the parts */
@property (nonatomic, readonly) NSMutableArray *parts;

@end
