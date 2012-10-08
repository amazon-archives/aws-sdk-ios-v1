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

#import "EC2GroupIdentifier.h"
#import "EC2SpotPlacement.h"
#import "EC2BlockDeviceMapping.h"
#import "EC2InstanceNetworkInterfaceSpecification.h"
#import "EC2IamInstanceProfileSpecification.h"



/**
 * Launch Specification
 */

@interface EC2LaunchSpecification:NSObject

{
    NSString                           *imageId;
    NSString                           *keyName;
    NSMutableArray                     *allSecurityGroups;
    NSMutableArray                     *securityGroups;
    NSString                           *userData;
    NSString                           *addressingType;
    NSString                           *instanceType;
    EC2SpotPlacement                   *placement;
    NSString                           *kernelId;
    NSString                           *ramdiskId;
    NSMutableArray                     *blockDeviceMappings;
    bool                               monitoringEnabled;
    bool                               monitoringEnabledIsSet;
    NSString                           *subnetId;
    NSMutableArray                     *networkInterfaces;
    EC2IamInstanceProfileSpecification *iamInstanceProfile;
    bool                               ebsOptimized;
    bool                               ebsOptimizedIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The AMI ID.
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * The name of the key pair.
 */
@property (nonatomic, retain) NSString *keyName;

/**
 * The value of the AllSecurityGroups property for this object.
 */
@property (nonatomic, retain) NSMutableArray *allSecurityGroups;

/**
 * The value of the SecurityGroups property for this object.
 */
@property (nonatomic, retain) NSMutableArray *securityGroups;

/**
 * Optional data, specific to a user's application, to provide in the
 * launch request. All instances that collectively comprise the launch
 * request have access to this data. User data is never returned through
 * API responses.
 */
@property (nonatomic, retain) NSString *userData;

/**
 * Deprecated.
 */
@property (nonatomic, retain) NSString *addressingType;

/**
 * Specifies the instance type.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>t1.micro, m1.small, m1.medium, m1.large, m1.xlarge, m2.xlarge, m2.2xlarge, m2.4xlarge, c1.medium, c1.xlarge, hi1.4xlarge, cc1.4xlarge, cc2.8xlarge, cg1.4xlarge
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * Defines a placement item.
 */
@property (nonatomic, retain) EC2SpotPlacement *placement;

/**
 * Specifies the ID of the kernel to select.
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * Specifies the ID of the RAM disk to select. Some kernels require
 * additional drivers at launch. Check the kernel requirements for
 * information on whether or not you need to specify a RAM disk and
 * search for the kernel ID.
 */
@property (nonatomic, retain) NSString *ramdiskId;

/**
 * Specifies how block devices are exposed to the instance. Each mapping
 * is made up of a virtualName and a deviceName.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * Enables monitoring for the instance.
 */
@property (nonatomic) bool           monitoringEnabled;

@property (nonatomic, readonly) bool monitoringEnabledIsSet;

/**
 * Specifies the Amazon VPC subnet ID within which to launch the
 * instance(s) for Amazon Virtual Private Cloud.
 */
@property (nonatomic, retain) NSString *subnetId;

/**
 * The value of the NetworkInterfaces property for this object.
 */
@property (nonatomic, retain) NSMutableArray *networkInterfaces;

/**
 * The value of the IamInstanceProfile property for this object.
 */
@property (nonatomic, retain) EC2IamInstanceProfileSpecification *iamInstanceProfile;

/**
 * The value of the EbsOptimized property for this object.
 */
@property (nonatomic) bool           ebsOptimized;

@property (nonatomic, readonly) bool ebsOptimizedIsSet;

/**
 * Adds a single object to allSecurityGroups.
 * This function will alloc and init allSecurityGroups if not already done.
 */
-(void)addAllSecurityGroup:(EC2GroupIdentifier *)allSecurityGroupObject;

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
 * Adds a single object to networkInterfaces.
 * This function will alloc and init networkInterfaces if not already done.
 */
-(void)addNetworkInterface:(EC2InstanceNetworkInterfaceSpecification *)networkInterfaceObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
