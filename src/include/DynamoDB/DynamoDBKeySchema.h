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
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBKeySchema:NSObject

{
    DynamoDBKeySchemaElement *hashKeyElement;
    DynamoDBKeySchemaElement *rangeKeyElement;
}



/**
 * The value of the HashKeyElement property for this object.
 */
@property (nonatomic, retain) DynamoDBKeySchemaElement *hashKeyElement;

/**
 * The value of the RangeKeyElement property for this object.
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
 * @param theHashKeyElement
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
