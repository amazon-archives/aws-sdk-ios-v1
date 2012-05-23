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

#import "EC2DiskImageDescription.h"
#import "EC2DiskImageVolumeDescription.h"



/**
 * Import Volume Task Details
 */

@interface EC2ImportVolumeTaskDetails:NSObject

{
    NSNumber                      *bytesConverted;
    NSString                      *availabilityZone;
    NSString                      *descriptionValue;
    EC2DiskImageDescription       *image;
    EC2DiskImageVolumeDescription *volume;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the BytesConverted property for this object.
 */
@property (nonatomic, retain) NSNumber *bytesConverted;

/**
 * The value of the AvailabilityZone property for this object.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * The value of the Description property for this object.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The value of the Image property for this object.
 */
@property (nonatomic, retain) EC2DiskImageDescription *image;

/**
 * The value of the Volume property for this object.
 */
@property (nonatomic, retain) EC2DiskImageVolumeDescription *volume;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
