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

#import "EC2InstanceBlockDeviceMappingSpecification.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Modify Instance Attribute Request
 */

@interface EC2ModifyInstanceAttributeRequest:AmazonServiceRequestConfig

{
    NSString       *instanceId;
    NSString       *attribute;
    NSString       *value;
    NSMutableArray *blockDeviceMappings;
    bool           sourceDestCheck;
    bool           sourceDestCheckIsSet;
    bool           disableApiTermination;
    bool           disableApiTerminationIsSet;
    NSString       *instanceType;
    NSString       *kernel;
    NSString       *ramdisk;
    NSString       *userData;
    NSString       *instanceInitiatedShutdownBehavior;
    NSMutableArray *groups;
    bool           ebsOptimized;
    bool           ebsOptimizedIsSet;
}



/**
 * The ID of the instance whose attribute is being modified.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The name of the attribute being modified. <p> Available attribute
 * names: <code>instanceType</code>, <code>kernel</code>,
 * <code>ramdisk</code>, <code>userData</code>,
 * <code>disableApiTermination</code>,
 * <code>instanceInitiatedShutdownBehavior</code>,
 * <code>rootDevice</code>, <code>blockDeviceMapping</code>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>instanceType, kernel, ramdisk, userData, disableApiTermination, instanceInitiatedShutdownBehavior, rootDeviceName, blockDeviceMapping, productCodes, sourceDestCheck, groupSet, ebsOptimized
 */
@property (nonatomic, retain) NSString *attribute;

/**
 * The new value of the instance attribute being modified. <p> Only valid
 * when <code>kernel</code>, <code>ramdisk</code>, <code>userData</code>,
 * <code>disableApiTermination</code> or
 * <code>instanceInitiateShutdownBehavior</code> is specified as the
 * attribute being modified.
 */
@property (nonatomic, retain) NSString *value;

/**
 * The new block device mappings for the instance whose attributes are
 * being modified. <p> Only valid when blockDeviceMapping is specified as
 * the attribute being modified.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * Boolean value
 */
@property (nonatomic) bool           sourceDestCheck;

@property (nonatomic, readonly) bool sourceDestCheckIsSet;

/**
 * Boolean value
 */
@property (nonatomic) bool           disableApiTermination;

@property (nonatomic, readonly) bool disableApiTerminationIsSet;

/**
 * String value
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * String value
 */
@property (nonatomic, retain) NSString *kernel;

/**
 * String value
 */
@property (nonatomic, retain) NSString *ramdisk;

/**
 * String value
 */
@property (nonatomic, retain) NSString *userData;

/**
 * String value
 */
@property (nonatomic, retain) NSString *instanceInitiatedShutdownBehavior;

/**
 * The value of the Groups property for this object.
 */
@property (nonatomic, retain) NSMutableArray *groups;

/**
 * Boolean value
 */
@property (nonatomic) bool           ebsOptimized;

@property (nonatomic, readonly) bool ebsOptimizedIsSet;


/**
 * Default constructor for a new ModifyInstanceAttributeRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ModifyInstanceAttributeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theInstanceId The ID of the instance whose attribute is being
 * modified.
 * @param theAttribute The name of the attribute being modified. <p>
 * Available attribute names: <code>instanceType</code>,
 * <code>kernel</code>, <code>ramdisk</code>, <code>userData</code>,
 * <code>disableApiTermination</code>,
 * <code>instanceInitiatedShutdownBehavior</code>,
 * <code>rootDevice</code>, <code>blockDeviceMapping</code>
 */
-(id)initWithInstanceId:(NSString *)theInstanceId andAttribute:(NSString *)theAttribute;

/**
 * Adds a single object to blockDeviceMappings.
 * This function will alloc and init blockDeviceMappings if not already done.
 */
-(void)addBlockDeviceMapping:(EC2InstanceBlockDeviceMappingSpecification *)blockDeviceMappingObject;

/**
 * Adds a single object to groups.
 * This function will alloc and init groups if not already done.
 */
-(void)addGroup:(NSString *)groupObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
