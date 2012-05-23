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

#import "DynamoDBKey.h"

#import "DynamoDBResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBInternalServerErrorException.h"
#import "DynamoDBResourceNotFoundException.h"


/**
 * Scan Result
 */

@interface DynamoDBScanResponse:DynamoDBResponse

{
    NSMutableArray *items;
    NSNumber       *count;
    NSNumber       *scannedCount;
    DynamoDBKey    *lastEvaluatedKey;
    NSNumber       *consumedCapacityUnits;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Items property for this object.
 */
@property (nonatomic, retain) NSMutableArray *items;

/**
 * Number of items in the response.
 */
@property (nonatomic, retain) NSNumber *count;

/**
 * Number of items in the complete scan before any filters are applied. A
 * high <code>ScannedCount</code> value with few, or no,
 * <code>Count</code> results indicates an inefficient <code>Scan</code>
 * operation.
 */
@property (nonatomic, retain) NSNumber *scannedCount;

/**
 * Primary key of the item where the scan operation stopped. Provide this
 * value in a subsequent scan operation to continue the operation from
 * that point. The <code>LastEvaluatedKey</code> is null when the entire
 * scan result set is complete (i.e. the operation processed the "last
 * page").
 */
@property (nonatomic, retain) DynamoDBKey *lastEvaluatedKey;

/**
 * The number of Capacity Units of the provisioned throughput of the
 * table consumed during the operation. <code>GetItem</code>,
 * <code>BatchGetItem</code>, <code>BatchWriteItem</code>,
 * <code>Query</code>, and <code>Scan</code> operations consume
 * <code>ReadCapacityUnits</code>, while <code>PutItem</code>,
 * <code>UpdateItem</code>, and <code>DeleteItem</code> operations
 * consume <code>WriteCapacityUnits</code>.
 */
@property (nonatomic, retain) NSNumber *consumedCapacityUnits;



/**
 * Returns a value from the items array for the specified index
 */
-(NSDictionary *)itemsObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
