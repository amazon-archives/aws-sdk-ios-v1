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

/** The S3CompleteMultipartUploadResult contains all the information about the completeMultipartUploadResult method.
 *
 */
@interface S3CompleteMultipartUploadResult:NSObject {
    NSString *location;
    NSString *bucket;
    NSString *key;
    NSString *etag;
}

/** The URI that identifies the newly created object. */
@property (nonatomic, retain) NSString *location;

/** The name of the bucket that contains the newly created object. */
@property (nonatomic, retain) NSString *bucket;

/** The object key of the newly created object. */
@property (nonatomic, retain) NSString *key;

/** Entity tag that identifies the newly created object's data. */
@property (nonatomic, retain) NSString *etag;


@end
