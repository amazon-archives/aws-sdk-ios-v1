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
 * Ebs Instance Block Device
 */

@interface EC2EbsInstanceBlockDevice:NSObject

{
    NSString *volumeId;
    NSString *status;
    NSDate   *attachTime;
    bool     deleteOnTermination;
    bool     deleteOnTerminationIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The ID of the EBS volume.
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 * The status of the EBS volume.
 */
@property (nonatomic, retain) NSString *status;

/**
 * The time at which the EBS volume was attached to the associated
 * instance.
 */
@property (nonatomic, retain) NSDate *attachTime;

/**
 * Specifies whether the Amazon EBS volume is deleted on instance
 * termination.
 */
@property (nonatomic) bool           deleteOnTermination;

@property (nonatomic, readonly) bool deleteOnTerminationIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
