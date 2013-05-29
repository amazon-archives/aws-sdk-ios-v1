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



/**
 * Expected Attribute Value
 */

@interface DynamoDBExpectedAttributeValue:NSObject

{
    DynamoDBAttributeValue *value;
    bool                   exists;
    bool                   existsIsSet;
}



/**
 * Represents the data for an attribute. You can set one, and only one,
 * of the elements.
 */
@property (nonatomic, retain) DynamoDBAttributeValue *value;

/**
 * Causes Amazon DynamoDB to evaluate the value before attempting a
 * conditional operation: <ul> <li> <p>If <i>Exists</i> is
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
 * also expecting it not to exist.) </li> </ul> <p>If you specify more
 * than one condition for <i>Exists</i>, then all of the conditions must
 * evaluate to true. (In other words, the conditions are ANDed together.)
 * Otherwise, the conditional operation will fail.
 */
@property (nonatomic) bool           exists;

@property (nonatomic, readonly) bool existsIsSet;


/**
 * Default constructor for a new ExpectedAttributeValue object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ExpectedAttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theValue Represents the data for an attribute. You can set one,
 * and only one, of the elements.
 */
-(id)initWithValue:(DynamoDBAttributeValue *)theValue;

/**
 * Constructs a new ExpectedAttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theExists Causes Amazon DynamoDB to evaluate the value before
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
 * also expecting it not to exist.) </li> </ul> <p>If you specify more
 * than one condition for <i>Exists</i>, then all of the conditions must
 * evaluate to true. (In other words, the conditions are ANDed together.)
 * Otherwise, the conditional operation will fail.
 */
-(id)initWithExists:(bool)theExists;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
