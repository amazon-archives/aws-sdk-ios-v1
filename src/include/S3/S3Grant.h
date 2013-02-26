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
#import "S3Permission.h"
#import "S3Grantee.h"

/** Represents a grant for an bucket/object ACL. A grant contains
 * an S3Grantee and a S3Permission for that S3Grantee.
 * <p>
 * For more information on Grants/ACLs refer:
 * @see http://docs.amazonwebservices.com/AmazonS3/latest/index.html?RESTAuthentication.html
 * </p>
 *
 */
@interface S3Grant:NSObject {
    S3Grantee    *grantee;
    S3Permission *permission;
}

/** Gets and sets the grantee for the grant */
@property (nonatomic, retain) S3Grantee *grantee;

/** Gets and sets the permission for the grant */
@property (nonatomic, retain) S3Permission *permission;

/** Initializes the object with the specified grantee and permission.
 * @param theGrantee The grantee for the grant.
 * @param thePermission The permission to grant the grantee.
 *
 * @return An initialized object representing the grant.
 */
-(id)initWithGrantee:(S3Grantee *)theGrantee withPermission:(S3Permission *)thePermission;

/** Returns an initialized instance with the specified grantee and permission
 * @param theGrantee The grantee for the grant.
 * @param thePermission The permission to grant the grantee.
 *
 * @return An initialized object representing the grant.
 */
+(id)grantWithGrantee:(S3Grantee *)theGrantee withPermission:(S3Permission *)thePermission;

/** Returns the XML represenation of the grant. */
-(NSString *)toXml;

@end
