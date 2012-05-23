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
 * Attach Volume Request
 */

@interface EC2AttachVolumeRequest:AmazonServiceRequestConfig

{
    NSString *volumeId;
    NSString *instanceId;
    NSString *device;
}



/**
 * The ID of the Amazon EBS volume. The volume and instance must be
 * within the same Availability Zone and the instance must be running.
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 * The ID of the instance to which the volume attaches. The volume and
 * instance must be within the same Availability Zone and the instance
 * must be running.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * Specifies how the device is exposed to the instance (e.g.,
 * <code>/dev/sdh</code>).
 */
@property (nonatomic, retain) NSString *device;


/**
 * Default constructor for a new AttachVolumeRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new AttachVolumeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theVolumeId The ID of the Amazon EBS volume. The volume and
 * instance must be within the same Availability Zone and the instance
 * must be running.
 * @param theInstanceId The ID of the instance to which the volume
 * attaches. The volume and instance must be within the same Availability
 * Zone and the instance must be running.
 * @param theDevice Specifies how the device is exposed to the instance
 * (e.g., <code>/dev/sdh</code>).
 */
-(id)initWithVolumeId:(NSString *)theVolumeId andInstanceId:(NSString *)theInstanceId andDevice:(NSString *)theDevice;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
