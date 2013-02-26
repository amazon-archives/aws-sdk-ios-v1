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
#import "S3Request.h"
#import "S3BucketPolicy.h"

@class S3GetBucketPolicyRequest;

/** Sets the policy associated with the specified bucket. Only the owner of
 * the bucket can set a bucket policy. If a policy already exists for the
 * specified bucket, the new policy replaces the existing policy.
 *
 * Bucket policies provide access control management at the bucket level for
 * both the bucket resource and contained object resources. Only one policy
 * can be specified per-bucket.
 *
 * See the <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/">
 * Amazon S3 developer guide</a> for more information on forming bucket
 * polices.
 *
 * <br />Required Parameters: bucket, policy
 *
 */
@interface S3SetBucketPolicyRequest:S3Request {
    S3BucketPolicy *policy;
}


/** The bucket policy */
@property (nonatomic, retain) S3BucketPolicy *policy;

@end
