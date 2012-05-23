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

#define kS3CannedAclPrivate                   @"private"
#define kS3CannedAclPublicRead                @"public-read"
#define kS3CannedAclPublicReadWrite           @"public-read-write"
#define kS3CannedAclAuthRead                  @"authenticated-read"
#define kS3CannedAclBucketOwnerRead           @"bucket-owner-read"
#define kS3CannedAclBucketOwnerFullControl    @"bucket-owner-full-control"

/** An Enumeration of all possible CannedACLs that can be used
 * for S3 Buckets or S3 Objects.
 * @see http://docs.amazonwebservices.com/AmazonS3/latest/RESTAccessPolicy.html#RESTCannedAccessPolicies
 *
 */
@interface S3CannedACL:NSObject {
    NSString *stringValue;
}

-(id)initWithStringValue:(NSString *)value;

/** Owner gets FULL_CONTROL.
 * No one else has access rights (default).
 */
+(S3CannedACL *)private;

/** Owner gets FULL_CONTROL and the anonymous principal is granted READ access.
 * If this policy is used on an object, it can be read from a browser with no authentication.
 */
+(S3CannedACL *)publicRead;

/**
 * Owner gets FULL_CONTROL, the anonymous principal is granted READ and WRITE access.
 */
+(S3CannedACL *)publicReadWrite;

/** Owner gets FULL_CONTROL, and any principal authenticated as a registered Amazon
 * S3 user is granted READ access.
 */
+(S3CannedACL *)authenticatedRead;

/** Object Owner gets FULL_CONTROL, Bucket Owner gets READ.
 * This ACL applies only to objects and is equivalent to private when used with PUT Bucket.
 * You use this ACL to let someone other than the bucket owner write content (get full control)
 * in the bucket but still grant the bucket owner read access to the objects.
 */
+(S3CannedACL *)bucketOwnerRead;

/** Object Owner gets FULL_CONTROL, Bucket Owner gets FULL_CONTROL.
 * This ACL applies only to objects and is equivalent to private when used with PUT Bucket.
 * You use this ACL to let someone other than the bucket owner write content (get full control)
 * in the bucket but still grant the bucket owner full rights over the objects.
 */
+(S3CannedACL *)bucketOwnerFullControl;

@end
