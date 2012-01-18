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
#import "DynamoDBExpectedAttributeValue.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Put Item Request
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBPutItemRequest:AmazonServiceRequestConfig

{
    NSString            *tableName;
    NSMutableDictionary *item;
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
 * A map of the attributes for the item, and must include the primary key
 * values that define the item. Other attribute name-value pairs can be
 * provided for the item.
 */
@property (nonatomic, retain) NSMutableDictionary *item;

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
 * Default constructor for a new PutItemRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new PutItemRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName
 * @param theItem A map of the attributes for the item, and must include
 * the primary key values that define the item. Other attribute
 * name-value pairs can be provided for the item.
 */
-(id)initWithTableName:(NSString *)theTableName andItem:(NSMutableDictionary *)theItem;


/**
 * Set a value in the dictionary item for the specified key.
 * This function will alloc and init item if not already done.
 */
-(void)setItemValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey;


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
