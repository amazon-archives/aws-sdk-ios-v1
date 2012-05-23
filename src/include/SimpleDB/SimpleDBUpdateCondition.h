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
 * Update Condition
 */

@interface SimpleDBUpdateCondition:NSObject

{
    NSString *name;
    NSString *value;
    bool     exists;
    bool     existsIsSet;
}



/**
 * The name of the attribute involved in the condition.
 */
@property (nonatomic, retain) NSString *name;

/**
 * The value of an attribute. This value can only be specified when the
 * <code>Exists</code> parameter is equal to <code>true</code>.
 */
@property (nonatomic, retain) NSString *value;

/**
 * A value specifying whether or not the specified attribute must exist
 * with the specified value in order for the update condition to be
 * satisfied. Specify <code>true</code> if the attribute must exist for
 * the update condition to be satisfied. Specify <code>false</code> if
 * the attribute should not exist in order for the update condition to be
 * satisfied.
 */
@property (nonatomic) bool           exists;

@property (nonatomic, readonly) bool existsIsSet;


/**
 * Default constructor for a new UpdateCondition object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new UpdateCondition object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theName The name of the attribute involved in the condition.
 * @param theValue The value of an attribute. This value can only be
 * specified when the <code>Exists</code> parameter is equal to
 * <code>true</code>.
 * @param theExists A value specifying whether or not the specified
 * attribute must exist with the specified value in order for the update
 * condition to be satisfied. Specify <code>true</code> if the attribute
 * must exist for the update condition to be satisfied. Specify
 * <code>false</code> if the attribute should not exist in order for the
 * update condition to be satisfied.
 */
-(id)initWithName:(NSString *)theName andValue:(NSString *)theValue andExists:(bool)theExists;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
