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

#import "DynamoDBBatchWriteResponse.h"
#import "DynamoDBWriteRequest.h"

#import "DynamoDBResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBInternalServerErrorException.h"
#import "DynamoDBResourceNotFoundException.h"


/**
 * Batch Write Item Result
 */

@interface DynamoDBBatchWriteItemResponse:DynamoDBResponse

{
    NSMutableDictionary *responses;
    NSMutableDictionary *unprocessedItems;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The response object as a result of <code>BatchWriteItem</code> call.
 * This is essentially a map of table name to
 * <code>ConsumedCapacityUnits</code>.
 */
@property (nonatomic, retain) NSMutableDictionary *responses;

/**
 * The Items which we could not successfully process in a
 * <code>BatchWriteItem</code> call is returned as
 * <code>UnprocessedItems</code>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 25<br/>
 */
@property (nonatomic, retain) NSMutableDictionary *unprocessedItems;

/**
 * Returns a value from the responses dictionary for the specified key.
 */
-(DynamoDBBatchWriteResponse *)responsesValueForKey:(NSString *)theKey;

/**
 * Returns a value from the unprocessedItems dictionary for the specified key.
 */
-(NSArray *)unprocessedItemsValueForKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
