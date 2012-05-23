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

#import "EC2VolumeStatusInfo.h"
#import "EC2VolumeStatusEvent.h"
#import "EC2VolumeStatusAction.h"



/**
 * Volume Status Item
 */

@interface EC2VolumeStatusItem:NSObject

{
    NSString            *volumeId;
    NSString            *availabilityZone;
    EC2VolumeStatusInfo *volumeStatus;
    NSMutableArray      *events;
    NSMutableArray      *actions;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the VolumeId property for this object.
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 * The value of the AvailabilityZone property for this object.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * The value of the VolumeStatus property for this object.
 */
@property (nonatomic, retain) EC2VolumeStatusInfo *volumeStatus;

/**
 * The value of the Events property for this object.
 */
@property (nonatomic, retain) NSMutableArray *events;

/**
 * The value of the Actions property for this object.
 */
@property (nonatomic, retain) NSMutableArray *actions;

/**
 * Adds a single object to events.
 * This function will alloc and init events if not already done.
 */
-(void)addEvent:(EC2VolumeStatusEvent *)eventObject;

/**
 * Adds a single object to actions.
 * This function will alloc and init actions if not already done.
 */
-(void)addAction:(EC2VolumeStatusAction *)actionObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
