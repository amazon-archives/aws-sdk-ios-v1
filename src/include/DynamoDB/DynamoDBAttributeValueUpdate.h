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
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBAttributeValueUpdate:NSObject

{
    DynamoDBAttributeValue *value;
    NSString               *action;
}



/**
 * AttributeValue can be String, Number, StringSet, NumberSet. Strings
 * are Unicode with UTF8 binary encoding. The maximum size is limited by
 * the size of the primary key (1024 bytes as a range part of a key or
 * 2048 bytes as a single part hash key) or the item size (64 K). Numbers
 * are positive or negative exact-value decimals and integers. A number
 * can have up to 38 digits precision and can be between 10^-128 to
 * 10^+126. An array of Strings. Strings are Unicode with UTF8 binary
 * encoding. The maximum size is limited by the size of the primary key
 * (1024 bytes as a range part of a key or 2048 bytes as a single part
 * hash key) or the item size (64 K). An array of Numbers. Numbers are
 * positive or negative exact-value decimals and integers. A number can
 * have up to 38 digits precision and can be between 10^-128 to 10^+126.
 */
@property (nonatomic, retain) DynamoDBAttributeValue *value;

/**
 * The value of the Action property for this object.
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
 * @param theValue AttributeValue can be String, Number, StringSet,
 * NumberSet. Strings are Unicode with UTF8 binary encoding. The maximum
 * size is limited by the size of the primary key (1024 bytes as a range
 * part of a key or 2048 bytes as a single part hash key) or the item
 * size (64 K). Numbers are positive or negative exact-value decimals and
 * integers. A number can have up to 38 digits precision and can be
 * between 10^-128 to 10^+126. An array of Strings. Strings are Unicode
 * with UTF8 binary encoding. The maximum size is limited by the size of
 * the primary key (1024 bytes as a range part of a key or 2048 bytes as
 * a single part hash key) or the item size (64 K). An array of Numbers.
 * Numbers are positive or negative exact-value decimals and integers. A
 * number can have up to 38 digits precision and can be between 10^-128
 * to 10^+126.
 * @param theAction
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
