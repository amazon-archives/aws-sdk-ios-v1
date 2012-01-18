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
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBCondition:NSObject

{
    NSMutableArray *attributeValueList;
    NSString       *comparisonOperator;
}



/**
 * A list of attribute values to be used with a comparison operator for a
 * scan or query operation. For comparisons that require more than one
 * value, such as a BETWEEN comparison, the AttributeValueList contains
 * two attribute values and the comparison operator.
 */
@property (nonatomic, retain) NSMutableArray *attributeValueList;

/**
 * Comparison Operator is an enumeration of several operations : EQ for
 * Equal , NE for Not Equal, IN checks for Exact Matches, LE for less
 * than or equal to, LT for less than, GE for greater than or equal to,
 * GT for greater than, BETWEEN for between, NOT_NULL for exists, NULL
 * for not exists, CONTAINS for substring or value in a set, NOT_CONTAINS
 * for absence of a substring or absence of a value in a set, BEGINS_WITH
 * for substring prefix.
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
