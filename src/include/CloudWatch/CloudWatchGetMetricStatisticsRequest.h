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
 * Get Metric Statistics Request
 */

@interface CloudWatchGetMetricStatisticsRequest:AmazonServiceRequestConfig

{
    NSString       *namespace;
    NSString       *metricName;
    NSMutableArray *dimensions;
    NSDate         *startTime;
    NSDate         *endTime;
    NSNumber       *period;
    NSMutableArray *statistics;
    NSString       *unit;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The namespace of the metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[^:].*<br/>
 */
@property (nonatomic, retain) NSString *namespace;

/**
 * The name of the metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 */
@property (nonatomic, retain) NSString *metricName;

/**
 * A list of dimensions describing qualities of the metric.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 10<br/>
 */
@property (nonatomic, retain) NSMutableArray *dimensions;

/**
 * The time stamp to use for determining the first datapoint to return.
 * The value specified is inclusive; results include datapoints with the
 * time stamp specified. <note> The specified start time is rounded down
 * to the nearest value. Datapoints are returned for start times up to
 * two weeks in the past. Specified start times that are more than two
 * weeks in the past will not return datapoints for metrics that are
 * older than two weeks. </note>
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The time stamp to use for determining the last datapoint to return.
 * The value specified is exclusive; results will include datapoints up
 * to the time stamp specified.
 */
@property (nonatomic, retain) NSDate *endTime;

/**
 * The granularity, in seconds, of the returned datapoints.
 * <code>Period</code> must be at least 60 seconds and must be a multiple
 * of 60. The default value is 60.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>60 - <br/>
 */
@property (nonatomic, retain) NSNumber *period;

/**
 * The metric statistics to return.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 5<br/>
 */
@property (nonatomic, retain) NSMutableArray *statistics;

/**
 * The unit for the metric.
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
 * Adds a single object to statistics.
 * This function will alloc and init statistics if not already done.
 */
-(void)addStatistic:(NSString *)statisticObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
