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

#import "DynamoDBResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBConditionalCheckFailedException.h"
#import "DynamoDBInternalServerErrorException.h"
#import "DynamoDBResourceNotFoundException.h"


/**
 * Delete Item Result
 */

@interface DynamoDBDeleteItemResponse:DynamoDBResponse

{
    NSMutableDictionary *attributes;
    NSNumber            *consumedCapacityUnits;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * If the <code>ReturnValues</code> parameter is provided as
 * <code>ALL_OLD</code> in the request, Amazon DynamoDB returns an array
 * of attribute name-value pairs (essentially, the deleted item).
 * Otherwise, the response contains an empty set.
 */
@property (nonatomic, retain) NSMutableDictionary *attributes;

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
 * Returns a value from the attributes dictionary for the specified key.
 */
-(DynamoDBAttributeValue *)attributesValueForKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
