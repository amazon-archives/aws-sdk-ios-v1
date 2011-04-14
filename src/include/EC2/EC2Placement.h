/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 * Placement
 *
 * \ingroup EC2
 */

@interface EC2Placement:NSObject

{
    NSString *availabilityZone;
    NSString *groupName;
}


/**
 * The availability zone in which an Amazon EC2 instance runs.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * The name of a <a>PlacementGroup</a>.
 */
@property (nonatomic, retain) NSString *groupName;


/**
 * Default constructor for a new Placement object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new Placement object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theAvailabilityZone The availability zone in which an Amazon
 * EC2 instance runs.
 */
-(id)initWithAvailabilityZone:(NSString *)theAvailabilityZone;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
