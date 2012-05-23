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
 * License Capacity
 */

@interface EC2LicenseCapacity:NSObject

{
    NSNumber *capacity;
    NSNumber *instanceCapacity;
    NSString *state;
    NSDate   *earliestAllowedDeactivationTime;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The number of licenses available.
 */
@property (nonatomic, retain) NSNumber *capacity;

/**
 * The number of Amazon EC2 instances that can be supported with the
 * license's capacity.
 */
@property (nonatomic, retain) NSNumber *instanceCapacity;

/**
 * The state of this license capacity, indicating whether the license is
 * actively being used or not.
 */
@property (nonatomic, retain) NSString *state;

/**
 * The earliest allowed time at which a license can be deactivated. Some
 * licenses have time restrictions on when they can be activated and
 * reactivated.
 */
@property (nonatomic, retain) NSDate *earliestAllowedDeactivationTime;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
