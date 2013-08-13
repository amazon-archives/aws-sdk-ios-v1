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
 * Represents one or more values to evaluate against the supplied
 * attribute. This list contains exactly one value, except for a
 * <code>BETWEEN</code> or <code>IN</code> comparison, in which case the
 * list contains two values. <note> <p>For type Number, value comparisons
 * are numeric. <p>String value comparisons for greater than, equals, or
 * less than are based on ASCII character code values. For example,
 * <code>a</code> is greater than <code>A</code>, and <code>aa</code> is
 * greater than <code>B</code>. For a list of code values, see <a
 * rs">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.
 * <p>For Binary, Amazon DynamoDB treats each byte of the binary data as
 * unsigned when it compares binary values, for example when evaluating
 * query expressions. </note>
 */
@property (nonatomic, retain) NSMutableArray *attributeValueList;

/**
 * Represents a comparator for evaluating attributes. For example,
 * equals, greater than, less than, etc. <p>Valid comparison operators
 * for Query: <p><code>EQ | LE | LT | GE | GT | BEGINS_WITH |
 * BETWEEN</code> <p>Valid comparison operators for Scan: <p><code>EQ |
 * NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS | NOT_CONTAINS |
 * BEGINS_WITH | IN | BETWEEN</code> <p>For information on specifying
 * data types in JSON, see <a
 * .amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON
 * Data Format</a> of the <i>Amazon DynamoDB Developer Guide</i>. <p>The
 * following are descriptions of each comparison operator. <ul> <li>
 * <p><code>EQ</code> : Equal. <p><i>AttributeValueList</i> can contain
 * only one <i>AttributeValue</i> of type String, Number, or Binary (not
 * a set). If an item contains an <i>AttributeValue</i> of a different
 * type than the one specified in the request, the value does not match.
 * For example, <code>{"S":"6"}</code> does not equal
 * <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal
 * <code>{"NS":["6", "2", "1"]}</code>. <p> </li> <li> <p><code>NE</code>
 * : Not equal. <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String, Number, or Binary (not a set).
 * If an item contains an <i>AttributeValue</i> of a different type than
 * the one specified in the request, the value does not match. For
 * example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>.
 * Also, <code>{"N":"6"}</code> does not equal <code>{"NS":["6", "2",
 * "1"]}</code>. <p> </li> <li> <p><code>LE</code> : Less than or equal.
 * <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String, Number, or Binary (not a set).
 * If an item contains an <i>AttributeValue</i> of a different type than
 * the one specified in the request, the value does not match. For
 * example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>.
 * Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6",
 * "2", "1"]}</code>. <p> </li> <li> <p><code>LT</code> : Less than.
 * <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String, Number, or Binary (not a set).
 * If an item contains an <i>AttributeValue</i> of a different type than
 * the one specified in the request, the value does not match. For
 * example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>.
 * Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6",
 * "2", "1"]}</code>. <p> </li> <li> <p><code>GE</code> : Greater than or
 * equal. <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String, Number, or Binary (not a set).
 * If an item contains an <i>AttributeValue</i> of a different type than
 * the one specified in the request, the value does not match. For
 * example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>.
 * Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6",
 * "2", "1"]}</code>. <p> </li> <li> <p><code>GT</code> : Greater than.
 * <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String, Number, or Binary (not a set).
 * If an item contains an <i>AttributeValue</i> of a different type than
 * the one specified in the request, the value does not match. For
 * example, <code>{"S":"6"}</code> does not equal <code>{"N":"6"}</code>.
 * Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6",
 * "2", "1"]}</code>. <p> </li> <li> <p><code>NOT_NULL</code> : The
 * attribute exists. </li> <li> <p><code>NULL</code> : The attribute does
 * not exist. </li> <li> <p><code>CONTAINS</code> : checks for a
 * subsequence, or value in a set. <p><i>AttributeValueList</i> can
 * contain only one <i>AttributeValue</i> of type String, Number, or
 * Binary (not a set). If the target attribute of the comparison is a
 * String, then the operation checks for a substring match. If the target
 * attribute of the comparison is Binary, then the operation looks for a
 * subsequence of the target that matches the input. If the target
 * attribute of the comparison is a set ("SS", "NS", or "BS"), then the
 * operation checks for a member of the set (not as a substring). </li>
 * <li> <p><code>NOT_CONTAINS</code> : checks for absence of a
 * subsequence, or absence of a value in a set.
 * <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String, Number, or Binary (not a set).
 * If the target attribute of the comparison is a String, then the
 * operation checks for the absence of a substring match. If the target
 * attribute of the comparison is Binary, then the operation checks for
 * the absence of a subsequence of the target that matches the input. If
 * the target attribute of the comparison is a set ("SS", "NS", or "BS"),
 * then the operation checks for the absence of a member of the set (not
 * as a substring). </li> <li> <p><code>BEGINS_WITH</code> : checks for a
 * prefix. <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String or Binary (not a Number or a
 * set). The target attribute of the comparison must be a String or
 * Binary (not a Number or a set). <p> </li> <li> <p><code>IN</code> :
 * checks for exact matches. <p><i>AttributeValueList</i> can contain
 * more than one <i>AttributeValue</i> of type String, Number, or Binary
 * (not a set). The target attribute of the comparison must be of the
 * same type and exact value to match. A String never matches a String
 * set. </li> <li> <p><code>BETWEEN</code> : Greater than or equal to the
 * first value, and less than or equal to the second value.
 * <p><i>AttributeValueList</i> must contain two <i>AttributeValue</i>
 * elements of the same type, either String, Number, or Binary (not a
 * set). A target attribute matches if the target value is greater than,
 * or equal to, the first element and less than, or equal to, the second
 * element. If an item contains an <i>AttributeValue</i> of a different
 * type than the one specified in the request, the value does not match.
 * For example, <code>{"S":"6"}</code> does not compare to
 * <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not compare
 * to <code>{"NS":["6", "2", "1"]}</code> </li> </ul>
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
