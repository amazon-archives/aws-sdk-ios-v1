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

#import "EC2InstanceBlockDeviceMapping.h"
#import "EC2ProductCode.h"



/**
 * Instance Attribute
 */

@interface EC2InstanceAttribute:NSObject

{
    NSString       *instanceId;
    NSString       *instanceType;
    NSString       *kernelId;
    NSString       *ramdiskId;
    NSString       *userData;
    bool           disableApiTermination;
    bool           disableApiTerminationIsSet;
    NSString       *instanceInitiatedShutdownBehavior;
    NSString       *rootDeviceName;
    NSMutableArray *blockDeviceMappings;
    NSMutableArray *productCodes;
    bool           ebsOptimized;
    bool           ebsOptimizedIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The ID of the associated instance.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The instance type (e.g., <code>m1.small</code>,
 * <code>c1.medium</code>, <code>m2.2xlarge</code>, and so on).
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * The kernel ID of the associated instance.
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * The ramdisk ID of the associated instance.
 */
@property (nonatomic, retain) NSString *ramdiskId;

/**
 * MIME, Base64-encoded user data.
 */
@property (nonatomic, retain) NSString *userData;

/**
 * Whether this instance can be terminated. You must modify this
 * attribute before you can terminate any "locked" instances.
 */
@property (nonatomic) bool           disableApiTermination;

@property (nonatomic, readonly) bool disableApiTerminationIsSet;

/**
 * Whether this instance's Amazon EBS volumes are deleted when the
 * instance is shut down.
 */
@property (nonatomic, retain) NSString *instanceInitiatedShutdownBehavior;

/**
 * The root device name (e.g., <code>/dev/sda1</code>).
 */
@property (nonatomic, retain) NSString *rootDeviceName;

/**
 * How block devices are exposed to this instance. Each mapping is made
 * up of a virtualName and a deviceName.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * The value of the ProductCodes property for this object.
 */
@property (nonatomic, retain) NSMutableArray *productCodes;

/**
 * Boolean value
 */
@property (nonatomic) bool           ebsOptimized;

@property (nonatomic, readonly) bool ebsOptimizedIsSet;

/**
 * Adds a single object to blockDeviceMappings.
 * This function will alloc and init blockDeviceMappings if not already done.
 */
-(void)addBlockDeviceMapping:(EC2InstanceBlockDeviceMapping *)blockDeviceMappingObject;

/**
 * Adds a single object to productCodes.
 * This function will alloc and init productCodes if not already done.
 */
-(void)addProductCode:(EC2ProductCode *)productCodeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
