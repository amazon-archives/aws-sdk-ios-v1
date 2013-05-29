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

#import "DynamoDBWriteRequest.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Batch Write Item Request
 */

@interface DynamoDBBatchWriteItemRequest:AmazonServiceRequestConfig

{
    NSMutableDictionary *requestItems;
    NSString            *returnConsumedCapacity;
    NSString            *returnItemCollectionMetrics;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A map of one or more table names and, for each table, a list of
 * operations to be performed (<i>DeleteRequest</i> or
 * <i>PutRequest</i>). Each element in the map consists of the following:
 * <ul> <li> <p><i>DeleteRequest</i> - Perform a <i>DeleteItem</i>
 * operation on the specified item. The item to be deleted is identified
 * by a <i>Key</i> subelement: <ul> <li> <p><i>Key</i> - A map of primary
 * key attribute values that uniquely identify the item. Each entry in
 * this map consists of an attribute name and an attribute value. </li>
 * </ul> </li> <li> <p><i>PutRequest</i> - Perform a <i>PutItem</i>
 * operation on the specified item. The item to be put is identified by
 * an <i>Item</i> subelement: <ul> <li> <p><i>Item</i> - A map of
 * attributes and their values. Each entry in this map consists of an
 * attribute name and an attribute value. Attribute values must not be
 * null; string and binary type attributes must have lengths greater than
 * zero; and set type attributes must not be empty. Requests that contain
 * empty values will be rejected with a <i>ValidationException</i>. <p>If
 * you specify any attributes that are part of an index key, then the
 * data types for those attributes must match those of the schema in the
 * table's attribute definition.</li> </ul> </li> </ul>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 25<br/>
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
 * If set to <code>SIZE</code>, statistics about item collections, if
 * any, that were modified during the operation are returned in the
 * response. If set to <code>NONE</code> (the default), no statistics are
 * returned..
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>SIZE, NONE
 */
@property (nonatomic, retain) NSString *returnItemCollectionMetrics;


/**
 * Set a value in the dictionary requestItems for the specified key.
 * This function will alloc and init requestItems if not already done.
 */
-(void)setRequestItemsValue:(NSArray *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
