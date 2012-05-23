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
 * User Id Group Pair
 */

@interface EC2UserIdGroupPair:NSObject

{
    NSString *userId;
    NSString *groupName;
    NSString *groupId;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The AWS user ID of an account.
 */
@property (nonatomic, retain) NSString *userId;

/**
 * Name of the security group in the specified AWS account. Cannot be
 * used when specifying a CIDR IP address range.
 */
@property (nonatomic, retain) NSString *groupName;

/**
 * ID of the security group in the specified AWS account. Cannot be used
 * when specifying a CIDR IP address range.
 */
@property (nonatomic, retain) NSString *groupId;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
