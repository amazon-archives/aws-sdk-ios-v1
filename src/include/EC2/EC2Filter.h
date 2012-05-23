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
 * Filter
 */

@interface EC2Filter:NSObject

{
    NSString       *name;
    NSMutableArray *values;
}



/**
 * Specifies the name of the filter.
 */
@property (nonatomic, retain) NSString *name;

/**
 * Contains one or more values for the filter.
 */
@property (nonatomic, retain) NSMutableArray *values;


/**
 * Default constructor for a new Filter object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new Filter object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theName Specifies the name of the filter.
 * @param theValues Contains one or more values for the filter.
 */
-(id)initWithName:(NSString *)theName andValues:(NSMutableArray *)theValues;

/**
 * Constructs a new Filter object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theName Specifies the name of the filter.
 */
-(id)initWithName:(NSString *)theName;

/**
 * Adds a single object to values.
 * This function will alloc and init values if not already done.
 */
-(void)addValue:(NSString *)valueObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
