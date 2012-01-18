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

#import "DynamoDBKey.h"
#import "DynamoDBAttributeValueUpdate.h"
#import "DynamoDBExpectedAttributeValue.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Update Item Request
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBUpdateItemRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    DynamoDBKey         *key;
    NSMutableDictionary *attributeUpdates;
    NSMutableDictionary *expected;
    NSString            *returnValues;
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
 * The primary key that uniquely identifies each item in a table. A
 * primary key can be a one attribute (hash) primary key or a two
 * attribute (hash-and-range) primary key.
 */
@property (nonatomic, retain) DynamoDBKey *key;

/**
 * Map of attribute name to the new value and action for the update. The
 * attribute names specify the attributes to modify, and cannot contain
 * any primary key attributes.
 */
@property (nonatomic, retain) NSMutableDictionary *attributeUpdates;

/**
 * Designates an attribute for a conditional modification. The Expected
 * parameter allows you to provide an attribute name, and whether or not
 * Amazon DynamoDB should check to see if the attribute has a particular
 * value before modifying it.
 */
@property (nonatomic, retain) NSMutableDictionary *expected;

/**
 * Use this parameter if you want to get the attribute name-value pairs
 * before they were modified. Possible parameter values are NONE
 * (default) or ALL_OLD. If ALL_OLD is specified, the content of the old
 * item is returned. If this parameter is not provided or is NONE,
 * nothing is returned.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>NONE, ALL_OLD, UPDATED_OLD, ALL_NEW, UPDATED_NEW
 */
@property (nonatomic, retain) NSString *returnValues;


/**
 * Default constructor for a new UpdateItemRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new UpdateItemRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName
 * @param theKey The primary key that uniquely identifies each item in a
 * table. A primary key can be a one attribute (hash) primary key or a
 * two attribute (hash-and-range) primary key.
 * @param theAttributeUpdates Map of attribute name to the new value and
 * action for the update. The attribute names specify the attributes to
 * modify, and cannot contain any primary key attributes.
 */
-(id)initWithTableName:(NSString *)theTableName andKey:(DynamoDBKey *)theKey andAttributeUpdates:(NSMutableDictionary *)theAttributeUpdates;


/**
 * Set a value in the dictionary attributeUpdates for the specified key.
 * This function will alloc and init attributeUpdates if not already done.
 */
-(void)setAttributeUpdatesValue:(DynamoDBAttributeValueUpdate *)theValue forKey:(NSString *)theKey;


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
