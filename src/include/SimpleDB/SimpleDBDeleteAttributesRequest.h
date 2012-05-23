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

#import "SimpleDBAttribute.h"
#import "SimpleDBUpdateCondition.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Delete Attributes Request
 */

@interface SimpleDBDeleteAttributesRequest:AmazonServiceRequestConfig

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
 * The name of the item. Similar to rows on a spreadsheet, items
 * represent individual objects that contain one or more value-attribute
 * pairs.
 */
@property (nonatomic, retain) NSString *itemName;

/**
 * A list of Attributes. Similar to columns on a spreadsheet, attributes
 * represent categories of data that can be assigned to items.
 */
@property (nonatomic, retain) NSMutableArray *attributes;

/**
 * The update condition which, if specified, determines whether the
 * specified attributes will be deleted or not. The update condition must
 * be satisfied in order for this request to be processed and the
 * attributes to be deleted.
 */
@property (nonatomic, retain) SimpleDBUpdateCondition *expected;


/**
 * Default constructor for a new DeleteAttributesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeleteAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain in which to perform the
 * operation.
 * @param theItemName The name of the item. Similar to rows on a
 * spreadsheet, items represent individual objects that contain one or
 * more value-attribute pairs.
 */
-(id)initWithDomainName:(NSString *)theDomainName andItemName:(NSString *)theItemName;

/**
 * Constructs a new DeleteAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain in which to perform the
 * operation.
 * @param theItemName The name of the item. Similar to rows on a
 * spreadsheet, items represent individual objects that contain one or
 * more value-attribute pairs.
 * @param theAttributes A list of Attributes. Similar to columns on a
 * spreadsheet, attributes represent categories of data that can be
 * assigned to items.
 */
-(id)initWithDomainName:(NSString *)theDomainName andItemName:(NSString *)theItemName andAttributes:(NSMutableArray *)theAttributes;

/**
 * Constructs a new DeleteAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain in which to perform the
 * operation.
 * @param theItemName The name of the item. Similar to rows on a
 * spreadsheet, items represent individual objects that contain one or
 * more value-attribute pairs.
 * @param theAttributes A list of Attributes. Similar to columns on a
 * spreadsheet, attributes represent categories of data that can be
 * assigned to items.
 * @param theExpected The update condition which, if specified,
 * determines whether the specified attributes will be deleted or not.
 * The update condition must be satisfied in order for this request to be
 * processed and the attributes to be deleted.
 */
-(id)initWithDomainName:(NSString *)theDomainName andItemName:(NSString *)theItemName andAttributes:(NSMutableArray *)theAttributes andExpected:(SimpleDBUpdateCondition *)theExpected;

/**
 * Adds a single object to attributes.
 * This function will alloc and init attributes if not already done.
 */
-(void)addAttribute:(SimpleDBAttribute *)attributeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
