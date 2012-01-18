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

#import "DynamoDBKeySchema.h"
#import "DynamoDBProvisionedThroughput.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Create Table Request
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBCreateTableRequest:AmazonServiceRequestConfig

{
    NSString                      *tableName;
    DynamoDBKeySchema             *keySchema;
    DynamoDBProvisionedThroughput *provisionedThroughput;
}



/**
 * The value of the TableName property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * KeySchema: The KeySchema identifies the primary key as a one attribute
 * primary key (hash) or a composite two attribute (hash-and-range)
 * primary key. Single attribute primary keys have one index value: a
 * HashKeyElement. A composite hash-and-range primary key contains two
 * attribute values: a HashKeyElement and a RangeKeyElement.
 * HashKeyElement: A hash key element can be a string or a number. Single
 * attribute primary keys have one index value: a HashKeyElement.
 * RangeKeyElement: A range key element can be a string or a number, and
 * is only used for hash-and-range primary keys. Composite hash-and-range
 * primary keys contain two attribute values for the index: a
 * HashKeyElement and a RangeKeyElement. A RangeKeyElement enables
 * greater precision for a primary key so data queries can refine results
 * based on the two part hash-and-range index.
 */
@property (nonatomic, retain) DynamoDBKeySchema *keySchema;

/**
 * Desired throughput for the specified table, consisting of values for
 * ReadCapacityUnits and WriteCapacityUnits.
 */
@property (nonatomic, retain) DynamoDBProvisionedThroughput *provisionedThroughput;


/**
 * Default constructor for a new CreateTableRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new CreateTableRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName
 * @param theKeySchema KeySchema: The KeySchema identifies the primary
 * key as a one attribute primary key (hash) or a composite two attribute
 * (hash-and-range) primary key. Single attribute primary keys have one
 * index value: a HashKeyElement. A composite hash-and-range primary key
 * contains two attribute values: a HashKeyElement and a RangeKeyElement.
 * HashKeyElement: A hash key element can be a string or a number. Single
 * attribute primary keys have one index value: a HashKeyElement.
 * RangeKeyElement: A range key element can be a string or a number, and
 * is only used for hash-and-range primary keys. Composite hash-and-range
 * primary keys contain two attribute values for the index: a
 * HashKeyElement and a RangeKeyElement. A RangeKeyElement enables
 * greater precision for a primary key so data queries can refine results
 * based on the two part hash-and-range index.
 */
-(id)initWithTableName:(NSString *)theTableName andKeySchema:(DynamoDBKeySchema *)theKeySchema;

/**
 * Constructs a new CreateTableRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName
 * @param theKeySchema KeySchema: The KeySchema identifies the primary
 * key as a one attribute primary key (hash) or a composite two attribute
 * (hash-and-range) primary key. Single attribute primary keys have one
 * index value: a HashKeyElement. A composite hash-and-range primary key
 * contains two attribute values: a HashKeyElement and a RangeKeyElement.
 * HashKeyElement: A hash key element can be a string or a number. Single
 * attribute primary keys have one index value: a HashKeyElement.
 * RangeKeyElement: A range key element can be a string or a number, and
 * is only used for hash-and-range primary keys. Composite hash-and-range
 * primary keys contain two attribute values for the index: a
 * HashKeyElement and a RangeKeyElement. A RangeKeyElement enables
 * greater precision for a primary key so data queries can refine results
 * based on the two part hash-and-range index.
 * @param theProvisionedThroughput Desired throughput for the specified
 * table, consisting of values for ReadCapacityUnits and
 * WriteCapacityUnits.
 */
-(id)initWithTableName:(NSString *)theTableName andKeySchema:(DynamoDBKeySchema *)theKeySchema andProvisionedThroughput:(DynamoDBProvisionedThroughput *)theProvisionedThroughput;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
