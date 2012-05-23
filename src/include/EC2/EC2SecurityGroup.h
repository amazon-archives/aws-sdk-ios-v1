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

#import "EC2IpPermission.h"
#import "EC2IpPermission.h"
#import "EC2Tag.h"



/**
 * Security Group
 */

@interface EC2SecurityGroup:NSObject

{
    NSString       *ownerId;
    NSString       *groupName;
    NSString       *groupId;
    NSString       *descriptionValue;
    NSMutableArray *ipPermissions;
    NSMutableArray *ipPermissionsEgress;
    NSString       *vpcId;
    NSMutableArray *tags;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The AWS Access Key ID of the owner of the security group.
 */
@property (nonatomic, retain) NSString *ownerId;

/**
 * The name of this security group.
 */
@property (nonatomic, retain) NSString *groupName;

/**
 * The value of the GroupId property for this object.
 */
@property (nonatomic, retain) NSString *groupId;

/**
 * The description of this security group.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The permissions enabled for this security group.
 */
@property (nonatomic, retain) NSMutableArray *ipPermissions;

/**
 * The value of the IpPermissionsEgress property for this object.
 */
@property (nonatomic, retain) NSMutableArray *ipPermissionsEgress;

/**
 * The value of the VpcId property for this object.
 */
@property (nonatomic, retain) NSString *vpcId;

/**
 * The value of the Tags property for this object.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * Adds a single object to ipPermissions.
 * This function will alloc and init ipPermissions if not already done.
 */
-(void)addIpPermission:(EC2IpPermission *)ipPermissionObject;

/**
 * Adds a single object to ipPermissionsEgress.
 * This function will alloc and init ipPermissionsEgress if not already done.
 */
-(void)addIpPermissionsEgres:(EC2IpPermission *)ipPermissionsEgresObject;

/**
 * Adds a single object to tags.
 * This function will alloc and init tags if not already done.
 */
-(void)addTag:(EC2Tag *)tagObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
