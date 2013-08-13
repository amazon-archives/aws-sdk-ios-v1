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
 * Query Request
 */

@interface DynamoDBQueryRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSString            *indexName;
    NSString            *select;
    NSMutableArray      *attributesToGet;
    NSNumber            *limit;
    bool                consistentRead;
    bool                consistentReadIsSet;
    NSMutableDictionary *keyConditions;
    bool                scanIndexForward;
    bool                scanIndexForwardIsSet;
    NSMutableDictionary *exclusiveStartKey;
    NSString            *returnConsumedCapacity;
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
 * The name of an index on the table to query.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *indexName;

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
 * <p><code>ALL_PROJECTED_ATTRIBUTES</code>: Allowed only when querying
 * an index. Retrieves all attributes which have been projected into the
 * index. If the index is configured to project all attributes, this is
 * equivalent to specifying <i>ALL_ATTRIBUTES</i>. </li> <li>
 * <p><code>COUNT</code>: Returns the number of matching items, rather
 * than the matching items themselves. </li> <li> <p>
 * <code>SPECIFIC_ATTRIBUTES</code> : Returns only the attributes listed
 * in <i>AttributesToGet</i>. This is equivalent to specifying
 * <i>AttributesToGet</i> without specifying any value for <i>Select</i>.
 * <p>If you are querying an index and only request attributes that are
 * projected into that index, the operation will consult the index and
 * bypass the table. If any of the requested attributes are not projected
 * into the index, Amazon DynamoDB will need to fetch each matching item
 * from the table. This extra fetching incurs additional throughput cost
 * and latency. </li> </ul> <p>When neither <i>Select</i> nor
 * <i>AttributesToGet</i> are specified, Amazon DynamoDB defaults to
 * <code>ALL_ATTRIBUTES</code> when accessing a table, and
 * <code>ALL_PROJECTED_ATTRIBUTES</code> when accessing an index. You
 * cannot use both <i>Select</i> and <i>AttributesToGet</i> together in a
 * single request, <i>unless</i> the value for <i>Select</i> is
 * <code>SPECIFIC_ATTRIBUTES</code>. (This usage is equivalent to
 * specifying <i>AttributesToGet</i> without any value for
 * <i>Select</i>.)
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ALL_ATTRIBUTES, ALL_PROJECTED_ATTRIBUTES, SPECIFIC_ATTRIBUTES, COUNT
 */
@property (nonatomic, retain) NSString *select;

/**
 * The names of one or more attributes to retrieve. If no attribute names
 * are specified, then all attributes will be returned. If any of the
 * requested attributes are not found, they will not appear in the
 * result. <p>If you are querying an index and only request attributes
 * that are projected into that index, the operation will consult the
 * index and bypass the table. If any of the requested attributes are not
 * projected into the index, Amazon DynamoDB will need to fetch each
 * matching item from the table. This extra fetching incurs additional
 * throughput cost and latency. <p>You cannot use both
 * <i>AttributesToGet</i> and <i>Select</i> together in a <i>Query</i>
 * request, <i>unless</i> the value for <i>Select</i> is
 * <code>SPECIFIC_ATTRIBUTES</code>. (This usage is equivalent to
 * specifying <i>AttributesToGet</i> without any value for
 * <i>Select</i>.)
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
 * If set to <code>true</code>, then the operation uses strongly
 * consistent reads; otherwise, eventually consistent reads are used.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;

/**
 * The selection criteria for the query. <p>For a query on a table, you
 * can only have conditions on the table primary key attributes. you must
 * specify the hash key attribute name and value as an <code>EQ</code>
 * condition. You can optionally specify a second condition, referring to
 * the range key attribute. <p>For a query on a secondary index, you can
 * only have conditions on the index key attributes. You must specify the
 * index hash attribute name and value as an EQ condition. You can
 * optionally specify a second condition, referring to the index key
 * range attribute. <p>Multiple conditions are evaluated using "AND"; in
 * other words, all of the conditions must be met in order for an item to
 * appear in the results results. <p>Each <i>KeyConditions</i> element
 * consists of an attribute name to compare, along with the following:
 * <ul> <li><p><i>AttributeValueList</i>-One or more values to evaluate
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
 * than, less than, etc. <p>Valid comparison operators for Query:
 * <p><code>EQ | LE | LT | GE | GT | BEGINS_WITH | BETWEEN</code> <p>For
 * information on specifying data types in JSON, see <a
 * .amazon.com/amazondynamodb/latest/developerguide/DataFormat.html">JSON
 * Data Format</a> of the <i>Amazon DynamoDB Developer Guide</i>. <p>The
 * following are descriptions of each comparison operator. <ul> <li>
 * <p><code>EQ</code> : Equal. <p><i>AttributeValueList</i> can contain
 * only one <i>AttributeValue</i> of type String, Number, or Binary (not
 * a set). If an item contains an <i>AttributeValue</i> of a different
 * type than the one specified in the request, the value does not match.
 * For example, <code>{"S":"6"}</code> does not equal
 * <code>{"N":"6"}</code>. Also, <code>{"N":"6"}</code> does not equal
 * <code>{"NS":["6", "2", "1"]}</code>. <p> </li> <li> <p><code>LE</code>
 * : Less than or equal. <p><i>AttributeValueList</i> can contain only
 * one <i>AttributeValue</i> of type String, Number, or Binary (not a
 * set). If an item contains an <i>AttributeValue</i> of a different type
 * than the one specified in the request, the value does not match. For
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
 * "2", "1"]}</code>. <p> </li> <li> <p><code>BEGINS_WITH</code> : checks
 * for a prefix. <p><i>AttributeValueList</i> can contain only one
 * <i>AttributeValue</i> of type String or Binary (not a Number or a
 * set). The target attribute of the comparison must be a String or
 * Binary (not a Number or a set). <p> </li> <li> <p><code>BETWEEN</code>
 * : Greater than or equal to the first value, and less than or equal to
 * the second value. <p><i>AttributeValueList</i> must contain two
 * <i>AttributeValue</i> elements of the same type, either String,
 * Number, or Binary (not a set). A target attribute matches if the
 * target value is greater than, or equal to, the first element and less
 * than, or equal to, the second element. If an item contains an
 * <i>AttributeValue</i> of a different type than the one specified in
 * the request, the value does not match. For example,
 * <code>{"S":"6"}</code> does not compare to <code>{"N":"6"}</code>.
 * Also, <code>{"N":"6"}</code> does not compare to <code>{"NS":["6",
 * "2", "1"]}</code> </li> </ul></li> </ul>
 */
@property (nonatomic, retain) NSMutableDictionary *keyConditions;

/**
 * Specifies ascending (true) or descending (false) traversal of the
 * index. Amazon DynamoDB returns results reflecting the requested order
 * determined by the range key. If the data type is Number, the results
 * are returned in numeric order. For String, the results are returned in
 * order of ASCII character code values. For Binary, Amazon DynamoDB
 * treats each byte of the binary data as unsigned when it compares
 * binary values. <p>If <i>ScanIndexForward</i> is not specified, the
 * results are returned in ascending order.
 */
@property (nonatomic) bool           scanIndexForward;

@property (nonatomic, readonly) bool scanIndexForwardIsSet;

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
 * Default constructor for a new QueryRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new QueryRequest object.
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
 * Set a value in the dictionary keyConditions for the specified key.
 * This function will alloc and init keyConditions if not already done.
 */
-(void)setKeyConditionsValue:(DynamoDBCondition *)theValue forKey:(NSString *)theKey;


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
