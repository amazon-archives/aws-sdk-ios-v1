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

#import "EC2LaunchPermission.h"
#import "EC2ProductCode.h"
#import "EC2BlockDeviceMapping.h"



/**
 * Image Attribute
 */

@interface EC2ImageAttribute:NSObject

{
    NSString       *imageId;
    NSMutableArray *launchPermissions;
    NSMutableArray *productCodes;
    NSString       *kernelId;
    NSString       *ramdiskId;
    NSString       *descriptionValue;
    NSMutableArray *blockDeviceMappings;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The ID of the associated AMI.
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * Launch permissions for the associated AMI.
 */
@property (nonatomic, retain) NSMutableArray *launchPermissions;

/**
 * Product codes for the associated AMI.
 */
@property (nonatomic, retain) NSMutableArray *productCodes;

/**
 * Kernel ID of the associated AMI.
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * Ramdisk ID of the associated AMI.
 */
@property (nonatomic, retain) NSString *ramdiskId;

/**
 * User-created description of the associated AMI.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * Block device mappings for the associated AMI.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * Adds a single object to launchPermissions.
 * This function will alloc and init launchPermissions if not already done.
 */
-(void)addLaunchPermission:(EC2LaunchPermission *)launchPermissionObject;

/**
 * Adds a single object to productCodes.
 * This function will alloc and init productCodes if not already done.
 */
-(void)addProductCode:(EC2ProductCode *)productCodeObject;

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
