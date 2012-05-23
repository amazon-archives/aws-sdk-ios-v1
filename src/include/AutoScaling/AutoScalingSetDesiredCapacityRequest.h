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


#import "../AmazonServiceRequestConfig.h"



/**
 * Set Desired Capacity Request
 */

@interface AutoScalingSetDesiredCapacityRequest:AmazonServiceRequestConfig

{
    NSString *autoScalingGroupName;
    NSNumber *desiredCapacity;
    bool     honorCooldown;
    bool     honorCooldownIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The new capacity setting for the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *desiredCapacity;

/**
 * By default, <code>SetDesiredCapacity</code> overrides any cooldown
 * period. Set to <code>True</code> if you want Auto Scaling to reject
 * this request when the Auto Scaling group is in cooldown.
 */
@property (nonatomic) bool           honorCooldown;

@property (nonatomic, readonly) bool honorCooldownIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
