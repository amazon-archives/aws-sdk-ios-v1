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

#import "DynamoDBAttributeDefinition.h"
#import "DynamoDBKeySchemaElement.h"
#import "DynamoDBLocalSecondaryIndex.h"
#import "DynamoDBProvisionedThroughput.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Create Table Request
 */

@interface DynamoDBCreateTableRequest:AmazonServiceRequestConfig

{
    NSMutableArray                *attributeDefinitions;
    NSString                      *tableName;
    NSMutableArray                *keySchema;
    NSMutableArray                *localSecondaryIndexes;
    DynamoDBProvisionedThroughput *provisionedThroughput;
}



/**
 * An array of attributes that describe the key schema for the table and
 * indexes.
 */
@property (nonatomic, retain) NSMutableArray *attributeDefinitions;

/**
 * The name of the table to create.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * Specifies the attributes that make up the primary key for the table.
 * The attributes in <i>KeySchema</i> must also be defined in the
 * <i>AttributeDefinitions</i> array. For more information, see <a
 * s.amazon.com/amazondynamodb/latest/developerguide/DataModel.html">Data
 * Model</a> of the <i>Amazon DynamoDB Developer Guide</i>. <p>Each
 * <i>KeySchemaElement</i> in the array is composed of: <ul> <li>
 * <p><i>AttributeName</i>-The name of this key attribute. </li> <li>
 * <p><i>KeyType</i>-Determines whether the key attribute is
 * <code>HASH</code> or <code>RANGE</code>. </li> </ul> <p>For more
 * information, see <a
 * e/WorkingWithDDTables.html#WorkingWithDDTables.primary.key">Specifying
 * the Primary Key</a> of the <i>Amazon DynamoDB Developer Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 2<br/>
 */
@property (nonatomic, retain) NSMutableArray *keySchema;

/**
 * One or more secondary indexes (the maximum is five) to be created on
 * the table. Each index is scoped to a given hash key value. There is a
 * 10 gigabyte size limit per hash key; otherwise, the size of a local
 * secondary index is unconstrained. <p>Each secondary index in the array
 * includes the following: <ul> <li> <p><i>IndexName</i>-The name of the
 * secondary index. Must be unique only for this table. <p> </li> <li>
 * <p><i>KeySchema</i>-Specifies the key schema for the index. The key
 * schema must begin with the same hash key attribute as the table. </li>
 * <li> <p><i>Projection</i>-Specifies attributes that are copied
 * (projected) from the table into the index. These are in addition to
 * the primary key attributes and index key attributes, which are
 * automatically projected. Each attribute specification is composed of:
 * <ul> <li> <p><i>ProjectionType</i>-One of the following: <ul> <li>
 * <p><code>KEYS_ONLY</code>-Only the index and primary keys are
 * projected into the index. </li> <li> <p><code>INCLUDE</code>-Only the
 * specified table attributes are projected into the index. The list of
 * projected attributes are in <i>NonKeyAttributes</i>. </li> <li>
 * <p><code>ALL</code>-All of the table attributes are projected into the
 * index. </li> </ul> </li> <li> <p><i>NonKeyAttributes</i>-A list of one
 * or more non-key attribute names that are projected into the index. The
 * total count of attributes specified in <i>NonKeyAttributes</i>, summed
 * across all of the local secondary indexes, must not exceed 20. If you
 * project the same attribute into two different indexes, this counts as
 * two distinct attributes when determining the total. </li> </ul> </li>
 * </ul>
 */
@property (nonatomic, retain) NSMutableArray *localSecondaryIndexes;

/**
 * The provisioned throughput settings for the specified table. The
 * settings can be modified using the <i>UpdateTable</i> operation.
 * <p>For current minimum and maximum provisioned throughput values, see
 * <a
 * mazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
 * of the <i>Amazon DynamoDB Developer Guide</i>.
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
 * @param theTableName The name of the table to create.
 * @param theKeySchema Specifies the attributes that make up the primary
 * key for the table. The attributes in <i>KeySchema</i> must also be
 * defined in the <i>AttributeDefinitions</i> array. For more
 * information, see <a
 * s.amazon.com/amazondynamodb/latest/developerguide/DataModel.html">Data
 * Model</a> of the <i>Amazon DynamoDB Developer Guide</i>. <p>Each
 * <i>KeySchemaElement</i> in the array is composed of: <ul> <li>
 * <p><i>AttributeName</i>-The name of this key attribute. </li> <li>
 * <p><i>KeyType</i>-Determines whether the key attribute is
 * <code>HASH</code> or <code>RANGE</code>. </li> </ul> <p>For more
 * information, see <a
 * e/WorkingWithDDTables.html#WorkingWithDDTables.primary.key">Specifying
 * the Primary Key</a> of the <i>Amazon DynamoDB Developer Guide</i>.
 */
-(id)initWithTableName:(NSString *)theTableName andKeySchema:(NSMutableArray *)theKeySchema;

/**
 * Constructs a new CreateTableRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table to create.
 * @param theKeySchema Specifies the attributes that make up the primary
 * key for the table. The attributes in <i>KeySchema</i> must also be
 * defined in the <i>AttributeDefinitions</i> array. For more
 * information, see <a
 * s.amazon.com/amazondynamodb/latest/developerguide/DataModel.html">Data
 * Model</a> of the <i>Amazon DynamoDB Developer Guide</i>. <p>Each
 * <i>KeySchemaElement</i> in the array is composed of: <ul> <li>
 * <p><i>AttributeName</i>-The name of this key attribute. </li> <li>
 * <p><i>KeyType</i>-Determines whether the key attribute is
 * <code>HASH</code> or <code>RANGE</code>. </li> </ul> <p>For more
 * information, see <a
 * e/WorkingWithDDTables.html#WorkingWithDDTables.primary.key">Specifying
 * the Primary Key</a> of the <i>Amazon DynamoDB Developer Guide</i>.
 * @param theProvisionedThroughput The provisioned throughput settings
 * for the specified table. The settings can be modified using the
 * <i>UpdateTable</i> operation. <p>For current minimum and maximum
 * provisioned throughput values, see <a
 * mazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
 * of the <i>Amazon DynamoDB Developer Guide</i>.
 */
-(id)initWithTableName:(NSString *)theTableName andKeySchema:(NSMutableArray *)theKeySchema andProvisionedThroughput:(DynamoDBProvisionedThroughput *)theProvisionedThroughput;

/**
 * Adds a single object to attributeDefinitions.
 * This function will alloc and init attributeDefinitions if not already done.
 */
-(void)addAttributeDefinition:(DynamoDBAttributeDefinition *)attributeDefinitionObject;

/**
 * Adds a single object to keySchema.
 * This function will alloc and init keySchema if not already done.
 */
-(void)addKeySchema:(DynamoDBKeySchemaElement *)keySchemaObject;

/**
 * Adds a single object to localSecondaryIndexes.
 * This function will alloc and init localSecondaryIndexes if not already done.
 */
-(void)addLocalSecondaryIndexe:(DynamoDBLocalSecondaryIndex *)localSecondaryIndexeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
