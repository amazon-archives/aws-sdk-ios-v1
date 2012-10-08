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
 * Create Volume Request
 */

@interface EC2CreateVolumeRequest:AmazonServiceRequestConfig

{
    NSNumber *size;
    NSString *snapshotId;
    NSString *availabilityZone;
    NSString *volumeType;
    NSNumber *iops;
}



/**
 * The size of the volume, in gigabytes. Required if you are not creating
 * a volume from a snapshot.
 */
@property (nonatomic, retain) NSNumber *size;

/**
 * The ID of the snapshot from which to create the new volume.
 */
@property (nonatomic, retain) NSString *snapshotId;

/**
 * The Availability Zone in which to create the new volume.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * The value of the VolumeType property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>standard, io1
 */
@property (nonatomic, retain) NSString *volumeType;

/**
 * The value of the Iops property for this object.
 */
@property (nonatomic, retain) NSNumber *iops;


/**
 * Default constructor for a new CreateVolumeRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new CreateVolumeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSize The size of the volume, in gigabytes. Required if you
 * are not creating a volume from a snapshot.
 * @param theAvailabilityZone The Availability Zone in which to create
 * the new volume.
 */
-(id)initWithSize:(NSNumber *)theSize andAvailabilityZone:(NSString *)theAvailabilityZone;

/**
 * Constructs a new CreateVolumeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSnapshotId The ID of the snapshot from which to create the
 * new volume.
 * @param theAvailabilityZone The Availability Zone in which to create
 * the new volume.
 */
-(id)initWithSnapshotId:(NSString *)theSnapshotId andAvailabilityZone:(NSString *)theAvailabilityZone;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
