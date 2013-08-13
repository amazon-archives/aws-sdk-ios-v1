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
 * Keys And Attributes
 */

@interface DynamoDBKeysAndAttributes:NSObject

{
    NSMutableArray *keys;
    NSMutableArray *attributesToGet;
    bool           consistentRead;
    bool           consistentReadIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Represents the primary key attribute values that define the items and
 * the attributes associated with the items.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSMutableArray *keys;

/**
 * Represents one or more attributes to retrieve from the table or index.
 * If no attribute names are specified then all attributes will be
 * returned. If any of the specified attributes are not found, they will
 * not appear in the result. <p>If you are querying an index and only
 * request attributes that are projected into that index, the operation
 * will consult the index and bypass the table. If any of the requested
 * attributes are not projected into the index, Amazon DynamoDB will need
 * to fetch each matching item from the table. This extra fetching incurs
 * additional throughput cost and latency.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *attributesToGet;

/**
 * Represents the consistency of a read operation. If set to
 * <code>true</code>, then a strongly consistent read is used; otherwise,
 * an eventually consistent read is used.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;

/**
 * Adds a single object to keys.
 * This function will alloc and init keys if not already done.
 */
-(void)addKey:(NSMutableDictionary *)keyObject;

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
