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

#import "EC2GroupIdentifier.h"
#import "EC2Instance.h"



/**
 * Reservation
 */

@interface EC2Reservation:NSObject

{
    NSString       *reservationId;
    NSString       *ownerId;
    NSString       *requesterId;
    NSMutableArray *groups;
    NSMutableArray *groupNames;
    NSMutableArray *instances;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The unique ID of this reservation.
 */
@property (nonatomic, retain) NSString *reservationId;

/**
 * The AWS Access Key ID of the user who owns the reservation.
 */
@property (nonatomic, retain) NSString *ownerId;

/**
 * The unique ID of the user who requested the instances in this
 * reservation.
 */
@property (nonatomic, retain) NSString *requesterId;

/**
 * The list of security groups requested for the instances in this
 * reservation.
 */
@property (nonatomic, retain) NSMutableArray *groups;

/**
 * The list of security groups requested for the instances in this
 * reservation.
 */
@property (nonatomic, retain) NSMutableArray *groupNames;

/**
 * The list of Amazon EC2 instances included in this reservation.
 */
@property (nonatomic, retain) NSMutableArray *instances;

/**
 * Adds a single object to groups.
 * This function will alloc and init groups if not already done.
 */
-(void)addGroup:(EC2GroupIdentifier *)groupObject;

/**
 * Adds a single object to groupNames.
 * This function will alloc and init groupNames if not already done.
 */
-(void)addGroupName:(NSString *)groupNameObject;

/**
 * Adds a single object to instances.
 * This function will alloc and init instances if not already done.
 */
-(void)addInstance:(EC2Instance *)instanceObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
