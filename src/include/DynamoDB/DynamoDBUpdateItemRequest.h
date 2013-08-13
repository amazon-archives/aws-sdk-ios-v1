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
#import "DynamoDBAttributeValueUpdate.h"
#import "DynamoDBExpectedAttributeValue.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Update Item Request
 */

@interface DynamoDBUpdateItemRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSMutableDictionary *key;
    NSMutableDictionary *attributeUpdates;
    NSMutableDictionary *expected;
    NSString            *returnValues;
    NSString            *returnConsumedCapacity;
    NSString            *returnItemCollectionMetrics;
}



/**
 * The name of the table containing the item to update.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>3 - 255<br/>
 * <b>Pattern: </b>[a-zA-Z0-9_.-]+<br/>
 */
@property (nonatomic, retain) NSString *tableName;

/**
 * The primary key that defines the item. Each element consists of an
 * attribute name and a value for that attribute.
 */
@property (nonatomic, retain) NSMutableDictionary *key;

/**
 * The names of attributes to be modified, the action to perform on each,
 * and the new value for each. If you are updating an attribute that is
 * an index key attribute for any indexes on that table, the attribute
 * type must match the index key type defined in the
 * <i>AttributesDefinition</i> of the table description. You can use
 * <i>UpdateItem</i> to update any non-key attributes. <p>Attribute
 * values cannot be null. String and binary type attributes must have
 * lengths greater than zero. Set type attributes must not be empty.
 * Requests with empty values will be rejected with a
 * <i>ValidationException</i>. <p>Each <i>AttributeUpdates</i> element
 * consists of an attribute name to modify, along with the following:
 * <ul> <li> <p><i>Value</i>-the new value, if applicable, for this
 * attribute. </li> <li> <p><i>Action</i>-specifies how to perform the
 * update. Valid values for <i>Action</i> are <code>PUT</code>,
 * <code>DELETE</code>, and <code>ADD</code>. The behavior depends on
 * whether the specified primary key already exists in the table. <p>
 * <b>If an item with the specified <i>Key</i> is found in the table:</b>
 * <ul> <li> <p><code>PUT</code>-Adds the specified attribute to the
 * item. If the attribute already exists, it is replaced by the new
 * value. </li> <li> <p><code>DELETE</code>-If no value is specified, the
 * attribute and its value are removed from the item. The data type of
 * the specified value must match the existing value's data type. <p>If a
 * <i>set</i> of values is specified, then those values are subtracted
 * from the old set. For example, if the attribute value was the set
 * <code>[a,b,c]</code> and the <i>DELETE</i> action specified
 * <code>[a,c]</code>, then the final attribute value would be
 * <code>[b]</code>. Specifying an empty set is an error. </li> <li>
 * <p><code>ADD</code>-If the attribute does not already exist, then the
 * attribute and its values are added to the item. If the attribute does
 * exist, then the behavior of <code>ADD</code> depends on the data type
 * of the attribute: <ul> <li> <p>If the existing attribute is a number,
 * and if <i>Value</i> is also a number, then the <i>Value</i> is
 * mathematically added to the existing attribute. If <i>Value</i> is a
 * negative number, then it is subtracted from the existing attribute.
 * <note> <p> If you use <code>ADD</code> to increment or decrement a
 * number value for an item that doesn't exist before the update, Amazon
 * DynamoDB uses 0 as the initial value. <p>In addition, if you use
 * <code>ADD</code> to update an existing item, and intend to increment
 * or decrement an attribute value which does not yet exist, Amazon
 * DynamoDB uses <code>0</code> as the initial value. For example,
 * suppose that the item you want to update does not yet have an
 * attribute named <i>itemcount</i>, but you decide to <code>ADD</code>
 * the number <code>3</code> to this attribute anyway, even though it
 * currently does not exist. Amazon DynamoDB will create the
 * <i>itemcount</i> attribute, set its initial value to <code>0</code>,
 * and finally add <code>3</code> to it. The result will be a new
 * <i>itemcount</i> attribute in the item, with a value of
 * <code>3</code>. </note> </li> <li> <p>If the existing data type is a
 * set, and if the <i>Value</i> is also a set, then the <i>Value</i> is
 * added to the existing set. (This is a <i>set</i> operation, not
 * mathematical addition.) For example, if the attribute value was the
 * set <code>[1,2]</code>, and the <code>ADD</code> action specified
 * <code>[3]</code>, then the final attribute value would be
 * <code>[1,2,3]</code>. An error occurs if an Add action is specified
 * for a set attribute and the attribute type specified does not match
 * the existing set type. <p>Both sets must have the same primitive data
 * type. For example, if the existing data type is a set of strings, the
 * <i>Value</i> must also be a set of strings. The same holds true for
 * number sets and binary sets. </li> </ul> <p>This action is only valid
 * for an existing attribute whose data type is number or is a set. Do
 * not use <code>ADD</code> for any other data types. </li> </ul> <p>
 * <b>If no item with the specified <i>Key</i> is found:</b> <ul> <li>
 * <p><code>PUT</code>-Amazon DynamoDB creates a new item with the
 * specified primary key, and then adds the attribute. </li> <li>
 * <p><code>DELETE</code>-Nothing happens; there is no attribute to
 * delete. </li> <li> <p><code>ADD</code>-Amazon DynamoDB creates an item
 * with the supplied primary key and number (or set of numbers) for the
 * attribute value. The only data types allowed are number and number
 * set; no other data types can be specified. </li> </ul> </li> </ul>
 * <p>If you specify any attributes that are part of an index key, then
 * the data types for those attributes must match those of the schema in
 * the table's attribute definition.
 */
@property (nonatomic, retain) NSMutableDictionary *attributeUpdates;

/**
 * A map of attribute/condition pairs. This is the conditional block for
 * the <i>UpdateItem</i> operation. All the conditions must be met for
 * the operation to succeed. <p><i>Expected</i> allows you to provide an
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
 * appeared either before or after they were updated. For
 * <i>UpdateItem</i>, the valid values are: <ul> <li>
 * <p><code>NONE</code>-(default) If <i>ReturnValues</i> is not
 * specified, or if its value is <code>NONE</code>, then nothing is
 * returned. </li> <li> <p><code>ALL_OLD</code>-If <i>UpdateItem</i>
 * overwrote an attribute name-value pair, then the content of the old
 * item is returned. </li> <li> <p><code>UPDATED_OLD</code>-The old
 * versions of only the updated attributes are returned. </li> <li>
 * <p><code>ALL_NEW</code>-All of the attributes of the new version of
 * the item are returned. </li> <li> <p><code>UPDATED_NEW</code>-The new
 * versions of only the updated attributes are returned. </li> </ul>
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
 * Default constructor for a new UpdateItemRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new UpdateItemRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table containing the item to
 * update.
 * @param theKey The primary key that defines the item. Each element
 * consists of an attribute name and a value for that attribute.
 * @param theAttributeUpdates The names of attributes to be modified, the
 * action to perform on each, and the new value for each. If you are
 * updating an attribute that is an index key attribute for any indexes
 * on that table, the attribute type must match the index key type
 * defined in the <i>AttributesDefinition</i> of the table description.
 * You can use <i>UpdateItem</i> to update any non-key attributes.
 * <p>Attribute values cannot be null. String and binary type attributes
 * must have lengths greater than zero. Set type attributes must not be
 * empty. Requests with empty values will be rejected with a
 * <i>ValidationException</i>. <p>Each <i>AttributeUpdates</i> element
 * consists of an attribute name to modify, along with the following:
 * <ul> <li> <p><i>Value</i>-the new value, if applicable, for this
 * attribute. </li> <li> <p><i>Action</i>-specifies how to perform the
 * update. Valid values for <i>Action</i> are <code>PUT</code>,
 * <code>DELETE</code>, and <code>ADD</code>. The behavior depends on
 * whether the specified primary key already exists in the table. <p>
 * <b>If an item with the specified <i>Key</i> is found in the table:</b>
 * <ul> <li> <p><code>PUT</code>-Adds the specified attribute to the
 * item. If the attribute already exists, it is replaced by the new
 * value. </li> <li> <p><code>DELETE</code>-If no value is specified, the
 * attribute and its value are removed from the item. The data type of
 * the specified value must match the existing value's data type. <p>If a
 * <i>set</i> of values is specified, then those values are subtracted
 * from the old set. For example, if the attribute value was the set
 * <code>[a,b,c]</code> and the <i>DELETE</i> action specified
 * <code>[a,c]</code>, then the final attribute value would be
 * <code>[b]</code>. Specifying an empty set is an error. </li> <li>
 * <p><code>ADD</code>-If the attribute does not already exist, then the
 * attribute and its values are added to the item. If the attribute does
 * exist, then the behavior of <code>ADD</code> depends on the data type
 * of the attribute: <ul> <li> <p>If the existing attribute is a number,
 * and if <i>Value</i> is also a number, then the <i>Value</i> is
 * mathematically added to the existing attribute. If <i>Value</i> is a
 * negative number, then it is subtracted from the existing attribute.
 * <note> <p> If you use <code>ADD</code> to increment or decrement a
 * number value for an item that doesn't exist before the update, Amazon
 * DynamoDB uses 0 as the initial value. <p>In addition, if you use
 * <code>ADD</code> to update an existing item, and intend to increment
 * or decrement an attribute value which does not yet exist, Amazon
 * DynamoDB uses <code>0</code> as the initial value. For example,
 * suppose that the item you want to update does not yet have an
 * attribute named <i>itemcount</i>, but you decide to <code>ADD</code>
 * the number <code>3</code> to this attribute anyway, even though it
 * currently does not exist. Amazon DynamoDB will create the
 * <i>itemcount</i> attribute, set its initial value to <code>0</code>,
 * and finally add <code>3</code> to it. The result will be a new
 * <i>itemcount</i> attribute in the item, with a value of
 * <code>3</code>. </note> </li> <li> <p>If the existing data type is a
 * set, and if the <i>Value</i> is also a set, then the <i>Value</i> is
 * added to the existing set. (This is a <i>set</i> operation, not
 * mathematical addition.) For example, if the attribute value was the
 * set <code>[1,2]</code>, and the <code>ADD</code> action specified
 * <code>[3]</code>, then the final attribute value would be
 * <code>[1,2,3]</code>. An error occurs if an Add action is specified
 * for a set attribute and the attribute type specified does not match
 * the existing set type. <p>Both sets must have the same primitive data
 * type. For example, if the existing data type is a set of strings, the
 * <i>Value</i> must also be a set of strings. The same holds true for
 * number sets and binary sets. </li> </ul> <p>This action is only valid
 * for an existing attribute whose data type is number or is a set. Do
 * not use <code>ADD</code> for any other data types. </li> </ul> <p>
 * <b>If no item with the specified <i>Key</i> is found:</b> <ul> <li>
 * <p><code>PUT</code>-Amazon DynamoDB creates a new item with the
 * specified primary key, and then adds the attribute. </li> <li>
 * <p><code>DELETE</code>-Nothing happens; there is no attribute to
 * delete. </li> <li> <p><code>ADD</code>-Amazon DynamoDB creates an item
 * with the supplied primary key and number (or set of numbers) for the
 * attribute value. The only data types allowed are number and number
 * set; no other data types can be specified. </li> </ul> </li> </ul>
 * <p>If you specify any attributes that are part of an index key, then
 * the data types for those attributes must match those of the schema in
 * the table's attribute definition.
 */
-(id)initWithTableName:(NSString *)theTableName andKey:(NSMutableDictionary *)theKey andAttributeUpdates:(NSMutableDictionary *)theAttributeUpdates;


/**
 * Set a value in the dictionary key for the specified key.
 * This function will alloc and init key if not already done.
 */
-(void)setKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey;


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
