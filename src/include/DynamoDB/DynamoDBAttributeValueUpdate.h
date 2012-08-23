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

#import "DynamoDBAttributeValue.h"



/**
 * Attribute Value Update
 */

@interface DynamoDBAttributeValueUpdate:NSObject

{
    DynamoDBAttributeValue *value;
    NSString               *action;
}



/**
 * AttributeValue can be <code>String</code>, <code>Number</code>,
 * <code>Binary</code>, <code>StringSet</code>, <code>NumberSet</code>,
 * <code>BinarySet</code>.
 */
@property (nonatomic, retain) DynamoDBAttributeValue *value;

/**
 * The type of action for an item update operation. Only use the add
 * action for numbers or sets; the specified value is added to the
 * existing value. If a set of values is specified, the values are added
 * to the existing set. Adds the specified attribute. If the attribute
 * exists, it is replaced by the new value. If no value is specified,
 * this removes the attribute and its value. If a set of values is
 * specified, then the values in the specified set are removed from the
 * old set.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>ADD, PUT, DELETE
 */
@property (nonatomic, retain) NSString *action;


/**
 * Default constructor for a new AttributeValueUpdate object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new AttributeValueUpdate object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theValue AttributeValue can be <code>String</code>,
 * <code>Number</code>, <code>Binary</code>, <code>StringSet</code>,
 * <code>NumberSet</code>, <code>BinarySet</code>.
 * @param theAction The type of action for an item update operation. Only
 * use the add action for numbers or sets; the specified value is added
 * to the existing value. If a set of values is specified, the values are
 * added to the existing set. Adds the specified attribute. If the
 * attribute exists, it is replaced by the new value. If no value is
 * specified, this removes the attribute and its value. If a set of
 * values is specified, then the values in the specified set are removed
 * from the old set.
 */
-(id)initWithValue:(DynamoDBAttributeValue *)theValue andAction:(NSString *)theAction;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
