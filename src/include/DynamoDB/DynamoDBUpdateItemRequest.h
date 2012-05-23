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
 * The name of the table in which you want to update an item. Allowed
 * characters are <code>a-z</code>, <code>A-Z</code>, <code>0-9</code>,
 * <code>_</code> (underscore), <code>-</code> (hyphen) and
 * <code>.</code> (period).
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
 * Designates an attribute for a conditional modification. The
 * <code>Expected</code> parameter allows you to provide an attribute
 * name, and whether or not Amazon DynamoDB should check to see if the
 * attribute has a particular value before modifying it.
 */
@property (nonatomic, retain) NSMutableDictionary *expected;

/**
 * Use this parameter if you want to get the attribute name-value pairs
 * before or after they are modified. For <code>PUT</code> operations,
 * the possible parameter values are <code>NONE</code> (default) or
 * <code>ALL_OLD</code>. For update operations, the possible parameter
 * values are <code>NONE</code> (default) or <code>ALL_OLD</code>,
 * <code>UPDATED_OLD</code>, <code>ALL_NEW</code> or
 * <code>UPDATED_NEW</code>. <ul> <li><code>NONE</code>: Nothing is
 * returned.</li> <li><code>ALL_OLD</code>: Returns the attributes of the
 * item as they were before the operation.</li>
 * <li><code>UPDATED_OLD</code>: Returns the values of the updated
 * attributes, only, as they were before the operation.</li>
 * <li><code>ALL_NEW</code>: Returns all the attributes and their new
 * values after the operation.</li> <li><code>UPDATED_NEW</code>: Returns
 * the values of the updated attributes, only, as they are after the
 * operation.</li> </ul>
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
 * @param theTableName The name of the table in which you want to update
 * an item. Allowed characters are <code>a-z</code>, <code>A-Z</code>,
 * <code>0-9</code>, <code>_</code> (underscore), <code>-</code> (hyphen)
 * and <code>.</code> (period).
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
