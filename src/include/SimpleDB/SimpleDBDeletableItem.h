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



/**
 * Deletable Item
 */

@interface SimpleDBDeletableItem:NSObject

{
    NSString       *name;
    NSMutableArray *attributes;
}



/**
 * The value of the Name property for this object.
 */
@property (nonatomic, retain) NSString *name;

/**
 * The value of the Attributes property for this object.
 */
@property (nonatomic, retain) NSMutableArray *attributes;


/**
 * Default constructor for a new DeletableItem object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeletableItem object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theName
 * @param theAttributes
 */
-(id)initWithName:(NSString *)theName andAttributes:(NSMutableArray *)theAttributes;

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
