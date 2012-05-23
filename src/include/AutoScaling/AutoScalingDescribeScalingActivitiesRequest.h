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
 * Describe Scaling Activities Request
 */

@interface AutoScalingDescribeScalingActivitiesRequest:AmazonServiceRequestConfig

{
    NSMutableArray *activityIds;
    NSString       *autoScalingGroupName;
    NSNumber       *maxRecords;
    NSString       *nextToken;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A list containing the activity IDs of the desired scaling activities.
 * If this list is omitted, all activities are described. If an
 * <code>AutoScalingGroupName</code> is provided, the results are limited
 * to that group. The list of requested activities cannot contain more
 * than 50 items. If unknown activities are requested, they are ignored
 * with no error.
 */
@property (nonatomic, retain) NSMutableArray *activityIds;

/**
 * The name of the <a>AutoScalingGroup</a>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The maximum number of scaling activities to return.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 50<br/>
 */
@property (nonatomic, retain) NSNumber *maxRecords;

/**
 * A string that marks the start of the next batch of returned results
 * for pagination.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * Adds a single object to activityIds.
 * This function will alloc and init activityIds if not already done.
 */
-(void)addActivityId:(NSString *)activityIdObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
