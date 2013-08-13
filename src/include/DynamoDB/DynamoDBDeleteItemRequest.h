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
#import "DynamoDBExpectedAttributeValue.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Delete Item Request
 */

@interface DynamoDBDeleteItemRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSMutableDictionary *key;
    NSMutableDictionary *expected;
    NSString            *returnValues;
    NSString            *returnConsumedCapacity;
    NSString            *returnItemCollectionMetrics;
}



/**
 * The name of the table from which to delete the item.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * A map of attribute names to <i>AttributeValue</i> objects,
 * representing the primary key of the item to delete.
 */
@property (nonatomic, retain) NSMutableDictionary *key;

/**
 * A map of attribute/condition pairs. This is the conditional block for
 * the <i>DeleteItem</i>operation. All the conditions must be met for the
 * operation to succeed. <p><i>Expected</i> allows you to provide an
 * attribute name, and whether or not Amazon DynamoDB should check to see
 * if the attribute value already exists; or if the attribute value
 * exists and has a particular value before changing it. <p>Each item in
 * <i>Expected</i> represents an attribute name for Amazon DynamoDB to
 * check, along with the following: <ul> <li> <p><i>Value</i>-the
 * attribute value for Amazon DynamoDB to check. </li> <li>
 * <p><i>Exists</i>-causes Amazon DynamoDB to evaluate the value before
 * attempting a conditional operation: <ul> <li> <p>If <i>Exists</i> is
 * <code>true</code>, Amazon DynamoDB will check to see if that attribute
 * value already exists in the table. If it is found, then the operation
 * succeeds. If it is not found, the operation fails with a
 * <i>ConditionalCheckFailedException</i>. </li> <li> <p>If <i>Exists</i>
 * is <code>false</code>, Amazon DynamoDB assumes that the attribute
 * value does <i>not</i> exist in the table. If in fact the value does
 * not exist, then the assumption is valid and the operation succeeds. If
 * the value is found, despite the assumption that it does not exist, the
 * operation fails with a <i>ConditionalCheckFailedException</i>. </li>
 * </ul> <p>The default setting for <i>Exists</i> is <code>true</code>.
 * If you supply a <i>Value</i> all by itself, Amazon DynamoDB assumes
 * the attribute exists: You don't have to set <i>Exists</i> to
 * <code>true</code>, because it is implied. <p>Amazon DynamoDB returns a
 * <i>ValidationException</i> if: <ul> <li> <p><i>Exists</i> is
 * <code>true</code> but there is no <i>Value</i> to check. (You expect a
 * value to exist, but don't specify what that value is.) </li> <li>
 * <p><i>Exists</i> is <code>false</code> but you also specify a
 * <i>Value</i>. (You cannot expect an attribute to have a value, while
 * also expecting it not to exist.) </li> </ul> </li> </ul> <p>If you
 * specify more than one condition for <i>Exists</i>, then all of the
 * conditions must evaluate to true. (In other words, the conditions are
 * ANDed together.) Otherwise, the conditional operation will fail.
 */
@property (nonatomic, retain) NSMutableDictionary *expected;

/**
 * Use <i>ReturnValues</i> if you want to get the item attributes as they
 * appeared before they were deleted. For <i>DeleteItem</i>, the valid
 * values are: <ul> <li> <p><code>NONE</code>-(default) If
 * <i>ReturnValues</i> is not specified, or if its value is
 * <code>NONE</code>, then nothing is returned. </li> <li>
 * <p><code>ALL_OLD</code>-The content of the old item is returned. </li>
 * </ul>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW
 */
@property (nonatomic, retain) NSString *returnValues;

/**
 * Determines whether to include consumed capacity information in the
 * output. If this is set to <code>TOTAL</code>, then this information is
 * shown in the output; otherwise, the consumed capacity information is
 * not shown.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>TOTAL, NONE
 */
@property (nonatomic, retain) NSString *returnConsumedCapacity;

/**
 * Indicates whether to return statistics about item collections, if any,
 * that were modified during the operation. The default for
 * <i>ReturnItemCollectionMetrics</i> is <code>NONE</code>, meaning that
 * no statistics will be returned. To obtain the statistics, set
 * <i>ReturnItemCollectionMetrics</i> to <code>SIZE</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>SIZE, NONE
 */
@property (nonatomic, retain) NSString *returnItemCollectionMetrics;


/**
 * Default constructor for a new DeleteItemRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeleteItemRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table from which to delete the
 * item.
 * @param theKey A map of attribute names to <i>AttributeValue</i>
 * objects, representing the primary key of the item to delete.
 */
-(id)initWithTableName:(NSString *)theTableName andKey:(NSMutableDictionary *)theKey;


/**
 * Set a value in the dictionary key for the specified key.
 * This function will alloc and init key if not already done.
 */
-(void)setKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey;


/**
 * Set a value in the dictionary expected for the specified key.
 * This function will alloc and init expected if not already done.
 */
-(void)setExpectedValue:(DynamoDBExpectedAttributeValue *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
