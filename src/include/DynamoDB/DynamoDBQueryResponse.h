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

#import "DynamoDBAttributeValue.h"
#import "DynamoDBConsumedCapacity.h"

#import "DynamoDBResponse.h"

#import "DynamoDBResourceNotFoundException.h"
#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBInternalServerErrorException.h"


/**
 * Query Result
 */

@interface DynamoDBQueryResponse:DynamoDBResponse

{
    NSMutableArray           *items;
    NSNumber                 *count;
    NSMutableDictionary      *lastEvaluatedKey;
    DynamoDBConsumedCapacity *consumedCapacity;
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
 * The value of the Count property for this object.
 */
@property (nonatomic, retain) NSNumber *count;

/**
 * The value of the LastEvaluatedKey property for this object.
 */
@property (nonatomic, retain) NSMutableDictionary *lastEvaluatedKey;

/**
 * The value of the ConsumedCapacity property for this object.
 */
@property (nonatomic, retain) DynamoDBConsumedCapacity *consumedCapacity;



/**
 * Returns a value from the items array for the specified index
 */
-(NSDictionary *)itemsObjectAtIndex:(int)index;

/**
 * Returns a value from the lastEvaluatedKey dictionary for the specified key.
 */
-(DynamoDBAttributeValue *)lastEvaluatedKeyValueForKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
