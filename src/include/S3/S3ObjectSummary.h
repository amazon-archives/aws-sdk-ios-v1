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

/** Represents an S3 Object Summary.
 *
 */
@interface S3ObjectSummary:NSObject {
    NSString  *key;
    NSString  *etag;
    NSInteger size;
    NSString  *storageClass;
    NSString  *lastModified;

    S3Owner   *owner;
}


/** The key of the Amazon S3 object. */
@property (nonatomic, retain) NSString *key;

/** The ETag of the Amazon S3 object. */
@property (nonatomic, retain) NSString *etag;

/** The size of the Amazon S3 object, in bytes. */
@property (nonatomic) NSInteger size;

/** The date this object was last modified. */
@property (nonatomic, retain) NSString *lastModified;

/** The class of storage used by this object. */
@property (nonatomic, retain) NSString *storageClass;

/** The owner of this object. Can be nil if the requester
 * doesn't have permission to view ownership.
 */
@property (nonatomic, retain) S3Owner *owner;

/** The string representation of the S3ObjectSummary */
-(NSString *)description;


@end
