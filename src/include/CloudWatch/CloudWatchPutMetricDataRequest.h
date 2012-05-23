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

#import "CloudWatchMetricDatum.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Put Metric Data Request
 */

@interface CloudWatchPutMetricDataRequest:AmazonServiceRequestConfig

{
    NSString       *namespace;
    NSMutableArray *metricDatas;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The namespace for the metric data.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[^:].*<br/>
 */
@property (nonatomic, retain) NSString *namespace;

/**
 * A list of data describing the metric.
 */
@property (nonatomic, retain) NSMutableArray *metricDatas;

/**
 * Adds a single object to metricDatas.
 * This function will alloc and init metricDatas if not already done.
 */
-(void)addMetricData:(CloudWatchMetricDatum *)metricDataObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
