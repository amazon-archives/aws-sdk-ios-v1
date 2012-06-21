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

@interface AutoScalingFilter:NSObject

{
    NSString       *name;
    NSMutableArray *values;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the filter. Valid Name values are:
 * <code>"auto-scaling-group"</code>, <code>"key"</code>,
 * <code>"value"</code>, and <code>"propagate-at-launch"</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *name;

/**
 * The value of the filter.
 */
@property (nonatomic, retain) NSMutableArray *values;

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
