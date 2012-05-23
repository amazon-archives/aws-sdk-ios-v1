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
#import "DynamoDBProvisionedThroughputDescription.h"



/**
 * Table Description
 */

@interface DynamoDBTableDescription:NSObject

{
    NSString                                 *tableName;
    DynamoDBKeySchema                        *keySchema;
    NSString                                 *tableStatus;
    NSDate                                   *creationDateTime;
    DynamoDBProvisionedThroughputDescription *provisionedThroughput;
    NSNumber                                 *tableSizeBytes;
    NSNumber                                 *itemCount;
}



/**
 * The name of the table being described.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * The KeySchema identifies the primary key as a one attribute primary
 * key (hash) or a composite two attribute (hash-and-range) primary key.
 * Single attribute primary keys have one index value: a
 * <code>HashKeyElement</code>. A composite hash-and-range primary key
 * contains two attribute values: a <code>HashKeyElement</code> and a
 * <code>RangeKeyElement</code>.
 */
@property (nonatomic, retain) DynamoDBKeySchema *keySchema;

/**
 * The value of the TableStatus property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>CREATING, UPDATING, DELETING, ACTIVE
 */
@property (nonatomic, retain) NSString *tableStatus;

/**
 * The value of the CreationDateTime property for this object.
 */
@property (nonatomic, retain) NSDate *creationDateTime;

/**
 * The value of the ProvisionedThroughput property for this object.
 */
@property (nonatomic, retain) DynamoDBProvisionedThroughputDescription *provisionedThroughput;

/**
 * The value of the TableSizeBytes property for this object.
 */
@property (nonatomic, retain) NSNumber *tableSizeBytes;

/**
 * The value of the ItemCount property for this object.
 */
@property (nonatomic, retain) NSNumber *itemCount;


/**
 * Default constructor for a new TableDescription object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
