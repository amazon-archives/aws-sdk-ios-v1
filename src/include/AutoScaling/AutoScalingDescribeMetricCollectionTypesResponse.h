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

#import "AutoScalingMetricCollectionType.h"
#import "AutoScalingMetricGranularityType.h"

#import "AutoScalingResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"



/**
 * Describe Metric Collection Types Result
 */

@interface AutoScalingDescribeMetricCollectionTypesResponse:AutoScalingResponse

{
    NSMutableArray *metrics;
    NSMutableArray *granularities;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The list of Metrics collected.The following metrics are supported:
 * <ul> <li><p>GroupMinSize</li> <li><p>GroupMaxSize</li>
 * <li><p>GroupDesiredCapacity</li> <li><p>GroupInServiceInstances</li>
 * <li><p>GroupPendingInstances</li>
 * <li><p>GroupTerminatingInstances</li> <li><p>GroupTotalInstances</li>
 * </ul>
 */
@property (nonatomic, retain) NSMutableArray *metrics;

/**
 * A list of granularities for the listed Metrics.
 */
@property (nonatomic, retain) NSMutableArray *granularities;



/**
 * Returns a value from the metrics array for the specified index
 */
-(AutoScalingMetricCollectionType *)metricsObjectAtIndex:(int)index;



/**
 * Returns a value from the granularities array for the specified index
 */
-(AutoScalingMetricGranularityType *)granularitiesObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
