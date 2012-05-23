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
 * Replaceable Attribute
 */

@interface SimpleDBReplaceableAttribute:NSObject

{
    NSString *name;
    NSString *value;
    bool     replace;
    bool     replaceIsSet;
}



/**
 * The name of the replaceable attribute.
 */
@property (nonatomic, retain) NSString *name;

/**
 * The value of the replaceable attribute.
 */
@property (nonatomic, retain) NSString *value;

/**
 * A flag specifying whether or not to replace the attribute/value pair
 * or to add a new attribute/value pair. The default setting is
 * <code>false</code>.
 */
@property (nonatomic) bool           replace;

@property (nonatomic, readonly) bool replaceIsSet;


/**
 * Default constructor for a new ReplaceableAttribute object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ReplaceableAttribute object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theName The name of the replaceable attribute.
 * @param theValue The value of the replaceable attribute.
 * @param theReplace A flag specifying whether or not to replace the
 * attribute/value pair or to add a new attribute/value pair. The default
 * setting is <code>false</code>.
 */
-(id)initWithName:(NSString *)theName andValue:(NSString *)theValue andReplace:(bool)theReplace;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
