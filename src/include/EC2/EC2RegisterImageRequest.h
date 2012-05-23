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

#import "EC2BlockDeviceMapping.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Register Image Request
 */

@interface EC2RegisterImageRequest:AmazonServiceRequestConfig

{
    NSString       *imageLocation;
    NSString       *name;
    NSString       *descriptionValue;
    NSString       *architecture;
    NSString       *kernelId;
    NSString       *ramdiskId;
    NSString       *rootDeviceName;
    NSMutableArray *blockDeviceMappings;
}



/**
 * The full path to your AMI manifest in Amazon S3 storage.
 */
@property (nonatomic, retain) NSString *imageLocation;

/**
 * The name to give the new Amazon Machine Image. <p> Constraints: 3-128
 * alphanumeric characters, parenthesis (<code>()</code>), commas
 * (<code>,</code>), slashes (<code>/</code>), dashes (<code>-</code>),
 * or underscores(<code>_</code>)
 */
@property (nonatomic, retain) NSString *name;

/**
 * The description describing the new AMI.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The architecture of the image. <p> Valid Values: <code>i386</code>,
 * <code>x86_64</code>
 */
@property (nonatomic, retain) NSString *architecture;

/**
 * The optional ID of a specific kernel to register with the new AMI.
 */
@property (nonatomic, retain) NSString *kernelId;

/**
 * The optional ID of a specific ramdisk to register with the new AMI.
 * <p> Some kernels require additional drivers at launch. Check the
 * kernel requirements for information on whether you need to specify a
 * RAM disk.
 */
@property (nonatomic, retain) NSString *ramdiskId;

/**
 * The root device name (e.g., <code>/dev/sda1</code>).
 */
@property (nonatomic, retain) NSString *rootDeviceName;

/**
 * The block device mappings for the new AMI, which specify how different
 * block devices (ex: EBS volumes and ephemeral drives) will be exposed
 * on instances launched from the new image.
 */
@property (nonatomic, retain) NSMutableArray *blockDeviceMappings;


/**
 * Default constructor for a new RegisterImageRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new RegisterImageRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theImageLocation The full path to your AMI manifest in Amazon
 * S3 storage.
 */
-(id)initWithImageLocation:(NSString *)theImageLocation;

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
