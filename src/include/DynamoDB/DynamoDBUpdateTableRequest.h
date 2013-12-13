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

#import "DynamoDBProvisionedThroughput.h"
#import "DynamoDBGlobalSecondaryIndexUpdate.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Update Table Request
 */

@interface DynamoDBUpdateTableRequest:AmazonServiceRequestConfig

{
    NSString                      *tableName;
    DynamoDBProvisionedThroughput *provisionedThroughput;
    NSMutableArray                *globalSecondaryIndexUpdates;
}



/**
 * The name of the table to be updated.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * Represents the provisioned throughput settings for a specified table
 * or index. The settings can be modified using the <i>UpdateTable</i>
 * operation. <p>For current minimum and maximum provisioned throughput
 * values, see <a
 * mazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
 * in the Amazon DynamoDB Developer Guide.
 */
@property (nonatomic, retain) DynamoDBProvisionedThroughput *provisionedThroughput;

/**
 * An array of one or more global secondary indexes on the table,
 * together with provisioned throughput settings for each index.
 */
@property (nonatomic, retain) NSMutableArray *globalSecondaryIndexUpdates;


/**
 * Default constructor for a new UpdateTableRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new UpdateTableRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table to be updated.
 * @param theProvisionedThroughput Represents the provisioned throughput
 * settings for a specified table or index. The settings can be modified
 * using the <i>UpdateTable</i> operation. <p>For current minimum and
 * maximum provisioned throughput values, see <a
 * mazon.com/amazondynamodb/latest/developerguide/Limits.html">Limits</a>
 * in the Amazon DynamoDB Developer Guide.
 */
-(id)initWithTableName:(NSString *)theTableName andProvisionedThroughput:(DynamoDBProvisionedThroughput *)theProvisionedThroughput;

/**
 * Adds a single object to globalSecondaryIndexUpdates.
 * This function will alloc and init globalSecondaryIndexUpdates if not already done.
 */
-(void)addGlobalSecondaryIndexUpdate:(DynamoDBGlobalSecondaryIndexUpdate *)globalSecondaryIndexUpdateObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
