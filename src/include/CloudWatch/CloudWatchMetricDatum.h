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
 * A list of dimensions associated with the metric.
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
 * CloudWatch truncates values with very large exponents. Values with
 * base-10 exponents greater than 126 (1 x 10^126) are truncated.
 * Likewise, values with base-10 exponents less than -130 (1 x 10^-130)
 * are also truncated. </important>
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
