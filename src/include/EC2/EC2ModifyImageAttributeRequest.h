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

#import "EC2LaunchPermissionModifications.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Modify Image Attribute Request
 */

@interface EC2ModifyImageAttributeRequest:AmazonServiceRequestConfig

{
    NSString                         *imageId;
    NSString                         *attribute;
    NSString                         *operationType;
    NSMutableArray                   *userIds;
    NSMutableArray                   *userGroups;
    NSMutableArray                   *productCodes;
    NSString                         *value;
    EC2LaunchPermissionModifications *launchPermission;
    NSString                         *descriptionValue;
}



/**
 * The ID of the AMI whose attribute you want to modify.
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * The name of the AMI attribute you want to modify. <p> Available
 * attributes: <code>launchPermission</code>, <code>productCodes</code>
 */
@property (nonatomic, retain) NSString *attribute;

/**
 * The type of operation being requested. <p> Available operation types:
 * <code>add</code>, <code>remove</code>
 */
@property (nonatomic, retain) NSString *operationType;

/**
 * The AWS user ID being added to or removed from the list of users with
 * launch permissions for this AMI. Only valid when the launchPermission
 * attribute is being modified.
 */
@property (nonatomic, retain) NSMutableArray *userIds;

/**
 * The user group being added to or removed from the list of user groups
 * with launch permissions for this AMI. Only valid when the
 * launchPermission attribute is being modified. <p> Available user
 * groups: <code>all</code>
 */
@property (nonatomic, retain) NSMutableArray *userGroups;

/**
 * The list of product codes being added to or removed from the specified
 * AMI. Only valid when the productCodes attribute is being modified.
 */
@property (nonatomic, retain) NSMutableArray *productCodes;

/**
 * The value of the attribute being modified. Only valid when the
 * description attribute is being modified.
 */
@property (nonatomic, retain) NSString *value;

/**
 * The value of the LaunchPermission property for this object.
 */
@property (nonatomic, retain) EC2LaunchPermissionModifications *launchPermission;

/**
 * String value
 */
@property (nonatomic, retain) NSString *descriptionValue;


/**
 * Default constructor for a new ModifyImageAttributeRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ModifyImageAttributeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theImageId The ID of the AMI whose attribute you want to
 * modify.
 * @param theAttribute The name of the AMI attribute you want to modify.
 * <p> Available attributes: <code>launchPermission</code>,
 * <code>productCodes</code>
 */
-(id)initWithImageId:(NSString *)theImageId andAttribute:(NSString *)theAttribute;

/**
 * Adds a single object to userIds.
 * This function will alloc and init userIds if not already done.
 */
-(void)addUserId:(NSString *)userIdObject;

/**
 * Adds a single object to userGroups.
 * This function will alloc and init userGroups if not already done.
 */
-(void)addUserGroup:(NSString *)userGroupObject;

/**
 * Adds a single object to productCodes.
 * This function will alloc and init productCodes if not already done.
 */
-(void)addProductCode:(NSString *)productCodeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
