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

#import "EC2PrivateIpAddressSpecification.h"



/**
 * Instance Network Interface Specification
 */

@interface EC2InstanceNetworkInterfaceSpecification:NSObject

{
    NSString       *networkInterfaceId;
    NSNumber       *deviceIndex;
    NSString       *subnetId;
    NSString       *descriptionValue;
    NSString       *privateIpAddress;
    NSMutableArray *groups;
    BOOL           deleteOnTermination;
    BOOL           deleteOnTerminationIsSet;
    NSMutableArray *privateIpAddresses;
    NSNumber       *secondaryPrivateIpAddressCount;
    BOOL           associatePublicIpAddress;
    BOOL           associatePublicIpAddressIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * An existing interface to attach to a single instance. Requires n=1
 * instances.
 */
@property (nonatomic, retain) NSString *networkInterfaceId;

/**
 * The device index. Applies to both attaching an existing network
 * interface and when creating a network interface. <p>Condition: If you
 * are specifying a network interface in the request, you must provide
 * the device index.
 */
@property (nonatomic, retain) NSNumber *deviceIndex;

/**
 * The subnet ID. Applies only when creating a network interface.
 */
@property (nonatomic, retain) NSString *subnetId;

/**
 * A description. Applies only when creating a network interface.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The primary private IP address. Applies only when creating a network
 * interface. Requires n=1 network interfaces in launch. <p>
 */
@property (nonatomic, retain) NSString *privateIpAddress;

/**
 * The value of the Groups property for this object.
 */
@property (nonatomic, retain) NSMutableArray *groups;

/**
 * The value of the DeleteOnTermination property for this object.
 */
@property (nonatomic) BOOL           deleteOnTermination;

@property (nonatomic, readonly) BOOL deleteOnTerminationIsSet;

/**
 * The value of the PrivateIpAddresses property for this object.
 */
@property (nonatomic, retain) NSMutableArray *privateIpAddresses;

/**
 * The value of the SecondaryPrivateIpAddressCount property for this object.
 */
@property (nonatomic, retain) NSNumber *secondaryPrivateIpAddressCount;

/**
 * Indicates whether to assign a public IP address to an instance in a
 * VPC. The public IP address is associated with a specific network
 * interface. If set to <code>true</code>, the following rules apply:
 * <ol> <li> <p>Can only be associated with a single network interface
 * with the device index of 0. You can't associate a public IP address
 * with a second network interface, and you can't associate a public IP
 * address if you are launching more than one network interface. </li>
 * <li> <p>Can only be associated with a new network interface, not an
 * existing one. </li> </ol> <p> Default: If launching into a default
 * subnet, the default value is <code>true</code>. If launching into a
 * nondefault subnet, the default value is <code>false</code>.
 */
@property (nonatomic) BOOL           associatePublicIpAddress;

@property (nonatomic, readonly) BOOL associatePublicIpAddressIsSet;

/**
 * Adds a single object to groups.
 * This function will alloc and init groups if not already done.
 */
-(void)addGroup:(NSString *)groupObject;

/**
 * Adds a single object to privateIpAddresses.
 * This function will alloc and init privateIpAddresses if not already done.
 */
-(void)addPrivateIpAddresse:(EC2PrivateIpAddressSpecification *)privateIpAddresseObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
