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


#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonSDKUtil.h>
#else
#import "../AmazonSDKUtil.h"
#endif



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
 * The value of the S property for this object.
 */
@property (nonatomic, retain) NSString *s;

/**
 * The value of the N property for this object.
 */
@property (nonatomic, retain) NSString *n;

/**
 * The value of the B property for this object.
 */
@property (nonatomic, retain) NSData *b;

/**
 * The value of the SS property for this object.
 */
@property (nonatomic, retain) NSMutableArray *sS;

/**
 * The value of the NS property for this object.
 */
@property (nonatomic, retain) NSMutableArray *nS;

/**
 * The value of the BS property for this object.
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
 * @param theS
 */
-(id)initWithS:(NSString *)theS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSS
 */
-(id)initWithSS:(NSMutableArray *)theSS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theN
 */
-(id)initWithN:(NSString *)theN;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theNS
 */
-(id)initWithNS:(NSMutableArray *)theNS;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theB
 */
-(id)initWithB:(NSData *)theB;

/**
 * Constructs a new AttributeValue object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theBS
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
