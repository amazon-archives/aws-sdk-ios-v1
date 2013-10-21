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

#import "DynamoDBKeysAndAttributes.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Batch Get Item Request
 */

@interface DynamoDBBatchGetItemRequest:AmazonServiceRequestConfig

{
    NSMutableDictionary *requestItems;
    NSString            *returnConsumedCapacity;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A map of one or more table names and, for each table, the
 * corresponding primary keys for the items to retrieve. Each table name
 * can be invoked only once. <p>Each element in the map consists of the
 * following: <ul> <li> <p><i>Keys</i> - An array of primary key
 * attribute values that define specific items in the table. </li> <li>
 * <p><i>AttributesToGet</i> - One or more attributes to be retrieved
 * from the table or index. By default, all attributes are returned. If a
 * specified attribute is not found, it does not appear in the result.
 * </li> <li> <p><i>ConsistentRead</i> - If <code>true</code>, a strongly
 * consistent read is used; if <code>false</code> (the default), an
 * eventually consistent read is used. </li> </ul>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSMutableDictionary *requestItems;

/**
 * If set to <code>TOTAL</code>, <i>ConsumedCapacity</i> is included in
 * the response; if set to <code>NONE</code> (the default),
 * <i>ConsumedCapacity</i> is not included.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>TOTAL, NONE
 */
@property (nonatomic, retain) NSString *returnConsumedCapacity;


/**
 * Set a value in the dictionary requestItems for the specified key.
 * This function will alloc and init requestItems if not already done.
 */
-(void)setRequestItemsValue:(DynamoDBKeysAndAttributes *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
