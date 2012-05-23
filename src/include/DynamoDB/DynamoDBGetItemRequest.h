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

#import "../AmazonServiceRequestConfig.h"



/**
 * Get Item Request
 */

@interface DynamoDBGetItemRequest:AmazonServiceRequestConfig

{
    NSString       *tableName;
    DynamoDBKey    *key;
    NSMutableArray *attributesToGet;
    bool           consistentRead;
    bool           consistentReadIsSet;
}



/**
 * The name of the table in which you want to get an item. Allowed
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
 * List of <code>Attribute</code> names. If attribute names are not
 * specified then all attributes will be returned. If some attributes are
 * not found, they will not appear in the result.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *attributesToGet;

/**
 * If set to <code>true</code>, then a consistent read is issued.
 * Otherwise eventually-consistent is used.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;


/**
 * Default constructor for a new GetItemRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new GetItemRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTableName The name of the table in which you want to get an
 * item. Allowed characters are <code>a-z</code>, <code>A-Z</code>,
 * <code>0-9</code>, <code>_</code> (underscore), <code>-</code> (hyphen)
 * and <code>.</code> (period).
 * @param theKey The primary key that uniquely identifies each item in a
 * table. A primary key can be a one attribute (hash) primary key or a
 * two attribute (hash-and-range) primary key.
 */
-(id)initWithTableName:(NSString *)theTableName andKey:(DynamoDBKey *)theKey;

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
