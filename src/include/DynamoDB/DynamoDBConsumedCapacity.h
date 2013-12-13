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

#import "DynamoDBCapacity.h"
#import "DynamoDBCapacity.h"
#import "DynamoDBCapacity.h"



/**
 * Consumed Capacity
 */

@interface DynamoDBConsumedCapacity:NSObject

{
    NSString            *tableName;
    NSNumber            *capacityUnits;
    DynamoDBCapacity    *table;
    NSMutableDictionary *localSecondaryIndexes;
    NSMutableDictionary *globalSecondaryIndexes;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the table that was affected by the operation.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * The total number of capacity units consumed by the operation.
 */
@property (nonatomic, retain) NSNumber *capacityUnits;

/**
 * The amount of throughput consumed on the table affected by the
 * operation.
 */
@property (nonatomic, retain) DynamoDBCapacity *table;

/**
 * The amount of throughput consumed on each local index affected by the
 * operation.
 */
@property (nonatomic, retain) NSMutableDictionary *localSecondaryIndexes;

/**
 * The amount of throughput consumed on each global index affected by the
 * operation.
 */
@property (nonatomic, retain) NSMutableDictionary *globalSecondaryIndexes;


/**
 * Set a value in the dictionary localSecondaryIndexes for the specified key.
 * This function will alloc and init localSecondaryIndexes if not already done.
 */
-(void)setLocalSecondaryIndexesValue:(DynamoDBCapacity *)theValue forKey:(NSString *)theKey;


/**
 * Set a value in the dictionary globalSecondaryIndexes for the specified key.
 * This function will alloc and init globalSecondaryIndexes if not already done.
 */
-(void)setGlobalSecondaryIndexesValue:(DynamoDBCapacity *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
