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




/**
 * Ebs Block Device
 */

@interface EC2EbsBlockDevice:NSObject

{
    NSString *snapshotId;
    NSNumber *volumeSize;
    bool     deleteOnTermination;
    bool     deleteOnTerminationIsSet;
    NSString *volumeType;
    NSNumber *iops;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The ID of the snapshot from which the volume will be created.
 */
@property (nonatomic, retain) NSString *snapshotId;

/**
 * The size of the volume, in gigabytes.
 */
@property (nonatomic, retain) NSNumber *volumeSize;

/**
 * Specifies whether the Amazon EBS volume is deleted on instance
 * termination.
 */
@property (nonatomic) bool           deleteOnTermination;

@property (nonatomic, readonly) bool deleteOnTerminationIsSet;

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
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
