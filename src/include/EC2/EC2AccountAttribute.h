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

#import "EC2AccountAttributeValue.h"



/**
 * Account Attribute
 */

@interface EC2AccountAttribute:NSObject

{
    NSString       *attributeName;
    NSMutableArray *attributeValues;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the AttributeName property for this object.
 */
@property (nonatomic, retain) NSString *attributeName;

/**
 * The value of the AttributeValues property for this object.
 */
@property (nonatomic, retain) NSMutableArray *attributeValues;

/**
 * Adds a single object to attributeValues.
 * This function will alloc and init attributeValues if not already done.
 */
-(void)addAttributeValue:(EC2AccountAttributeValue *)attributeValueObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
