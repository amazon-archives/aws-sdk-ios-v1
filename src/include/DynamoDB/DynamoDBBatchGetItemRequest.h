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

#import "DynamoDBKeysAndAttributes.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Batch Get Item Request
 */

@interface DynamoDBBatchGetItemRequest:AmazonServiceRequestConfig

{
    NSMutableDictionary *requestItems;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A map of the table name and corresponding items to get by primary key.
 * While requesting items, each table name can be invoked only once per
 * operation.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSMutableDictionary *requestItems;


/**
 * Set a value in the dictionary requestItems for the specified key.
 * This function will alloc and init requestItems if not already done.
 */
-(void)setRequestItemsValue:(DynamoDBKeysAndAttributes *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
