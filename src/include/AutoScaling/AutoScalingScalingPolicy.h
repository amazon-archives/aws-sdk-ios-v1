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

#import "AutoScalingAlarm.h"



/**
 * Scaling Policy
 */

@interface AutoScalingScalingPolicy:NSObject

{
    NSString       *autoScalingGroupName;
    NSString       *policyName;
    NSNumber       *scalingAdjustment;
    NSString       *adjustmentType;
    NSNumber       *cooldown;
    NSString       *policyARN;
    NSMutableArray *alarms;
    NSNumber       *minAdjustmentStep;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the Auto Scaling group associated with this scaling
 * policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The name of the scaling policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *policyName;

/**
 * The number associated with the specified adjustment type. A positive
 * value adds to the current capacity and a negative value removes from
 * the current capacity.
 */
@property (nonatomic, retain) NSNumber *scalingAdjustment;

/**
 * Specifies whether the <code>ScalingAdjustment</code> is an absolute
 * number or a percentage of the current capacity. Valid values are
 * <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and
 * <code>PercentChangeInCapacity</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *adjustmentType;

/**
 * The amount of time, in seconds, after a scaling activity completes
 * before any further trigger-related scaling activities can start.
 */
@property (nonatomic, retain) NSNumber *cooldown;

/**
 * The Amazon Resource Name (ARN) of the policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *policyARN;

/**
 * A list of CloudWatch Alarms related to the policy.
 */
@property (nonatomic, retain) NSMutableArray *alarms;

/**
 * Changes the <code>DesiredCapacity</code> of the Auto Scaling group by
 * at least the specified number of instances.
 */
@property (nonatomic, retain) NSNumber *minAdjustmentStep;

/**
 * Adds a single object to alarms.
 * This function will alloc and init alarms if not already done.
 */
-(void)addAlarm:(AutoScalingAlarm *)alarmObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
