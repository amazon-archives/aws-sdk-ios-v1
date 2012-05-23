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

#define kS3AclPermissionFullControl    @"FULL_CONTROL"
#define kS3AclPermissionWrite          @"WRITE"
#define kS3AclPermissionWriteAcp       @"WRITE_ACP"
#define kS3AclPermissionRead           @"READ"
#define kS3AclPermissionReadAcp        @"READ_ACP"

/** An enumeration of all ACL permissions. For more information, refer:
 * @see http://docs.amazonwebservices.com/AmazonS3/latest/S3_ACLs.html#S3_ACLs_Permissions
 *
 */
@interface S3Permission:NSObject {
    NSString *xmlValue;
}

-(id)initWithXmlCode:(NSString *)code;

/** Read Permission.
 * When applied to a bucket, grants permission to list the bucket.
 * When applied to an object, this grants permission to read the
 * object data and/or metadata.
 */
+(S3Permission *)readPermission;

/** Write permission.
 * When applied to a bucket, grants permission to create, overwrite,
 * and delete any object in the bucket. This permission is not
 * supported for objects.
 */
+(S3Permission *)writePermission;

/** The union of the other permissions.
 * Provides readPermission, writePermission, readAcpPermission, and writeAcpPermission.
 */
+(S3Permission *)fullControlPermission;

/** Grants permission to read the ACL for the applicable bucket or object.
 * The owner of a bucket or object always has this permission implicitly.
 */
+(S3Permission *)readAcpPermission;

/** Gives permission to overwrite the Access Control Policy for the applicable bucket or object.
 * The owner of a bucket or object always has this permission implicitly.
 * Granting this permission is equivalent to granting FullControl because
 * the grant recipient can make any changes to the ACP.
 */
+(S3Permission *)writeAcpPermission;

/** Get the permission by the string supplied. */
+(S3Permission *)permissionWithString:(NSString *)code;

@end
