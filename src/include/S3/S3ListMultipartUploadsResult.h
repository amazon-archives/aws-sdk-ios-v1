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

/** Contains all the information about the listMultipartUploads method.
 */
@interface S3ListMultipartUploadsResult:NSObject {
    NSString       *bucket;
    NSString       *keyMarker;
    NSString       *uploadIdMarker;
    NSString       *nextKeyMarker;
    NSString       *nextUploadIdMarker;
    NSString       *delimiter;
    NSString       *prefix;

    NSMutableArray *commonPrefixes;
    NSMutableArray *uploads;

    bool           isTruncated;
    NSInteger      maxUploads;
}


/** The name of the bucket to list uploads. */
@property (nonatomic, retain) NSString *bucket;

/** The key at or after which the listing began. */
@property (nonatomic, retain) NSString *keyMarker;

/** Upload ID after which listing began. */
@property (nonatomic, retain) NSString *uploadIdMarker;

/** Specifies the value that should be used for the key-marker request parameter in a subsequent request. */
@property (nonatomic, retain) NSString *nextKeyMarker;

/** Specifies the value that should be used for the upload-id-marker request parameter in a subsequent request. */
@property (nonatomic, retain) NSString *nextUploadIdMarker;

/** Contains the delimiter that was specified in the request. */
@property (nonatomic, retain) NSString *delimiter;

/** Contains the prefix that was specified in the request. */
@property (nonatomic, retain) NSString *prefix;

/** If you specify a delimiter in the request, then the result returns each distinct key prefix containing the delimiter.*/
@property (nonatomic, readonly) NSMutableArray *commonPrefixes;

/** The list of S3MultipartUPload instance returned in the response. */
@property (nonatomic, readonly) NSMutableArray *uploads;

/** The maxUploads that was specified in the request. */
@property (nonatomic) NSInteger maxUploads;

/** Indicates whether the returned list of multipart uploads is truncated. */
@property (nonatomic) bool isTruncated;


@end
