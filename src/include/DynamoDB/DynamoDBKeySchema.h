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

#import "DynamoDBKeySchemaElement.h"
#import "DynamoDBKeySchemaElement.h"



/**
 * Key Schema
 */

@interface DynamoDBKeySchema:NSObject

{
    DynamoDBKeySchemaElement *hashKeyElement;
    DynamoDBKeySchemaElement *rangeKeyElement;
}



/**
 * A hash key element is treated as the primary key, and can be a string
 * or a number. Single attribute primary keys have one index value. The
 * value can be <code>String</code>, <code>Number</code>,
 * <code>StringSet</code>, <code>NumberSet</code>.
 */
@property (nonatomic, retain) DynamoDBKeySchemaElement *hashKeyElement;

/**
 * A range key element is treated as a secondary key (used in conjunction
 * with the primary key), and can be a string or a number, and is only
 * used for hash-and-range primary keys. The value can be
 * <code>String</code>, <code>Number</code>, <code>StringSet</code>,
 * <code>NumberSet</code>.
 */
@property (nonatomic, retain) DynamoDBKeySchemaElement *rangeKeyElement;


/**
 * Default constructor for a new KeySchema object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new KeySchema object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theHashKeyElement A hash key element is treated as the primary
 * key, and can be a string or a number. Single attribute primary keys
 * have one index value. The value can be <code>String</code>,
 * <code>Number</code>, <code>StringSet</code>, <code>NumberSet</code>.
 */
-(id)initWithHashKeyElement:(DynamoDBKeySchemaElement *)theHashKeyElement;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
