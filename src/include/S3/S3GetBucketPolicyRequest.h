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

/** Gets the policy for the specified bucket. Only the owner of the
 * bucket can retrieve the policy. If no policy has been set for the bucket,
 * then an empty result object with a <code>null</code> policy text field will be
 * returned.
 *
 * Bucket policies provide access control management at the bucket level for
 * both the bucket resource and contained object resources. Only one policy
 * can be specified per-bucket.
 *
 * See the <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/">
 * Amazon S3 developer guide</a> for more information on forming bucket
 * polices.
 *
 * <br />Required Parameters: bucket
 *
 */
@interface S3GetBucketPolicyRequest:S3Request {
}

@end
