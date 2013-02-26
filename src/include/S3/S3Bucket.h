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

/** Represents an S3 Bucket.
 * Contains a Bucket Name which is the name of the S3 Bucket.
 * And a Creation Date which is the date that the S3 Bucket was created.
 *
 */
@interface S3Bucket:NSObject {
    NSString *name;
    NSString *creationDate;
}

/** Gets and sets the BucketName property. */
@property (nonatomic, retain) NSString *name;

/** Gets and sets the CreationDate property.
 * The date conforms to the ISO8601 date format.
 */
@property (nonatomic, retain) NSString *creationDate;

@end
