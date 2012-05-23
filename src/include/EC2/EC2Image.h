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

#import "EC2ProductCode.h"
#import "EC2StateReason.h"
#import "EC2BlockDeviceMapping.h"
#import "EC2Tag.h"



/**
 * Image
 */

@interface EC2Image:NSObject

{
    NSString       *imageId;
    NSString       *imageLocation;
    NSString       *state;
    NSString       *ownerId;
    bool           publicValue;
    bool           publicValueIsSet;
    NSMutableArray *productCodes;
    NSString       *architecture;
    NSString       *imageType;
    NSString       *kernelId;
    NSString       *ramdiskId;
    NSString       *platform;
    EC2StateReason *stateReason;
    NSString       *imageOwnerAlias;
    NSString       *name;
    NSString       *descriptionValue;
    NSString       *rootDeviceType;
    NSString       *rootDeviceName;
    NSMutableArray *blockDeviceMappings;
    NSString       *virtualizationType;
    NSMutableArray *tags;
    NSString       *hypervisor;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The unique ID of the AMI.
 */
@property (nonatomic, retain) NSString *imageId;

/**
 * The location of the AMI.
 */
@property (nonatomic, retain) NSString *imageLocation;

/**
 * Current state of the AMI. If the operation returns available, the
 * image is successfully registered and available for launching. If the
 * operation returns deregistered, the image is deregistered and no
 * longer available for launching.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>available, deregistered
 */
@property (nonatomic, retain) NSString *state;

/**
 * AWS Access Key ID of the image owner.
 */
@property (nonatomic, retain) NSString *ownerId;

/**
 * True if this image has public launch permissions. False if it only has
 * implicit and explicit launch permissions.
 */
@property (nonatomic) bool           publicValue;

@property (nonatomic, readonly) bool publicValueIsSet;

/**
 * Product codes of the AMI.
 */
@property (nonatomic, retain) NSMutableArray *productCodes;

/**
 * The architecture of the image.
 */
@property (nonatomic, retain) NSString *architecture;

/**
 * The type of image (machine, kernel, or ramdisk).
 */
@property (nonatomic, retain) NSString *imageType;

/**
 * The kernel associated with the image, if any. Only applicable for
 * machine images.
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * The RAM disk associated with the image, if any. Only applicable for
 * machine images.
 */
@property (nonatomic, retain) NSString *ramdiskId;

/**
 * The operating platform of the AMI.
 */
@property (nonatomic, retain) NSString *platform;

/**
 * The reason for the state change.
 */
@property (nonatomic, retain) EC2StateReason *stateReason;

/**
 * The AWS account alias (e.g., "amazon", "redhat", "self", etc.) or AWS
 * account ID that owns the AMI.
 */
@property (nonatomic, retain) NSString *imageOwnerAlias;

/**
 * The name of the AMI that was provided during image creation.
 */
@property (nonatomic, retain) NSString *name;

/**
 * The description of the AMI that was provided during image creation.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The root device type used by the AMI. The AMI can use an Amazon EBS or
 * instance store root device.
 */
@property (nonatomic, retain) NSString *rootDeviceType;

/**
 * The root device name (e.g., <code>/dev/sda1</code>).
 */
@property (nonatomic, retain) NSString *rootDeviceName;

/**
 * Specifies how block devices are exposed to the instance.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;

/**
 * The value of the VirtualizationType property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>hvm, paravirtual
 */
@property (nonatomic, retain) NSString *virtualizationType;

/**
 * A list of tags for the Image.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * The value of the Hypervisor property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ovm, xen
 */
@property (nonatomic, retain) NSString *hypervisor;

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
