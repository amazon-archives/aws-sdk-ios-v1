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

#define kXsiNamespaceSpec                @"xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:type=\"%@\""
#define kXsiTypeCanonicalUser            @"CanonicalUser"
#define kXsiTypeAmazonCustomerByEmail    @"AmazonCustomerByEmail"
#define kXsiTypeGroup                    @"Group"

#define kS3GroupURIAllUsers              @"http://acs.amazonaws.com/groups/global/AllUsers"
#define kS3GroupURIAuthUsers             @"http://acs.amazonaws.com/groups/global/AuthenticatedUsers"


/** Represents an Owner/User/Group that can be given permissions
 * on a bucket or object.
 * <p>
 * Use Either ID and displayName (for CanonicalUsers), URI (for Groups), or emailAddress (for Amazon customer email addresses).
 * @see http://docs.amazonwebservices.com/AmazonS3/latest/index.html?RESTAuthentication.html
 * </p>
 *
 */
@interface S3Grantee:S3Owner {
    NSString *URI;
    NSString *emailAddress;
}

/** Gets and sets the URI property for group grantees */
@property (nonatomic, retain) NSString *URI;

/** Gets and sets the emailAddress property for user grantees */
@property (nonatomic, retain) NSString *emailAddress;

/** Returns an initialized S3Grantee object representing a CanonicalUser with the specified ID and displayName.
 * @param theID The ID of the user.
 * @param theDisplayName The display name of the user.
 *
 * @return An initialized S3Grantee object representing a CanonicalUser with the specified ID and displayName.
 */
+(id)granteeWithID:(NSString *)theID withDisplayName:(NSString *)theDisplayName;

/** Returns an initialized S3Grantee representing a group with the specified URI.
 * @param theURI The URI for the group.
 *
 * @return An initialized S3Grantee representing a group with the specified URI.
 **/
+(id)granteeWithURI:(NSString *)theURI;

/** Returns an initialized S3Grantee representing a user with the specified email address.
 *
 * @param theEmailAddress The email address of the user.
 *
 * @return An initialized S3Grantee representing a user with the specified email address.
 */
+(id)granteeWithEmailAddress:(NSString *)theEmailAddress;

/** Represents the group of all users */
+(id)allUsers;

/** Represents the group of authenticated users */
+(id)authenticatedUsers;

/** Returns the XML representation of the grantee */
-(NSString *)toXml;

@end
