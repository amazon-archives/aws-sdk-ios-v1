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

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonClientException.h>
#else
#import "../AmazonClientException.h"
#endif

#import "S3Request.h"
#import "S3BucketNameUtilities.h"
#import "S3Constants.h"
#import "S3CannedACL.h"
#import "S3Region.h"
#import "S3AccessControlList.h"

/** Contains the parameters used for the createBucket operation.
 *
 */
@interface S3CreateBucketRequest:S3Request {
    S3Region            *region;
    S3CannedACL         *cannedACL;
    S3AccessControlList *fullACL;
}

/** Region where the bucket should be created. */
@property (nonatomic, retain) S3Region *region;

/** The body of the request if there is a region specified */
@property (nonatomic, readonly) NSData *createBucketConfiguration;

/** The canned access control list to apply to the bucket */
@property (nonatomic, retain) S3CannedACL *cannedACL;

/** A full access control list to apply to the bucket */
@property (nonatomic, retain) S3AccessControlList *fullACL;

/** Initializes the request with a bucket name.
 *
 * @param theBucketName The name of the bucket
 */
-(id)initWithName:(NSString *)theBucketName;

/** Initializes the request with a bucket name and region.
 *
 * @param theBucketName The name of the bucket
 * @param theRegion	The region where the bucket should be created.
 */
-(id)initWithName:(NSString *)theBucketName andRegion:(S3Region *)theRegion;

@end
