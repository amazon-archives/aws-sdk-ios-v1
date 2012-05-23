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
 * Scheduled Update Group Action
 */

@interface AutoScalingScheduledUpdateGroupAction:NSObject

{
    NSString *autoScalingGroupName;
    NSString *scheduledActionName;
    NSString *scheduledActionARN;
    NSDate   *time;
    NSDate   *startTime;
    NSDate   *endTime;
    NSString *recurrence;
    NSNumber *minSize;
    NSNumber *maxSize;
    NSNumber *desiredCapacity;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the Auto Scaling group to be updated.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The name of this scheduled action.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *scheduledActionName;

/**
 * The Amazon Resource Name (ARN) of this scheduled action.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *scheduledActionARN;

/**
 * <code>Time</code> is deprecated. <p>The time that the action is
 * scheduled to begin. <code>Time</code> is an alias for
 * <code>StartTime</code>.
 */
@property (nonatomic, retain) NSDate *time;

/**
 * The time that the action is scheduled to begin. This value can be up
 * to one month in the future. <p>When <code>StartTime</code> and
 * <code>EndTime</code> are specified with <code>Recurrence</code>, they
 * form the boundaries of when the recurring action will start and stop.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The time that the action is scheduled to end. This value can be up to
 * one month in the future.
 */
@property (nonatomic, retain) NSDate *endTime;

/**
 * The regular schedule that an action occurs.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *recurrence;

/**
 * The minimum size of the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *minSize;

/**
 * The maximum size of the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *maxSize;

/**
 * The number of instances you prefer to maintain in your Auto Scaling
 * group.
 */
@property (nonatomic, retain) NSNumber *desiredCapacity;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
