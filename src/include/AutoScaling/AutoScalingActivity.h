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
 * Activity
 */

@interface AutoScalingActivity:NSObject

{
    NSString *activityId;
    NSString *autoScalingGroupName;
    NSString *descriptionValue;
    NSString *cause;
    NSDate   *startTime;
    NSDate   *endTime;
    NSString *statusCode;
    NSString *statusMessage;
    NSNumber *progress;
    NSString *details;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the ID of the activity.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *activityId;

/**
 * The name of the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * Contains a friendly, more verbose description of the scaling activity.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * Contains the reason the activity was begun.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1023<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *cause;

/**
 * Provides the start time of this activity.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * Provides the end time of this activity.
 */
@property (nonatomic, retain) NSDate *endTime;

/**
 * Contains the current status of the activity.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>WaitingForSpotInstanceRequestId, WaitingForSpotInstanceId, WaitingForInstanceId, PreInService, InProgress, Successful, Failed, Cancelled
 */
@property (nonatomic, retain) NSString *statusCode;

/**
 * Contains a friendly, more verbose description of the activity status.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *statusMessage;

/**
 * Specifies a value between 0 and 100 that indicates the progress of the
 * activity.
 */
@property (nonatomic, retain) NSNumber *progress;

/**
 * Contains details of the scaling activity.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *details;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
