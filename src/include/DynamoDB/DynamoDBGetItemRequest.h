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

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Get Item Request
 */

@interface DynamoDBGetItemRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSMutableDictionary *key;
    NSMutableArray      *attributesToGet;
    bool                consistentRead;
    bool                consistentReadIsSet;
    NSString            *returnConsumedCapacity;
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
 * The value of the Key property for this object.
 */
@property (nonatomic, retain) NSMutableDictionary *key;

/**
 * The value of the AttributesToGet property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *attributesToGet;

/**
 * The value of the ConsistentRead property for this object.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;

/**
 * The value of the ReturnConsumedCapacity property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>TOTAL, NONE
 */
@property (nonatomic, retain) NSString *returnConsumedCapacity;


/**
 * Default constructor for a new GetItemRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new GetItemRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName
 * @param theKey
 */
-(id)initWithTableName:(NSString *)theTableName andKey:(NSMutableDictionary *)theKey;


/**
 * Set a value in the dictionary key for the specified key.
 * This function will alloc and init key if not already done.
 */
-(void)setKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey;

/**
 * Adds a single object to attributesToGet.
 * This function will alloc and init attributesToGet if not already done.
 */
-(void)addAttributesToGet:(NSString *)attributesToGetObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
