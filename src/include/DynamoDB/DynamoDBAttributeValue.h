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




/**
 * Attribute Value
 *
 * \ingroup DynamoDB
 */

@interface DynamoDBAttributeValue:NSObject

{
    NSString       *s;
    NSString       *n;
    NSMutableArray *sS;
    NSMutableArray *nS;
}



/**
 * AttributeValue can be String, Number, StringSet, NumberSet. Strings
 * are Unicode with UTF-8 binary encoding. The maximum size is limited by
 * the size of the primary key (1024 bytes as a range part of a key or
 * 2048 bytes as a single part hash key) or the item size (64k).
 */
@property (nonatomic, retain) NSString *s;

/**
 * AttributeValue can be String, Number, StringSet, NumberSet. Numbers
 * are positive or negative exact-value decimals and integers. A number
 * can have up to 38 digits precision and can be between 10^-128 to
 * 10^+126.
 */
@property (nonatomic, retain) NSString *n;

/**
 * AttributeValue can be String, Number, StringSet, NumberSet. A Set of
 * Strings.
 */
@property (nonatomic, retain) NSMutableArray *sS;

/**
 * AttributeValue can be String, Number, StringSet, NumberSet. A Set of
 * Numbers.
 */
@property (nonatomic, retain) NSMutableArray *nS;


/**
 * Default constructor for a new AttributeValue object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theS AttributeValue can be String, Number, StringSet,
 * NumberSet. Strings are Unicode with UTF-8 binary encoding. The maximum
 * size is limited by the size of the primary key (1024 bytes as a range
 * part of a key or 2048 bytes as a single part hash key) or the item
 * size (64k).
 */
-(id)initWithS:(NSString *)theS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSS AttributeValue can be String, Number, StringSet,
 * NumberSet. A Set of Strings.
 */
-(id)initWithSS:(NSMutableArray *)theSS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theN AttributeValue can be String, Number, StringSet,
 * NumberSet. Numbers are positive or negative exact-value decimals and
 * integers. A number can have up to 38 digits precision and can be
 * between 10^-128 to 10^+126.
 */
-(id)initWithN:(NSString *)theN;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theNS AttributeValue can be String, Number, StringSet,
 * NumberSet. A Set of Numbers.
 */
-(id)initWithNS:(NSMutableArray *)theNS;

/**
 * Adds a single object to sS.
 * This function will alloc and init sS if not already done.
 */
-(void)addSS:(NSString *)sSObject;

/**
 * Adds a single object to nS.
 * This function will alloc and init nS if not already done.
 */
-(void)addNS:(NSString *)nSObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
