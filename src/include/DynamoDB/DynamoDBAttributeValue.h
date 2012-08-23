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

#import "../AmazonSDKUtil.h"



/**
 * Attribute Value
 */

@interface DynamoDBAttributeValue:NSObject

{
    NSString       *s;
    NSString       *n;
    NSData         *b;
    NSMutableArray *sS;
    NSMutableArray *nS;
    NSMutableArray *bS;
}



/**
 * Strings are Unicode with UTF-8 binary encoding. The maximum size is
 * limited by the size of the primary key (1024 bytes as a range part of
 * a key or 2048 bytes as a single part hash key) or the item size (64k).
 */
@property (nonatomic, retain) NSString *s;

/**
 * Numbers are positive or negative exact-value decimals and integers. A
 * number can have up to 38 digits precision and can be between 10^-128
 * to 10^+126.
 */
@property (nonatomic, retain) NSString *n;

/**
 * Binary attributes are sequences of unsigned bytes.
 */
@property (nonatomic, retain) NSData *b;

/**
 * A set of strings.
 */
@property (nonatomic, retain) NSMutableArray *sS;

/**
 * A set of numbers.
 */
@property (nonatomic, retain) NSMutableArray *nS;

/**
 * A set of binary attributes.
 */
@property (nonatomic, retain) NSMutableArray *bS;


/**
 * Default constructor for a new AttributeValue object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theS Strings are Unicode with UTF-8 binary encoding. The
 * maximum size is limited by the size of the primary key (1024 bytes as
 * a range part of a key or 2048 bytes as a single part hash key) or the
 * item size (64k).
 */
-(id)initWithS:(NSString *)theS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSS A set of strings.
 */
-(id)initWithSS:(NSMutableArray *)theSS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theN Numbers are positive or negative exact-value decimals and
 * integers. A number can have up to 38 digits precision and can be
 * between 10^-128 to 10^+126.
 */
-(id)initWithN:(NSString *)theN;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theNS A set of numbers.
 */
-(id)initWithNS:(NSMutableArray *)theNS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theB Binary attributes are sequences of unsigned bytes.
 */
-(id)initWithB:(NSData *)theB;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theBS A set of binary attributes.
 */
-(id)initWithBS:(NSMutableArray *)theBS;

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
 * Adds a single object to bS.
 * This function will alloc and init bS if not already done.
 */
-(void)addBS:(NSData *)bSObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
