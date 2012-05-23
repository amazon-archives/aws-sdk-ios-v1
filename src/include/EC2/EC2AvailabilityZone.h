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

#import "EC2AvailabilityZoneMessage.h"



/**
 * Availability Zone
 */

@interface EC2AvailabilityZone:NSObject

{
    NSString       *zoneName;
    NSString       *state;
    NSString       *regionName;
    NSMutableArray *messages;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Name of the Availability Zone.
 */
@property (nonatomic, retain) NSString *zoneName;

/**
 * State of the Availability Zone.
 */
@property (nonatomic, retain) NSString *state;

/**
 * Name of the region in which this zone resides.
 */
@property (nonatomic, retain) NSString *regionName;

/**
 * A list of messages about the Availability Zone.
 */
@property (nonatomic, retain) NSMutableArray *messages;

/**
 * Adds a single object to messages.
 * This function will alloc and init messages if not already done.
 */
-(void)addMessage:(EC2AvailabilityZoneMessage *)messageObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
