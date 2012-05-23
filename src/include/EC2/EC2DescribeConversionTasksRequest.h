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

#import "EC2Filter.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Describe Conversion Tasks Request
 */

@interface EC2DescribeConversionTasksRequest:AmazonServiceRequestConfig

{
    NSMutableArray *filters;
    NSMutableArray *conversionTaskIds;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Filters property for this object.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * The value of the ConversionTaskIds property for this object.
 */
@property (nonatomic, retain) NSMutableArray *conversionTaskIds;

/**
 * Adds a single object to filters.
 * This function will alloc and init filters if not already done.
 */
-(void)addFilter:(EC2Filter *)filterObject;

/**
 * Adds a single object to conversionTaskIds.
 * This function will alloc and init conversionTaskIds if not already done.
 */
-(void)addConversionTaskId:(NSString *)conversionTaskIdObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
