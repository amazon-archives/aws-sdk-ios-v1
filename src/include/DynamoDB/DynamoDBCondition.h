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

#import "DynamoDBAttributeValue.h"



/**
 * Condition
 */

@interface DynamoDBCondition:NSObject

{
    NSMutableArray *attributeValueList;
    NSString       *comparisonOperator;
}



/**
 * A list of attribute values to be used with a comparison operator for a
 * scan or query operation. For comparisons that require more than one
 * value, such as a <code>BETWEEN</code> comparison, the
 * AttributeValueList contains two attribute values and the comparison
 * operator.
 */
@property (nonatomic, retain) NSMutableArray *attributeValueList;

/**
 * A comparison operator is an enumeration of several operations: <ul>
 * <li><code>EQ</code> for <em>equal</em>.</li> <li><code>NE</code> for
 * <em>not equal</em>.</li> <li><code>IN</code> checks for exact
 * matches.</li> <li><code>LE</code> for <em>less than or equal
 * to</em>.</li> <li><code>LT</code> for <em>less than</em>.</li>
 * <li><code>GE</code> for <em>greater than or equal to</em>.</li>
 * <li><code>GT</code> for <em>greater than</em>.</li>
 * <li><code>BETWEEN</code> for <em>between</em>.</li>
 * <li><code>NOT_NULL</code> for <em>exists</em>.</li>
 * <li><code>NULL</code> for <em>not exists</em>.</li>
 * <li><code>CONTAINS</code> for substring or value in a set.</li>
 * <li><code>NOT_CONTAINS</code> for absence of a substring or absence of
 * a value in a set.</li> <li><code>BEGINS_WITH</code> for a substring
 * prefix.</li> </ul> <p>Scan operations support all available comparison
 * operators. <p>Query operations support a subset of the available
 * comparison operators: EQ, LE, LT, GE, GT, BETWEEN, and BEGINS_WITH.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>EQ, NE, IN, LE, LT, GE, GT, BETWEEN, NOT_NULL, NULL, CONTAINS, NOT_CONTAINS, BEGINS_WITH
 */
@property (nonatomic, retain) NSString *comparisonOperator;


/**
 * Default constructor for a new Condition object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Adds a single object to attributeValueList.
 * This function will alloc and init attributeValueList if not already done.
 */
-(void)addAttributeValueList:(DynamoDBAttributeValue *)attributeValueListObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
