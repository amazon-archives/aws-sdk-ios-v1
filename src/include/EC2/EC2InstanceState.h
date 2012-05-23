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
 * Instance State
 */

@interface EC2InstanceState:NSObject

{
    NSNumber *code;
    NSString *name;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A 16-bit unsigned integer. The high byte is an opaque internal value
 * and should be ignored. The low byte is set based on the state
 * represented.
 */
@property (nonatomic, retain) NSNumber *code;

/**
 * The current state of the instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>pending, running, shutting-down, terminated, stopping, stopped
 */
@property (nonatomic, retain) NSString *name;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
