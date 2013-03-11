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
 * Subnet
 */

@interface EC2Subnet:NSObject

{
    NSString       *subnetId;
    NSString       *state;
    NSString       *vpcId;
    NSString       *cidrBlock;
    NSNumber       *availableIpAddressCount;
    NSString       *availabilityZone;
    bool           defaultForAz;
    bool           defaultForAzIsSet;
    bool           mapPublicIpOnLaunch;
    bool           mapPublicIpOnLaunchIsSet;
    NSMutableArray *tags;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the ID of the subnet.
 */
@property (nonatomic, retain) NSString *subnetId;

/**
 * Describes the current state of the subnet. The state of the subnet may
 * be either <code>pending</code> or <code>available</code>.
 */
@property (nonatomic, retain) NSString *state;

/**
 * Contains the ID of the VPC the subnet is in.
 */
@property (nonatomic, retain) NSString *vpcId;

/**
 * Specifies the CIDR block assigned to the subnet.
 */
@property (nonatomic, retain) NSString *cidrBlock;

/**
 * Specifies the number of unused IP addresses in the subnet. <note> <p>
 * The IP addresses for any stopped instances are considered unavailable.
 * </note>
 */
@property (nonatomic, retain) NSNumber *availableIpAddressCount;

/**
 * Specifies the Availability Zone the subnet is in.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * The value of the DefaultForAz property for this object.
 */
@property (nonatomic) bool           defaultForAz;

@property (nonatomic, readonly) bool defaultForAzIsSet;

/**
 * The value of the MapPublicIpOnLaunch property for this object.
 */
@property (nonatomic) bool           mapPublicIpOnLaunch;

@property (nonatomic, readonly) bool mapPublicIpOnLaunchIsSet;

/**
 * A list of tags for the Subnet.
 */
@property (nonatomic, retain) NSMutableArray *tags;

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
