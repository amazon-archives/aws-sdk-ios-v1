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
#import "S3ServiceModel.h"

@class S3Owner;
@class S3Bucket;

/** Contains the owner and list of buckets returned by a listBuckets request
 *
 */
@interface S3ListBucketsResult:NSObject {
    S3Owner        *owner;
    NSMutableArray *buckets;
}

/** The owner of the buckets */
@property (nonatomic, retain) S3Owner *owner;

/** The list of buckets */
@property (nonatomic, readonly) NSMutableArray *buckets;

@end
