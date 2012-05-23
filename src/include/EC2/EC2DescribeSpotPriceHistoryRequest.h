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
 * Describe Spot Price History Request
 */

@interface EC2DescribeSpotPriceHistoryRequest:AmazonServiceRequestConfig

{
    NSDate         *startTime;
    NSDate         *endTime;
    NSMutableArray *instanceTypes;
    NSMutableArray *productDescriptions;
    NSMutableArray *filters;
    NSString       *availabilityZone;
    NSNumber       *maxResults;
    NSString       *nextToken;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The start date and time of the Spot Instance price history data.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The end date and time of the Spot Instance price history data.
 */
@property (nonatomic, retain) NSDate *endTime;

/**
 * Specifies the instance type to return.
 */
@property (nonatomic, retain) NSMutableArray *instanceTypes;

/**
 * The description of the AMI.
 */
@property (nonatomic, retain) NSMutableArray *productDescriptions;

/**
 * A list of filters used to match properties for SpotPriceHistory. For a
 * complete reference to the available filter keys for this operation,
 * see the <a
 * "http://docs.amazonwebservices.com/AWSEC2/latest/APIReference/">Amazon
 * EC2 API reference</a>.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * Filters the results by availability zone (ex: 'us-east-1a').
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * Specifies the number of rows to return.
 */
@property (nonatomic, retain) NSNumber *maxResults;

/**
 * Specifies the next set of rows to return.
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * Adds a single object to instanceTypes.
 * This function will alloc and init instanceTypes if not already done.
 */
-(void)addInstanceType:(NSString *)instanceTypeObject;

/**
 * Adds a single object to productDescriptions.
 * This function will alloc and init productDescriptions if not already done.
 */
-(void)addProductDescription:(NSString *)productDescriptionObject;

/**
 * Adds a single object to filters.
 * This function will alloc and init filters if not already done.
 */
-(void)addFilter:(EC2Filter *)filterObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
