/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

/** a container for elements related to a particular part of a multipart upload.
 *
 */
@interface S3Part:NSObject {
    NSString  *etag;
    NSDate    *lastModified;
    NSInteger partNumber;
    long long size;
}

/** The entity tag returned when the part was uploaded. */
@property (nonatomic, retain) NSString *etag;

/** The date and time at which the part was uploaded. */
@property (nonatomic, retain) NSDate *lastModified;

/** The unique part number identifying the part. */
@property (nonatomic) NSInteger partNumber;

/** The size of the uploaded part data. */
@property (nonatomic) long long size;

@end
