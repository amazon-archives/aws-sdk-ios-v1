/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
 * Projection
 */

@interface DynamoDBProjection:NSObject

{
    NSString       *projectionType;
    NSMutableArray *nonKeyAttributes;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Represents the set of attributes that are projected into the index:
 * <ul> <li> <p><code>KEYS_ONLY</code>-Only the index and primary keys
 * are projected into the index. </li> <li> <p><code>INCLUDE</code>-Only
 * the specified table attributes are projected into the index. The list
 * of projected attributes are in <i>NonKeyAttributes</i>. </li> <li>
 * <p><code>ALL</code>-All of the table attributes are projected into the
 * index. </li> </ul>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ALL, KEYS_ONLY, INCLUDE
 */
@property (nonatomic, retain) NSString *projectionType;

/**
 * Represents the non-key attribute names which will be projected into
 * the index. <p>The total count of attributes specified in
 * <i>NonKeyAttributes</i>, summed across all of the local secondary
 * indexes, must not exceed 20. If you project the same attribute into
 * two different indexes, this counts as two distinct attributes when
 * determining the total.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 20<br/>
 */
@property (nonatomic, retain) NSMutableArray *nonKeyAttributes;

/**
 * Adds a single object to nonKeyAttributes.
 * This function will alloc and init nonKeyAttributes if not already done.
 */
-(void)addNonKeyAttribute:(NSString *)nonKeyAttributeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
