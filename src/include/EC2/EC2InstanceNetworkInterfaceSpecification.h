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
    bool           deleteOnTermination;
    bool           deleteOnTerminationIsSet;
    NSMutableArray *privateIpAddresses;
    NSNumber       *secondaryPrivateIpAddressCount;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the NetworkInterfaceId property for this object.
 */
@property (nonatomic, retain) NSString *networkInterfaceId;

/**
 * The value of the DeviceIndex property for this object.
 */
@property (nonatomic, retain) NSNumber *deviceIndex;

/**
 * The value of the SubnetId property for this object.
 */
@property (nonatomic, retain) NSString *subnetId;

/**
 * The value of the Description property for this object.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The value of the PrivateIpAddress property for this object.
 */
@property (nonatomic, retain) NSString *privateIpAddress;

/**
 * The value of the Groups property for this object.
 */
@property (nonatomic, retain) NSMutableArray *groups;

/**
 * The value of the DeleteOnTermination property for this object.
 */
@property (nonatomic) bool           deleteOnTermination;

@property (nonatomic, readonly) bool deleteOnTerminationIsSet;

/**
 * The value of the PrivateIpAddresses property for this object.
 */
@property (nonatomic, retain) NSMutableArray *privateIpAddresses;

/**
 * The value of the SecondaryPrivateIpAddressCount property for this object.
 */
@property (nonatomic, retain) NSNumber *secondaryPrivateIpAddressCount;

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
