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

#import "SimpleDBReplaceableAttribute.h"
#import "SimpleDBUpdateCondition.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Put Attributes Request
 */

@interface SimpleDBPutAttributesRequest:AmazonServiceRequestConfig

{
    NSString                *domainName;
    NSString                *itemName;
    NSMutableArray          *attributes;
    SimpleDBUpdateCondition *expected;
}



/**
 * The name of the domain in which to perform the operation.
 */
@property (nonatomic, retain) NSString *domainName;

/**
 * The name of the item.
 */
@property (nonatomic, retain) NSString *itemName;

/**
 * The list of attributes.
 */
@property (nonatomic, retain) NSMutableArray *attributes;

/**
 * The update condition which, if specified, determines whether the
 * specified attributes will be updated or not. The update condition must
 * be satisfied in order for this request to be processed and the
 * attributes to be updated.
 */
@property (nonatomic, retain) SimpleDBUpdateCondition *expected;


/**
 * Default constructor for a new PutAttributesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new PutAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain in which to perform the
 * operation.
 * @param theItemName The name of the item.
 * @param theAttributes The list of attributes.
 */
-(id)initWithDomainName:(NSString *)theDomainName andItemName:(NSString *)theItemName andAttributes:(NSMutableArray *)theAttributes;

/**
 * Constructs a new PutAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain in which to perform the
 * operation.
 * @param theItemName The name of the item.
 * @param theAttributes The list of attributes.
 * @param theExpected The update condition which, if specified,
 * determines whether the specified attributes will be updated or not.
 * The update condition must be satisfied in order for this request to be
 * processed and the attributes to be updated.
 */
-(id)initWithDomainName:(NSString *)theDomainName andItemName:(NSString *)theItemName andAttributes:(NSMutableArray *)theAttributes andExpected:(SimpleDBUpdateCondition *)theExpected;

/**
 * Adds a single object to attributes.
 * This function will alloc and init attributes if not already done.
 */
-(void)addAttribute:(SimpleDBReplaceableAttribute *)attributeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
