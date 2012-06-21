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
 * Describe Instance Status Request
 */

@interface EC2DescribeInstanceStatusRequest:AmazonServiceRequestConfig

{
    NSMutableArray *instanceIds;
    NSMutableArray *filters;
    NSString       *nextToken;
    NSNumber       *maxResults;
    bool           includeAllInstances;
    bool           includeAllInstancesIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The list of instance IDs. If not specified, all instances are
 * described.
 */
@property (nonatomic, retain) NSMutableArray *instanceIds;

/**
 * The list of filters to limit returned results.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * A string specifying the next paginated set of results to return.
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * The maximum number of paginated instance items per response.
 */
@property (nonatomic, retain) NSNumber *maxResults;

/**
 * The value of the IncludeAllInstances property for this object.
 */
@property (nonatomic) bool           includeAllInstances;

@property (nonatomic, readonly) bool includeAllInstancesIsSet;

/**
 * Adds a single object to instanceIds.
 * This function will alloc and init instanceIds if not already done.
 */
-(void)addInstanceId:(NSString *)instanceIdObject;

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
