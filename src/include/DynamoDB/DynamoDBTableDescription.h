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
#import "DynamoDBProvisionedThroughputDescription.h"
#import "DynamoDBLocalSecondaryIndexDescription.h"



/**
 * Table Description
 */

@interface DynamoDBTableDescription:NSObject

{
    NSMutableArray                           *attributeDefinitions;
    NSString                                 *tableName;
    NSMutableArray                           *keySchema;
    NSString                                 *tableStatus;
    NSDate                                   *creationDateTime;
    DynamoDBProvisionedThroughputDescription *provisionedThroughput;
    NSNumber                                 *tableSizeBytes;
    NSNumber                                 *itemCount;
    NSMutableArray                           *localSecondaryIndexes;
}



/**
 * An array of <i>AttributeDefinition</i> objects. Each of these objects
 * describes one attribute in the table and index key schema. <p>Each
 * <i>AttributeDefinition</i> object in this array is composed of: <ul>
 * <li> <p><i>AttributeName</i>-The name of the attribute. </li> <li>
 * <p><i>AttributeType</i>-The data type for the attribute. </li> </ul>
 */
@property (nonatomic, retain) NSMutableArray *attributeDefinitions;

/**
 * The name of the table.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * The primary key structure for the table. Each <i>KeySchemaElement</i>
 * consists of: <ul> <li> <p><i>AttributeName</i>-The name of the
 * attribute. </li> <li> <p><i>KeyType</i>-The key type for the
 * attribute. Can be either <code>HASH</code> or <code>RANGE</code>.
 * </li> </ul> <p>For more information about primary keys, see <a
 * modb/latest/developerguide/DataModel.html#DataModelPrimaryKey">Primary
 * Key</a> of the <i>Amazon DynamoDB Developer Guide</i>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 2<br/>
 */
@property (nonatomic, retain) NSMutableArray *keySchema;

/**
 * Represents the current state of the table: <ul> <li>
 * <p><i>CREATING</i>-The table is being created, as the result of a
 * <i>CreateTable</i> operation. </li> <li> <p><i>UPDATING</i>-The table
 * is being updated, as the result of an <i>UpdateTable</i> operation.
 * </li> <li> <p><i>DELETING</i>-The table is being deleted, as the
 * result of a <i>DeleteTable</i> operation. </li> <li>
 * <p><i>ACTIVE</i>-The table is ready for use. </li> </ul>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>CREATING, UPDATING, DELETING, ACTIVE
 */
@property (nonatomic, retain) NSString *tableStatus;

/**
 * Represents the date and time when the table was created, in <a
 * href="http://www.epochconverter.com/">UNIX epoch time</a> format.
 */
@property (nonatomic, retain) NSDate *creationDateTime;

/**
 * Represents the provisioned throughput settings for the table,
 * consisting of read and write capacity units, along with data about
 * increases and decreases.
 */
@property (nonatomic, retain) DynamoDBProvisionedThroughputDescription *provisionedThroughput;

/**
 * Represents the total size of the specified table, in bytes. Amazon
 * DynamoDB updates this value approximately every six hours. Recent
 * changes might not be reflected in this value.
 */
@property (nonatomic, retain) NSNumber *tableSizeBytes;

/**
 * Represents the number of items in the specified table. Amazon DynamoDB
 * updates this value approximately every six hours. Recent changes might
 * not be reflected in this value.
 */
@property (nonatomic, retain) NSNumber *itemCount;

/**
 * Represents one or more secondary indexes on the table. Each index is
 * scoped to a given hash key value. Tables with one or more local
 * secondary indexes are subject to an item collection size limit, where
 * the amount of data within a given item collection cannot exceed 10 GB.
 * Each element is composed of: <ul> <li> <p><i>IndexName</i>-The name of
 * the secondary index. </li> <li> <p><i>KeySchema</i>-Specifies the
 * complete index key schema. The attribute names in the key schema must
 * be between 1 and 255 characters (inclusive). The key schema must begin
 * with the same hash key attribute as the table. </li> <li>
 * <p><i>Projection</i>-Specifies attributes that are copied (projected)
 * from the table into the index. These are in addition to the primary
 * key attributes and index key attributes, which are automatically
 * projected. Each attribute specification is composed of: <ul> <li>
 * <p><i>ProjectionType</i>-One of the following: <ul> <li>
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
 * <li> <p><i>IndexSizeBytes</i>-Represents the total size of the index,
 * in bytes. Amazon DynamoDB updates this value approximately every six
 * hours. Recent changes might not be reflected in this value.</li> <li>
 * <p><i>ItemCount</i>-Represents the number of items in the index.
 * Amazon DynamoDB updates this value approximately every six hours.
 * Recent changes might not be reflected in this value. </li> </ul> <p>If
 * the table is in the <code>DELETING</code> state, no information about
 * indexes will be returned.
 */
@property (nonatomic, retain) NSMutableArray *localSecondaryIndexes;


/**
 * Default constructor for a new TableDescription object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

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
-(void)addLocalSecondaryIndexe:(DynamoDBLocalSecondaryIndexDescription *)localSecondaryIndexeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
