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
 * The value of the AttributeDefinitions property for this object.
 */
@property (nonatomic, retain) NSMutableArray *attributeDefinitions;

/**
 * The value of the TableName property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * The value of the KeySchema property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 2<br/>
 */
@property (nonatomic, retain) NSMutableArray *keySchema;

/**
 * The value of the LocalSecondaryIndexes property for this object.
 */
@property (nonatomic, retain) NSMutableArray *localSecondaryIndexes;

/**
 * The value of the ProvisionedThroughput property for this object.
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
 * @param theKeySchema
 */
-(id)initWithTableName:(NSString *)theTableName andKeySchema:(NSMutableArray *)theKeySchema;

/**
 * Constructs a new CreateTableRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName
 * @param theKeySchema
 * @param theProvisionedThroughput
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
