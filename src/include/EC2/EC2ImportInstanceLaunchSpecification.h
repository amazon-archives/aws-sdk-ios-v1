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

#import "EC2Placement.h"
#import "EC2BlockDeviceMapping.h"



/**
 * Import Instance Launch Specification
 */

@interface EC2ImportInstanceLaunchSpecification:NSObject

{
    NSString       *architecture;
    NSMutableArray *securityGroups;
    NSString       *additionalInfo;
    NSString       *userData;
    NSString       *instanceType;
    EC2Placement   *placement;
    NSMutableArray *blockDeviceMappings;
    bool           monitoring;
    bool           monitoringIsSet;
    NSString       *subnetId;
    bool           disableApiTermination;
    bool           disableApiTerminationIsSet;
    NSString       *instanceInitiatedShutdownBehavior;
    NSString       *privateIpAddress;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Architecture property for this object.
 */
@property (nonatomic, retain) NSString *architecture;

/**
 * The value of the SecurityGroups property for this object.
 */
@property (nonatomic, retain) NSMutableArray *securityGroups;

/**
 * The value of the AdditionalInfo property for this object.
 */
@property (nonatomic, retain) NSString *additionalInfo;

/**
 * The value of the UserData property for this object.
 */
@property (nonatomic, retain) NSString *userData;

/**
 * The value of the InstanceType property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>t1.micro, m1.small, m1.medium, m1.large, m1.xlarge, m2.xlarge, m2.2xlarge, m2.4xlarge, c1.medium, c1.xlarge, hi1.4xlarge, cc1.4xlarge, cc2.8xlarge, cg1.4xlarge
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * Describes where an Amazon EC2 instance is running within an Amazon EC2
 * region.
 */
@property (nonatomic, retain) EC2Placement *placement;

/**
 * The value of the BlockDeviceMappings property for this object.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * The value of the Monitoring property for this object.
 */
@property (nonatomic) bool           monitoring;

@property (nonatomic, readonly) bool monitoringIsSet;

/**
 * The value of the SubnetId property for this object.
 */
@property (nonatomic, retain) NSString *subnetId;

/**
 * The value of the DisableApiTermination property for this object.
 */
@property (nonatomic) bool           disableApiTermination;

@property (nonatomic, readonly) bool disableApiTerminationIsSet;

/**
 * The value of the InstanceInitiatedShutdownBehavior property for this object.
 */
@property (nonatomic, retain) NSString *instanceInitiatedShutdownBehavior;

/**
 * The value of the PrivateIpAddress property for this object.
 */
@property (nonatomic, retain) NSString *privateIpAddress;

/**
 * Adds a single object to securityGroups.
 * This function will alloc and init securityGroups if not already done.
 */
-(void)addSecurityGroup:(NSString *)securityGroupObject;

/**
 * Adds a single object to blockDeviceMappings.
 * This function will alloc and init blockDeviceMappings if not already done.
 */
-(void)addBlockDeviceMapping:(EC2BlockDeviceMapping *)blockDeviceMappingObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
