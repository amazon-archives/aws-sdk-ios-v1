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
#import "DynamoDBCondition.h"
#import "DynamoDBKey.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Query Request
 */

@interface DynamoDBQueryRequest:AmazonServiceRequestConfig

{
    NSString               *tableName;
    NSMutableArray         *attributesToGet;
    NSNumber               *limit;
    bool                   consistentRead;
    bool                   consistentReadIsSet;
    bool                   count;
    bool                   countIsSet;
    DynamoDBAttributeValue *hashKeyValue;
    DynamoDBCondition      *rangeKeyCondition;
    bool                   scanIndexForward;
    bool                   scanIndexForwardIsSet;
    DynamoDBKey            *exclusiveStartKey;
}



/**
 * The name of the table in which you want to query. Allowed characters
 * are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>,
 * <code>_</code> (underscore), <code>-</code> (hyphen) and
 * <code>.</code> (period).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * List of <code>Attribute</code> names. If attribute names are not
 * specified then all attributes will be returned. If some attributes are
 * not found, they will not appear in the result.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *attributesToGet;

/**
 * The maximum number of items to return. If Amazon DynamoDB hits this
 * limit while querying the table, it stops the query and returns the
 * matching values up to the limit, and a <code>LastEvaluatedKey</code>
 * to apply in a subsequent operation to continue the query. Also, if the
 * result set size exceeds 1MB before Amazon DynamoDB hits this limit, it
 * stops the query and returns the matching values, and a
 * <code>LastEvaluatedKey</code> to apply in a subsequent operation to
 * continue the query.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, retain) NSNumber *limit;

/**
 * If set to <code>true</code>, then a consistent read is issued.
 * Otherwise eventually-consistent is used.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;

/**
 * If set to <code>true</code>, Amazon DynamoDB returns a total number of
 * items that match the query parameters, instead of a list of the
 * matching items and their attributes. Do not set <code>Count</code> to
 * <code>true</code> while providing a list of
 * <code>AttributesToGet</code>, otherwise Amazon DynamoDB returns a
 * validation error.
 */
@property (nonatomic) bool           count;

@property (nonatomic, readonly) bool countIsSet;

/**
 * Attribute value of the hash component of the composite primary key.
 */
@property (nonatomic, retain) DynamoDBAttributeValue *hashKeyValue;

/**
 * A container for the attribute values and comparison operators to use
 * for the query.
 */
@property (nonatomic, retain) DynamoDBCondition *rangeKeyCondition;

/**
 * Specifies forward or backward traversal of the index. Amazon DynamoDB
 * returns results reflecting the requested order, determined by the
 * range key. The default value is <code>true</code> (forward).
 */
@property (nonatomic) bool           scanIndexForward;

@property (nonatomic, readonly) bool scanIndexForwardIsSet;

/**
 * Primary key of the item from which to continue an earlier query. An
 * earlier query might provide this value as the
 * <code>LastEvaluatedKey</code> if that query operation was interrupted
 * before completing the query; either because of the result set size or
 * the <code>Limit</code> parameter. The <code>LastEvaluatedKey</code>
 * can be passed back in a new query request to continue the operation
 * from that point.
 */
@property (nonatomic, retain) DynamoDBKey *exclusiveStartKey;


/**
 * Default constructor for a new QueryRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new QueryRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table in which you want to query.
 * Allowed characters are <code>a-z</code>, <code>A-Z</code>,
 * <code>0-9</code>, <code>_</code> (underscore), <code>-</code> (hyphen)
 * and <code>.</code> (period).
 * @param theHashKeyValue Attribute value of the hash component of the
 * composite primary key.
 */
-(id)initWithTableName:(NSString *)theTableName andHashKeyValue:(DynamoDBAttributeValue *)theHashKeyValue;

/**
 * Adds a single object to attributesToGet.
 * This function will alloc and init attributesToGet if not already done.
 */
-(void)addAttributesToGet:(NSString *)attributesToGetObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
