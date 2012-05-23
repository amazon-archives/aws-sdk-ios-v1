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
#import "S3Request.h"
#import "S3MultiFactorAuthentication.h"

/** Provides options for deleting a specific version of an object in the specified bucket.
 * Once deleted, there is no method to restore or undelete an object version.
 * This is the only way to permanently delete object versions that are protected
 * by versioning.
 *
 * Because deleting an object version is permanent and irreversible, it is a
 * privileged operation that only the owner of the bucket containing the version
 * may perform.
 *
 * An owner can only delete a version of an object if the owner has enabled versioning for
 * their bucket.
 *
 * Note: When attempting to delete an object that does not exist,
 * Amazon S3 returns a success message, not an error message.
 *
 * <br />Required Parameters: bucket, key
 *
 */
@interface S3DeleteVersionRequest:S3Request {
    NSString                    *versionId;
    S3MultiFactorAuthentication *mfa;
}

/**
 * The version ID uniquely identifying which version of the object to
 * delete.
 */
@property (nonatomic, retain) NSString *versionId;

/**
 * The optional Multi-Factor Authentication information to include with this
 * request. Multi-Factor Authentication is required when deleting a version
 * from a bucket that has enabled MFA Delete in its bucket versioning
 * configuration.
 */
@property (nonatomic, retain) S3MultiFactorAuthentication *mfa;

@end
