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

#import "CloudWatchDimension.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Put Metric Alarm Request
 */

@interface CloudWatchPutMetricAlarmRequest:AmazonServiceRequestConfig

{
    NSString       *alarmName;
    NSString       *alarmDescription;
    bool           actionsEnabled;
    bool           actionsEnabledIsSet;
    NSMutableArray *oKActions;
    NSMutableArray *alarmActions;
    NSMutableArray *insufficientDataActions;
    NSString       *metricName;
    NSString       *namespace;
    NSString       *statistic;
    NSMutableArray *dimensions;
    NSNumber       *period;
    NSString       *unit;
    NSNumber       *evaluationPeriods;
    NSNumber       *threshold;
    NSString       *comparisonOperator;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The descriptive name for the alarm. This name must be unique within
 * the user's AWS account
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *alarmName;

/**
 * The description for the alarm.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 255<br/>
 */
@property (nonatomic, retain) NSString *alarmDescription;

/**
 * Indicates whether or not actions should be executed during any changes
 * to the alarm's state.
 */
@property (nonatomic) bool           actionsEnabled;

@property (nonatomic, readonly) bool actionsEnabledIsSet;

/**
 * The list of actions to execute when this alarm transitions into an
 * <code>OK</code> state from any other state. Each action is specified
 * as an Amazon Resource Number (ARN). Currently the only action
 * supported is publishing to an Amazon SNS topic or an Amazon Auto
 * Scaling policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 5<br/>
 */
@property (nonatomic, retain) NSMutableArray *oKActions;

/**
 * The list of actions to execute when this alarm transitions into an
 * <code>ALARM</code> state from any other state. Each action is
 * specified as an Amazon Resource Number (ARN). Currently the only
 * action supported is publishing to an Amazon SNS topic or an Amazon
 * Auto Scaling policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 5<br/>
 */
@property (nonatomic, retain) NSMutableArray *alarmActions;

/**
 * The list of actions to execute when this alarm transitions into an
 * <code>INSUFFICIENT_DATA</code> state from any other state. Each action
 * is specified as an Amazon Resource Number (ARN). Currently the only
 * action supported is publishing to an Amazon SNS topic or an Amazon
 * Auto Scaling policy.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 5<br/>
 */
@property (nonatomic, retain) NSMutableArray *insufficientDataActions;

/**
 * The name for the alarm's associated metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *metricName;

/**
 * The namespace for the alarm's associated metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[^:].*<br/>
 */
@property (nonatomic, retain) NSString *namespace;

/**
 * The statistic to apply to the alarm's associated metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>SampleCount, Average, Sum, Minimum, Maximum
 */
@property (nonatomic, retain) NSString *statistic;

/**
 * The dimensions for the alarm's associated metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 10<br/>
 */
@property (nonatomic, retain) NSMutableArray *dimensions;

/**
 * The period in seconds over which the specified statistic is applied.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>60 - <br/>
 */
@property (nonatomic, retain) NSNumber *period;

/**
 * The unit for the alarm's associated metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>Seconds, Microseconds, Milliseconds, Bytes, Kilobytes, Megabytes, Gigabytes, Terabytes, Bits, Kilobits, Megabits, Gigabits, Terabits, Percent, Count, Bytes/Second, Kilobytes/Second, Megabytes/Second, Gigabytes/Second, Terabytes/Second, Bits/Second, Kilobits/Second, Megabits/Second, Gigabits/Second, Terabits/Second, Count/Second, None
 */
@property (nonatomic, retain) NSString *unit;

/**
 * The number of periods over which data is compared to the specified
 * threshold.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - <br/>
 */
@property (nonatomic, retain) NSNumber *evaluationPeriods;

/**
 * The value against which the specified statistic is compared.
 */
@property (nonatomic, retain) NSNumber *threshold;

/**
 * The arithmetic operation to use when comparing the specified
 * <code>Statistic</code> and <code>Threshold</code>. The specified
 * <code>Statistic</code> value is used as the first operand.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>GreaterThanOrEqualToThreshold, GreaterThanThreshold, LessThanThreshold, LessThanOrEqualToThreshold
 */
@property (nonatomic, retain) NSString *comparisonOperator;

/**
 * Adds a single object to oKActions.
 * This function will alloc and init oKActions if not already done.
 */
-(void)addOKAction:(NSString *)oKActionObject;

/**
 * Adds a single object to alarmActions.
 * This function will alloc and init alarmActions if not already done.
 */
-(void)addAlarmAction:(NSString *)alarmActionObject;

/**
 * Adds a single object to insufficientDataActions.
 * This function will alloc and init insufficientDataActions if not already done.
 */
-(void)addInsufficientDataAction:(NSString *)insufficientDataActionObject;

/**
 * Adds a single object to dimensions.
 * This function will alloc and init dimensions if not already done.
 */
-(void)addDimension:(CloudWatchDimension *)dimensionObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
