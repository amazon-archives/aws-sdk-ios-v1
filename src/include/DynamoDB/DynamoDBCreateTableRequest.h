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
 */
@property (nonatomic, retain) DynamoDBKeySchema *keySchema;

/**
 * Provisioned throughput reserves the required read and write resources
 * for your table in terms of ReadCapacityUnits and WriteCapacityUnits.
 * Values for provisioned throughput depend upon your expected read/write
 * rates, item size, and consistency. Provide the expected number of read
 * and write operations, assuming an item size of 1KB and strictly
 * consistent reads. For 2KB item size, double the value, 3KB, triple the
 * value, etc. Eventually consistent reads consume half the resources of
 * strictly consistent reads.
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
 * @param theProvisionedThroughput Provisioned throughput reserves the
 * required read and write resources for your table in terms of
 * ReadCapacityUnits and WriteCapacityUnits. Values for provisioned
 * throughput depend upon your expected read/write rates, item size, and
 * consistency. Provide the expected number of read and write operations,
 * assuming an item size of 1KB and strictly consistent reads. For 2KB
 * item size, double the value, 3KB, triple the value, etc. Eventually
 * consistent reads consume half the resources of strictly consistent
 * reads.
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
