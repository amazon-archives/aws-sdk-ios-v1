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
#import "S3Owner.h"
#import "S3Grant.h"

/** Represents an access control list (ACL) for S3.
 * An AccessControlList is represented by an Owner,
 * and a list of Grants, where each Grant is a Grantee
 * and a Permission.
 * <p>
 * Each bucket and object in Amazon S3 has an ACL that defines its access control policy.
 * When a request is made, Amazon S3 authenticates the request using its standard
 * authentication procedure and then checks the ACL to verify the sender was granted access
 * to the bucket or object. If the sender is approved, the request proceeds.
 * Otherwise, Amazon S3 returns an error.
 * </p><p>
 * An ACL is a list of grants. A grant consists of one grantee and one permission.
 * ACLs only grant permissions; they do not deny them.
 * </p><p>
 * Note: Bucket and object ACLs are completely independent; an object does not inherit the ACL
 * from its bucket. For example, if you create a bucket and grant write access to another user,
 * you will not be able to access the user's objects unless the user explicitly grants access.
 * This also applies if you grant anonymous write access to a bucket. Only the user "anonymous"
 * will be able to access objects the user created unless permission is explicitly granted to
 * the bucket owner.
 *
 */
@interface S3AccessControlList:NSObject {
    S3Owner        *owner;
    NSMutableArray *grantList;
}

/** Gets and sets the owner */
@property (nonatomic, retain) S3Owner *owner;

/** Returns the current grant list */
@property (nonatomic, readonly) NSArray *grantList;

/** Initialize the object with an owner */
-(id)initWithOwner:(S3Owner *)theOwner;

/** Adds the grant to the grant list
 * @param aGrant A Grant to add to the list.
 */
-(void)addGrant:(S3Grant *)aGrant;

/** Returns the XML represenation of the ACL */
-(NSString *)toXml;

/** Returns x-amz header representation of the ACL */
-(NSDictionary *)toHeaders;

@end
