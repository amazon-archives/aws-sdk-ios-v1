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
 * Query Result
 */

@interface DynamoDBQueryResponse:DynamoDBResponse

{
    NSMutableArray *items;
    NSNumber       *count;
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
 * Primary key of the item where the query operation stopped, inclusive
 * of the previous result set. Use this value to start a new operation
 * excluding this value in the new request. The
 * <code>LastEvaluatedKey</code> is null when the entire query result set
 * is complete (i.e. the operation processed the "last page").
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
