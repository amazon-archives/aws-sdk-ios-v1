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

#import "EC2Tag.h"



/**
 * Vpc
 */

@interface EC2Vpc:NSObject

{
    NSString       *vpcId;
    NSString       *state;
    NSString       *cidrBlock;
    NSString       *dhcpOptionsId;
    NSMutableArray *tags;
    NSString       *instanceTenancy;
    bool           isDefault;
    bool           isDefaultIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the ID of the VPC.
 */
@property (nonatomic, retain) NSString *vpcId;

/**
 * Describes the current state of the VPC. The state of the subnet may be
 * either <code>pending</code> or <code>available</code>.
 */
@property (nonatomic, retain) NSString *state;

/**
 * Specifies the CIDR block the VPC covers.
 */
@property (nonatomic, retain) NSString *cidrBlock;

/**
 * Specifies the ID of the set of DHCP options associated with the VPC.
 * Contains a value of <code>default</code> if the default options are
 * associated with the VPC.
 */
@property (nonatomic, retain) NSString *dhcpOptionsId;

/**
 * A list of tags for the VPC.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * The allowed tenancy of instances launched into the VPC.
 */
@property (nonatomic, retain) NSString *instanceTenancy;

/**
 *
 */
@property (nonatomic) bool           isDefault;

@property (nonatomic, readonly) bool isDefaultIsSet;

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
