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




/**
 * Source Security Group
 */

@interface ElasticLoadBalancingSourceSecurityGroup:NSObject

{
    NSString *ownerAlias;
    NSString *groupName;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Owner of the source security group. Use this value for the
 * <code>--source-group-user</code> parameter of the
 * <code>ec2-authorize</code> command in the Amazon EC2 command line
 * tool.
 */
@property (nonatomic, retain) NSString *ownerAlias;

/**
 * Name of the source security group. Use this value for the
 * <code>--source-group</code> parameter of the
 * <code>ec2-authorize</code> command in the Amazon EC2 command line
 * tool.
 */
@property (nonatomic, retain) NSString *groupName;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
