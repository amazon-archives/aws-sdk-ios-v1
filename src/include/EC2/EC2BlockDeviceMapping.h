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

#import "EC2EbsBlockDevice.h"



/**
 * Block Device Mapping
 */

@interface EC2BlockDeviceMapping:NSObject

{
    NSString          *virtualName;
    NSString          *deviceName;
    EC2EbsBlockDevice *ebs;
    NSString          *noDevice;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the virtual device name.
 */
@property (nonatomic, retain) NSString *virtualName;

/**
 * Specifies the device name (e.g., <code>/dev/sdh</code>).
 */
@property (nonatomic, retain) NSString *deviceName;

/**
 * Specifies parameters used to automatically setup Amazon EBS volumes
 * when the instance is launched.
 */
@property (nonatomic, retain) EC2EbsBlockDevice *ebs;

/**
 * Specifies the device name to suppress during instance launch.
 */
@property (nonatomic, retain) NSString *noDevice;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
