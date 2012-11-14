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
 * Spot Instance Status
 */

@interface EC2SpotInstanceStatus:NSObject

{
    NSString *code;
    NSDate   *updateTime;
    NSString *message;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Code property for this object.
 */
@property (nonatomic, retain) NSString *code;

/**
 * The value of the UpdateTime property for this object.
 */
@property (nonatomic, retain) NSDate *updateTime;

/**
 * The value of the Message property for this object.
 */
@property (nonatomic, retain) NSString *message;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
