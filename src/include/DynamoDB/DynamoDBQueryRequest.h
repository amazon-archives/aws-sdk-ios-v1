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

#import "DynamoDBCondition.h"
#import "DynamoDBAttributeValue.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Query Request
 */

@interface DynamoDBQueryRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSString            *indexName;
    NSString            *select;
    NSMutableArray      *attributesToGet;
    NSNumber            *limit;
    bool                consistentRead;
    bool                consistentReadIsSet;
    NSMutableDictionary *keyConditions;
    bool                scanIndexForward;
    bool                scanIndexForwardIsSet;
    NSMutableDictionary *exclusiveStartKey;
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
 * The value of the IndexName property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *indexName;

/**
 * The value of the Select property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ALL_ATTRIBUTES, ALL_PROJECTED_ATTRIBUTES, SPECIFIC_ATTRIBUTES, COUNT
 */
@property (nonatomic, retain) NSString *select;

/**
 * The value of the AttributesToGet property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *attributesToGet;

/**
 * The value of the Limit property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, retain) NSNumber *limit;

/**
 * The value of the ConsistentRead property for this object.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;

/**
 * The value of the KeyConditions property for this object.
 */
@property (nonatomic, retain) NSMutableDictionary *keyConditions;

/**
 * The value of the ScanIndexForward property for this object.
 */
@property (nonatomic) bool           scanIndexForward;

@property (nonatomic, readonly) bool scanIndexForwardIsSet;

/**
 * The value of the ExclusiveStartKey property for this object.
 */
@property (nonatomic, retain) NSMutableDictionary *exclusiveStartKey;

/**
 * The value of the ReturnConsumedCapacity property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>TOTAL, NONE
 */
@property (nonatomic, retain) NSString *returnConsumedCapacity;


/**
 * Default constructor for a new QueryRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new QueryRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName
 */
-(id)initWithTableName:(NSString *)theTableName;

/**
 * Adds a single object to attributesToGet.
 * This function will alloc and init attributesToGet if not already done.
 */
-(void)addAttributesToGet:(NSString *)attributesToGetObject;


/**
 * Set a value in the dictionary keyConditions for the specified key.
 * This function will alloc and init keyConditions if not already done.
 */
-(void)setKeyConditionsValue:(DynamoDBCondition *)theValue forKey:(NSString *)theKey;


/**
 * Set a value in the dictionary exclusiveStartKey for the specified key.
 * This function will alloc and init exclusiveStartKey if not already done.
 */
-(void)setExclusiveStartKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
