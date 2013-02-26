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

/** Represents a Amazon S3 bucket policy.
 * Bucket policies provide access control management at the bucket level for
 * both the bucket resource and contained object resources. Only one policy may
 * be specified per bucket.
 *
 * Buckets have no policy text until one is explicitly specified.
 * Requesting the bucket policy for a newly created bucket will return a
 * policy object with <code>null</code> policy text.
 *
 */
@interface S3BucketPolicy:NSObject {
    NSString *policyText;
}

/** The raw, policy JSON text, as returned by Amazon S3 */
@property (nonatomic, retain) NSString *policyText;


/** Initialize the object with a policy */
-(id)initWithPolicy:(NSString *)policyText;

@end
