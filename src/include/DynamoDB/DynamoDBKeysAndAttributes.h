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



/**
 * Keys And Attributes
 */

@interface DynamoDBKeysAndAttributes:NSObject

{
    NSMutableArray *keys;
    NSMutableArray *attributesToGet;
    bool           consistentRead;
    bool           consistentReadIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Keys property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSMutableArray *keys;

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
 * Adds a single object to keys.
 * This function will alloc and init keys if not already done.
 */
-(void)addKey:(DynamoDBKey *)keyObject;

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
