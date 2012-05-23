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

#import "CloudWatchDatapoint.h"

#import "CloudWatchResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "CloudWatchInvalidParameterValueException.h"
#import "CloudWatchInternalServiceException.h"
#import "CloudWatchInvalidParameterCombinationException.h"
#import "CloudWatchMissingRequiredParameterException.h"


/**
 * Get Metric Statistics Result
 */

@interface CloudWatchGetMetricStatisticsResponse:CloudWatchResponse

{
    NSString       *label;
    NSMutableArray *datapoints;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A label describing the specified metric.
 */
@property (nonatomic, retain) NSString *label;

/**
 * The datapoints for the specified metric.
 */
@property (nonatomic, retain) NSMutableArray *datapoints;



/**
 * Returns a value from the datapoints array for the specified index
 */
-(CloudWatchDatapoint *)datapointsObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
