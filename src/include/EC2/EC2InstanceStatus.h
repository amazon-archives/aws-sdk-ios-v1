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

#import "EC2InstanceStatusEvent.h"
#import "EC2InstanceState.h"
#import "EC2InstanceStatusSummary.h"
#import "EC2InstanceStatusSummary.h"



/**
 * Instance Status
 */

@interface EC2InstanceStatus:NSObject

{
    NSString                 *instanceId;
    NSString                 *availabilityZone;
    NSMutableArray           *events;
    EC2InstanceState         *instanceState;
    EC2InstanceStatusSummary *systemStatus;
    EC2InstanceStatusSummary *instanceStatus;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The ID of the Amazon EC2 instance.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The Amazon EC2 instance's availability zone.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * Events that affect the status of the associated Amazon EC2 instance.
 */
@property (nonatomic, retain) NSMutableArray *events;

/**
 * Represents the state of an Amazon EC2 instance.
 */
@property (nonatomic, retain) EC2InstanceState *instanceState;

/**
 * The value of the SystemStatus property for this object.
 */
@property (nonatomic, retain) EC2InstanceStatusSummary *systemStatus;

/**
 * The value of the InstanceStatus property for this object.
 */
@property (nonatomic, retain) EC2InstanceStatusSummary *instanceStatus;

/**
 * Adds a single object to events.
 * This function will alloc and init events if not already done.
 */
-(void)addEvent:(EC2InstanceStatusEvent *)eventObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
