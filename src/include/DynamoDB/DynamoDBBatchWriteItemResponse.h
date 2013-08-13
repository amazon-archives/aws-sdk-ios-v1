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
#import "DynamoDBItemCollectionMetrics.h"
#import "DynamoDBConsumedCapacity.h"

#import "DynamoDBResponse.h"

#import "DynamoDBItemCollectionSizeLimitExceededException.h"
#import "DynamoDBResourceNotFoundException.h"
#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBInternalServerErrorException.h"


/**
 * Batch Write Item Result
 */

@interface DynamoDBBatchWriteItemResponse:DynamoDBResponse

{
    NSMutableDictionary *unprocessedItems;
    NSMutableDictionary *itemCollectionMetrics;
    NSMutableArray      *consumedCapacity;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A map of tables, and requests against those tables, that were not
 * processed with the current response. This might be due to a response
 * exceeding the 1 MB HTTP payload limit, or an item in the batch
 * exceeding the 64 KB item size limit. The <i>UnprocessedKeys</i> value
 * is in the same form as <i>RequestItems</i>, so you can provide this
 * value directly to a subsequent <i>BatchGetItem</i> operation. For more
 * information, see <i>RequestItems</i> in the Request Parameters
 * section. <p>Each <i>UnprocessedItems</i> entry consists of a table
 * name and, for that table, a list of operations to perform
 * (<i>DeleteRequest</i> or <i>PutRequest</i>). <ul> <li>
 * <p><i>DeleteRequest</i>-Perform a <i>DeleteItem</i> operation on the
 * specified item. The item to be deleted is identified by: <ul> <li>
 * <p><i>Key</i>-A map of primary key attribute values that uniquely
 * identify the item. Each entry in this map consists of an attribute
 * name and an attribute value. </li> </ul> </li> <li>
 * <p><i>PutRequest</i>-Perform a <i>PutItem</i> operation on the
 * specified item. The item to be updated is identified by: <ul>
 * <li><i>Item</i>-A map of attributes and their values. Each entry in
 * this map consists of an attribute name and an attribute value.</li>
 * </ul> </li> </ul>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 25<br/>
 */
@property (nonatomic, retain) NSMutableDictionary *unprocessedItems;

/**
 * A list of tables that were processed by <i>BatchWriteItem</i> and, for
 * each table, information about any item collections that were affected
 * by individual <i>DeleteItem</i> or <i>PutItem</i> operations. <p>Each
 * entry consists of: <ul> <li> <p><i>ItemCollectionKey</i>-the hash key
 * value of the item collection. This is the same as the hash key of the
 * item. </li> <li> <p><i>SizeEstimateRange</i>-an estimate of item
 * collection size, measured in gigabytes. This is a two-element array
 * containing a lower bound and an upper bound for the estimate. The
 * estimate includes the size of all the items in the table, plus the
 * size of all attributes projected into all of the secondary indexes on
 * that table. Use this estimate to measure whether a secondary index is
 * approaching its size limit. <p>The estimate is subject to change over
 * time; therefore, do not rely on the precision or accuracy of the
 * estimate. </li> </ul>
 */
@property (nonatomic, retain) NSMutableDictionary *itemCollectionMetrics;

/**
 * The capacity units consumed by the operation. <p>Each element consists
 * of: <ul> <li> <p><i>TableName</i>-The table that consumed the
 * provisioned throughput. </li> <li> <p><i>CapacityUnits</i>-The total
 * number of capacity units consumed. </li> </ul>
 */
@property (nonatomic, retain) NSMutableArray *consumedCapacity;

/**
 * Returns a value from the unprocessedItems dictionary for the specified key.
 */
-(NSArray *)unprocessedItemsValueForKey:(NSString *)theKey;

/**
 * Returns a value from the itemCollectionMetrics dictionary for the specified key.
 */
-(NSArray *)itemCollectionMetricsValueForKey:(NSString *)theKey;



/**
 * Returns a value from the consumedCapacity array for the specified index
 */
-(DynamoDBConsumedCapacity *)consumedCapacityObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
