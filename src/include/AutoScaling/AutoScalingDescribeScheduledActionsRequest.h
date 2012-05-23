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
 * Describe Scheduled Actions Request
 */

@interface AutoScalingDescribeScheduledActionsRequest:AmazonServiceRequestConfig

{
    NSString       *autoScalingGroupName;
    NSMutableArray *scheduledActionNames;
    NSDate         *startTime;
    NSDate         *endTime;
    NSString       *nextToken;
    NSNumber       *maxRecords;
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
 * A list of scheduled actions to be described. If this list is omitted,
 * all scheduled actions are described. The list of requested scheduled
 * actions cannot contain more than 50 items. If an auto scaling group
 * name is provided, the results are limited to that group. If unknown
 * scheduled actions are requested, they are ignored with no error.
 */
@property (nonatomic, retain) NSMutableArray *scheduledActionNames;

/**
 * The earliest scheduled start time to return. If scheduled action names
 * are provided, this field will be ignored.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The latest scheduled start time to return. If scheduled action names
 * are provided, this field is ignored.
 */
@property (nonatomic, retain) NSDate *endTime;

/**
 * A string that marks the start of the next batch of returned results.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * The maximum number of scheduled actions to return.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 50<br/>
 */
@property (nonatomic, retain) NSNumber *maxRecords;

/**
 * Adds a single object to scheduledActionNames.
 * This function will alloc and init scheduledActionNames if not already done.
 */
-(void)addScheduledActionName:(NSString *)scheduledActionNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
