/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "CloudWatchStatisticSet.h"



/**
 * Metric Datum
 */

@interface CloudWatchMetricDatum:NSObject

{
    NSString               *metricName;
    NSMutableArray         *dimensions;
    NSDate                 *timestamp;
    NSNumber               *value;
    CloudWatchStatisticSet *statisticValues;
    NSString               *unit;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *metricName;

/**
 * A list of dimensions associated with the metric. Note, when using the
 * Dimensions value in a query, you need to append .member.N to it (e.g.,
 * Dimensions.member.N).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 10<br/>
 */
@property (nonatomic, retain) NSMutableArray *dimensions;

/**
 * The time stamp used for the metric. If not specified, the default
 * value is set to the time the metric data was received.
 */
@property (nonatomic, retain) NSDate *timestamp;

/**
 * The value for the metric. <important>Although the <code>Value</code>
 * parameter accepts numbers of type <code>Double</code>, Amazon
 * CloudWatch rejects values that are either too small or too large.
 * Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base
 * 10) or 2e-360 to 2e360 (Base 2). In addition, special values (e.g.,
 * NaN, +Infinity, -Infinity) are not supported. </important>
 */
@property (nonatomic, retain) NSNumber *value;

/**
 * A set of statistical values describing the metric.
 */
@property (nonatomic, retain) CloudWatchStatisticSet *statisticValues;

/**
 * The unit of the metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>Seconds, Microseconds, Milliseconds, Bytes, Kilobytes, Megabytes, Gigabytes, Terabytes, Bits, Kilobits, Megabits, Gigabits, Terabits, Percent, Count, Bytes/Second, Kilobytes/Second, Megabytes/Second, Gigabytes/Second, Terabytes/Second, Bits/Second, Kilobits/Second, Megabits/Second, Gigabits/Second, Terabits/Second, Count/Second, None
 */
@property (nonatomic, retain) NSString *unit;

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
