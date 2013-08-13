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
#import "DynamoDBConsumedCapacity.h"

#import "DynamoDBResponse.h"

#import "DynamoDBResourceNotFoundException.h"
#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBInternalServerErrorException.h"


/**
 * Batch Get Item Result
 */

@interface DynamoDBBatchGetItemResponse:DynamoDBResponse

{
    NSMutableDictionary *responses;
    NSMutableDictionary *unprocessedKeys;
    NSMutableArray      *consumedCapacity;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A map of table name to a list of items. Each object in
 * <i>Responses</i>consists of a table name, along with a map of
 * attribute data consisting of the data type and attribute value.
 */
@property (nonatomic, retain) NSMutableDictionary *responses;

/**
 * A map of tables and their respective keys that were not processed with
 * the current response, possibly due to reaching a limit on the response
 * size. The <i>UnprocessedKeys</i> value is in the same form as
 * <i>RequestItems</i>, so the value can be provided directly to a
 * subsequent <i>BatchGetItem</i> operation. For more information, see
 * <i>RequestItems</i> in the Request Parameters section. <p>Each element
 * consists of: <ul> <li> <p><i>Keys</i>-The primary key attribute values
 * that define the items and the attributes associated with the items.
 * </li> <li> <p><i>AttributesToGet</i>-One or more attributes to
 * retrieve from the table or index. If no attribute names are specified
 * then all attributes will be returned. If any of the specified
 * attributes are not found, they will not appear in the result. <p>If
 * you are querying an index and only request attributes that are
 * projected into that index, the operation will consult the index and
 * bypass the table. If any of the requested attributes are not projected
 * into the index, Amazon DynamoDB will need to fetch each matching item
 * from the table. This extra fetching incurs additional throughput cost
 * and latency. </li> <li> <p><i>ConsistentRead</i>-The consistency of a
 * read operation. If set to <code>true</code>, then a strongly
 * consistent read is used; otherwise, an eventually consistent read is
 * used. </li> </ul>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSMutableDictionary *unprocessedKeys;

/**
 * The capacity units consumed by the operation. <p>Each element consists
 * of: <ul> <li> <p><i>TableName</i>-The table that consumed the
 * provisioned throughput. </li> <li> <p><i>CapacityUnits</i>-The total
 * number of capacity units consumed. </li> </ul>
 */
@property (nonatomic, retain) NSMutableArray *consumedCapacity;

/**
 * Returns a value from the responses dictionary for the specified key.
 */
-(NSArray *)responsesValueForKey:(NSString *)theKey;

/**
 * Returns a value from the unprocessedKeys dictionary for the specified key.
 */
-(DynamoDBKeysAndAttributes *)unprocessedKeysValueForKey:(NSString *)theKey;



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
