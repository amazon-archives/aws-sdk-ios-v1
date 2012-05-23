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

#import "../AmazonServiceRequestConfig.h"



/**
 * Authorize Security Group Ingress Request
 */

@interface EC2AuthorizeSecurityGroupIngressRequest:AmazonServiceRequestConfig

{
    NSString       *groupName;
    NSString       *groupId;
    NSString       *sourceSecurityGroupName;
    NSString       *sourceSecurityGroupOwnerId;
    NSString       *ipProtocol;
    NSNumber       *fromPort;
    NSNumber       *toPort;
    NSString       *cidrIp;
    NSMutableArray *ipPermissions;
}



/**
 * Name of the standard (EC2) security group to modify. The group must
 * belong to your account. Can be used instead of GroupID for standard
 * (EC2) security groups.
 */
@property (nonatomic, retain) NSString *groupName;

/**
 * ID of the standard (EC2) or VPC security group to modify. The group
 * must belong to your account. Required for VPC security groups; can be
 * used instead of GroupName for standard (EC2) security groups.
 */
@property (nonatomic, retain) NSString *groupId;

/**
 * Deprecated
 */
@property (nonatomic, retain) NSString *sourceSecurityGroupName;

/**
 * Deprecated
 */
@property (nonatomic, retain) NSString *sourceSecurityGroupOwnerId;

/**
 * Deprecated
 */
@property (nonatomic, retain) NSString *ipProtocol;

/**
 * Deprecated
 */
@property (nonatomic, retain) NSNumber *fromPort;

/**
 * Deprecated
 */
@property (nonatomic, retain) NSNumber *toPort;

/**
 * Deprecated
 */
@property (nonatomic, retain) NSString *cidrIp;

/**
 * List of IP permissions to authorize on the specified security group.
 * Specifying permissions through IP permissions is the preferred way of
 * authorizing permissions since it offers more flexibility and control.
 */
@property (nonatomic, retain) NSMutableArray *ipPermissions;


/**
 * Default constructor for a new AuthorizeSecurityGroupIngressRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new AuthorizeSecurityGroupIngressRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theGroupName Name of the standard (EC2) security group to
 * modify. The group must belong to your account. Can be used instead of
 * GroupID for standard (EC2) security groups.
 * @param theIpPermissions List of IP permissions to authorize on the
 * specified security group. Specifying permissions through IP
 * permissions is the preferred way of authorizing permissions since it
 * offers more flexibility and control.
 */
-(id)initWithGroupName:(NSString *)theGroupName andIpPermissions:(NSMutableArray *)theIpPermissions;

/**
 * Adds a single object to ipPermissions.
 * This function will alloc and init ipPermissions if not already done.
 */
-(void)addIpPermission:(EC2IpPermission *)ipPermissionObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
