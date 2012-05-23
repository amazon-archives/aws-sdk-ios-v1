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
 * Placement Group
 */

@interface EC2PlacementGroup:NSObject

{
    NSString *groupName;
    NSString *strategy;
    NSString *state;
}



/**
 * The name of this <code>PlacementGroup</code>.
 */
@property (nonatomic, retain) NSString *groupName;

/**
 * The strategy to use when allocating Amazon EC2 instances for the
 * <code>PlacementGroup</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>cluster
 */
@property (nonatomic, retain) NSString *strategy;

/**
 * The state of this <code>PlacementGroup</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>pending, available, deleting, deleted
 */
@property (nonatomic, retain) NSString *state;


/**
 * Default constructor for a new PlacementGroup object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new PlacementGroup object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theGroupName The name of this <code>PlacementGroup</code>.
 */
-(id)initWithGroupName:(NSString *)theGroupName;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
