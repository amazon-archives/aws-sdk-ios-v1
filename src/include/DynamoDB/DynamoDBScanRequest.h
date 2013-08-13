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

#import "DynamoDBCondition.h"
#import "DynamoDBAttributeValue.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Scan Request
 */

@interface DynamoDBScanRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSMutableArray      *attributesToGet;
    NSNumber            *limit;
    NSString            *select;
    NSMutableDictionary *scanFilter;
    NSMutableDictionary *exclusiveStartKey;
    NSString            *returnConsumedCapacity;
    NSNumber            *totalSegments;
    NSNumber            *segment;
}



/**
 * The name of the table containing the requested items.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * The names of one or more attributes to retrieve. If no attribute names
 * are specified, then all attributes will be returned. If any of the
 * requested attributes are not found, they will not appear in the
 * result.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *attributesToGet;

/**
 * The maximum number of items to evaluate (not necessarily the number of
 * matching items). If Amazon DynamoDB processes the number of items up
 * to the limit while processing the results, it stops the operation and
 * returns the matching values up to that point, and a
 * <i>LastEvaluatedKey</i> to apply in a subsequent operation, so that
 * you can pick up where you left off. Also, if the processed data set
 * size exceeds 1 MB before Amazon DynamoDB reaches this limit, it stops
 * the operation and returns the matching values up to the limit, and a
 * <i>LastEvaluatedKey</i> to apply in a subsequent operation to continue
 * the operation. For more information see <a
 * azon.com/amazondynamodb/latest/developerguide/QueryAndScan.html">Query
 * and Scan</a> of the <i>Amazon DynamoDB Developer Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, retain) NSNumber *limit;

/**
 * The attributes to be returned in the result. You can retrieve all item
 * attributes, specific item attributes, the count of matching items, or
 * in the case of an index, some or all of the attributes projected into
 * the index. <ul> <li> <p><code>ALL_ATTRIBUTES</code>: Returns all of
 * the item attributes. For a table, this is the default. For an index,
 * this mode causes Amazon DynamoDB to fetch the full item from the table
 * for each matching item in the index. If the index is configured to
 * project all item attributes, the matching items will not be fetched
 * from the table. Fetching items from the table incurs additional
 * throughput cost and latency. </li> <li>
 * <p><code>ALL_PROJECTED_ATTRIBUTES</code>: Retrieves all attributes
 * which have been projected into the index. If the index is configured
 * to project all attributes, this is equivalent to specifying
 * <i>ALL_ATTRIBUTES</i>. </li> <li> <p><code>COUNT</code>: Returns the
 * number of matching items, rather than the matching items themselves.
 * </li> <li> <p> <code>SPECIFIC_ATTRIBUTES</code> : Returns only the
 * attributes listed in <i>AttributesToGet</i>. This is equivalent to
 * specifying <i>AttributesToGet</i> without specifying any value for
 * <i>Select</i>. <p>If you are querying an index and only request
 * attributes that are projected into that index, the operation will
 * consult the index and bypass the table. If any of the requested
 * attributes are not projected into the index, Amazon DynamoDB will need
 * to fetch each matching item from the table. This extra fetching incurs
 * additional throughput cost and latency. </li> </ul> <p>When neither
 * <i>Select</i> nor <i>AttributesToGet</i> are specified, Amazon
 * DynamoDB defaults to <code>ALL_ATTRIBUTES</code> when accessing a
 * table, and <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an
 * index. You cannot use both <i>Select</i> and <i>AttributesToGet</i>
 * together in a single request, <i>unless</i> the value for
 * <i>Select</i> is <code>SPECIFIC_ATTRIBUTES</code>. (This usage is
 * equivalent to specifying <i>AttributesToGet</i> without any value for
 * <i>Select</i>.)
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ALL_ATTRIBUTES, ALL_PROJECTED_ATTRIBUTES, SPECIFIC_ATTRIBUTES, COUNT
 */
@property (nonatomic, retain) NSString *select;

/**
 * Evaluates the scan results and returns only the desired values.
 * Multiple conditions are treated as "AND" operations: all conditions
 * must be met to be included in the results. <p>Each
 * <i>ScanConditions</i> element consists of an attribute name to
 * compare, along with the following: <ul>
 * <li><p><i>AttributeValueList</i>-One or more values to evaluate
 * against the supplied attribute. This list contains exactly one value,
 * except for a <code>BETWEEN</code> or <code>IN</code> comparison, in
 * which case the list contains two values. <note> <p>For type Number,
 * value comparisons are numeric. <p>String value comparisons for greater
 * than, equals, or less than are based on ASCII character code values.
 * For example, <code>a</code> is greater than <code>A</code>, and
 * <code>aa</code> is greater than <code>B</code>. For a list of code
 * values, see <a
 * rs">http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters</a>.
 * <p>For Binary, Amazon DynamoDB treats each byte of the binary data as
 * unsigned when it compares binary values, for example when evaluating
 * query expressions. </note> </li> <li><p><i>ComparisonOperator</i>-A
 * comparator for evaluating attributes. For example, equals, greater
 * than, less than, etc. <p>Valid comparison operators for Scan:
 * <p><code>EQ | NE | LE | LT | GE | GT | NOT_NULL | NULL | CONTAINS |
 * NOT_CONTAINS | BEGINS_WITH | IN | BETWEEN</code> <p>For information on
 * specifying data types in JSON, see <a
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
 * to <code>{"NS":["6", "2", "1"]}</code> </li> </ul> </li> </ul>
 */
@property (nonatomic, retain) NSMutableDictionary *scanFilter;

/**
 * The primary key of the item from which to continue an earlier
 * operation. An earlier operation might provide this value as the
 * <i>LastEvaluatedKey</i> if that operation was interrupted before
 * completion; either because of the result set size or because of the
 * setting for <i>Limit</i>. The <i>LastEvaluatedKey</i> can be passed
 * back in a new request to continue the operation from that point.
 * <p>The data type for <i>ExclusiveStartKey</i> must be String, Number
 * or Binary. No set data types are allowed.
 */
@property (nonatomic, retain) NSMutableDictionary *exclusiveStartKey;

/**
 * Determines whether to include consumed capacity information in the
 * output. If this is set to <code>TOTAL</code>, then this information is
 * shown in the output; otherwise, the consumed capacity information is
 * not shown.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>TOTAL, NONE
 */
@property (nonatomic, retain) NSString *returnConsumedCapacity;

/**
 * The value of the TotalSegments property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 4096<br/>
 */
@property (nonatomic, retain) NSNumber *totalSegments;

/**
 * The value of the Segment property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>0 - 4095<br/>
 */
@property (nonatomic, retain) NSNumber *segment;


/**
 * Default constructor for a new ScanRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ScanRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table containing the requested
 * items.
 */
-(id)initWithTableName:(NSString *)theTableName;

/**
 * Adds a single object to attributesToGet.
 * This function will alloc and init attributesToGet if not already done.
 */
-(void)addAttributesToGet:(NSString *)attributesToGetObject;


/**
 * Set a value in the dictionary scanFilter for the specified key.
 * This function will alloc and init scanFilter if not already done.
 */
-(void)setScanFilterValue:(DynamoDBCondition *)theValue forKey:(NSString *)theKey;


/**
 * Set a value in the dictionary exclusiveStartKey for the specified key.
 * This function will alloc and init exclusiveStartKey if not already done.
 */
-(void)setExclusiveStartKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
