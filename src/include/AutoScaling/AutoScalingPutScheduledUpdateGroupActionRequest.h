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
 * Put Scheduled Update Group Action Request
 */

@interface AutoScalingPutScheduledUpdateGroupActionRequest:AmazonServiceRequestConfig

{
    NSString *autoScalingGroupName;
    NSString *scheduledActionName;
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
 * The name or ARN of the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The name of this scaling action.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *scheduledActionName;

/**
 * <code>Time</code> is deprecated. <p>The time for this action to start.
 * <code>Time</code> is an alias for <code>StartTime</code> and can be
 * specified instead of <code>StartTime</code>, or vice versa. If both
 * <code>Time</code> and <code>StartTime</code> are specified, their
 * values should be identical. Otherwise,
 * <code>PutScheduledUpdateGroupAction</code> will return an error.
 */
@property (nonatomic, retain) NSDate *time;

/**
 * The time for this action to start, as in <code>--start-time
 * 2010-06-01T00:00:00Z</code>. <p>When <code>StartTime</code> and
 * <code>EndTime</code> are specified with <code>Recurrence</code>, they
 * form the boundaries of when the recurring action will start and stop.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The time for this action to end.
 */
@property (nonatomic, retain) NSDate *endTime;

/**
 * The time when recurring future actions will start. Start time is
 * specified by the user following the Unix cron syntax format. For
 * information about cron syntax, go to <a
 * href="http://en.wikipedia.org/wiki/Cron">Wikipedia, The Free
 * Encyclopedia</a>. <p>When <code>StartTime</code> and
 * <code>EndTime</code> are specified with <code>Recurrence</code>, they
 * form the boundaries of when the recurring action will start and stop.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *recurrence;

/**
 * The minimum size for the new Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *minSize;

/**
 * The maximum size for the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *maxSize;

/**
 * The number of Amazon EC2 instances that should be running in the
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
