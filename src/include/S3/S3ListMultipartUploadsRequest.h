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


/** Contains the parameters used for the listMultipartUploads operation.
 *
 */
@interface S3ListMultipartUploadsRequest:S3Request {
    NSString  *delimiter;
    NSString  *keyMarker;
    NSString  *prefix;
    NSString  *uploadIdMarker;

    NSInteger maxUploads;
    bool      maxUploadsIsSet;
}


/** Gets and sets the delimiter property.
 * Causes keys that contain the same string between the prefix and the
 * first occurrence of the delimiter to be rolled up into a single result
 * element in the commonPrefixes collection.
 *
 * These rolled-up keys are not returned elsewhere in the response.
 */
@property (nonatomic, retain) NSString *delimiter;

/** Gets and sets the keyMarker property.
 *
 * Together with UploadIdMarker, specifies the multipart upload after
 * which listing should begin.
 *
 * If UploadIdMarker is not specified, only the keys lexicographically
 * greater than the specified key-marker will be included in the list.
 *
 * If UploadIdMarker is specified, any multipart uploads for a key
 * equal to the key-marker may also be included, provided those multipart
 * uploads have upload IDs lexicographically greater than the specified
 * UploadIdMarker.
 */
@property (nonatomic, retain) NSString *keyMarker;

/** Gets and sets the Prefix property.
 *  All keys matched will have this prefix.
 */
@property (nonatomic, retain) NSString *prefix;

/** Gets and sets the uploadIdMarker property.
 *
 * Together with KeyMarker, specifies the multipart upload after which
 * listing should begin. If KeyMarker is not specified, the
 * UploadIdMarker parameter is ignored. Otherwise, any multipart
 * uploads for a key equal to the KeyMarker may be included in the list
 * only if they have an upload ID lexicographically greater than the specified
 */
@property (nonatomic, retain) NSString *uploadIdMarker;

/** Gets and sets the maximum number of multipart uploads to return in the response. */
@property (nonatomic) NSInteger maxUploads;

@end
