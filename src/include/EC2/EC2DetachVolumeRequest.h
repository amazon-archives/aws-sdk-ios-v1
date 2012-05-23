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


#import "../AmazonServiceRequestConfig.h"



/**
 * Detach Volume Request
 */

@interface EC2DetachVolumeRequest:AmazonServiceRequestConfig

{
    NSString *volumeId;
    NSString *instanceId;
    NSString *device;
    bool     force;
    bool     forceIsSet;
}



/**
 * The ID of the volume to detach.
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 * The ID of the instance from which to detach the the specified volume.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The device name to which the volume is attached on the specified
 * instance.
 */
@property (nonatomic, retain) NSString *device;

/**
 * Forces detachment if the previous detachment attempt did not occur
 * cleanly (logging into an instance, unmounting the volume, and
 * detaching normally). <p> This option can lead to data loss or a
 * corrupted file system. Use this option only as a last resort to detach
 * a volume from a failed instance. The instance will not have an
 * opportunity to flush file system caches nor file system meta data. If
 * you use this option, you must perform file system check and repair
 * procedures.
 */
@property (nonatomic) bool           force;

@property (nonatomic, readonly) bool forceIsSet;


/**
 * Default constructor for a new DetachVolumeRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DetachVolumeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theVolumeId The ID of the volume to detach.
 */
-(id)initWithVolumeId:(NSString *)theVolumeId;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
