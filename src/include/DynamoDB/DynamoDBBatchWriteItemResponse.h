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
 * The value of the UnprocessedItems property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 25<br/>
 */
@property (nonatomic, retain) NSMutableDictionary *unprocessedItems;

/**
 * The value of the ItemCollectionMetrics property for this object.
 */
@property (nonatomic, retain) NSMutableDictionary *itemCollectionMetrics;

/**
 * The value of the ConsumedCapacity property for this object.
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
