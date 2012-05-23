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
 * Describe Tags Request
 */

@interface EC2DescribeTagsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *filters;
}



/**
 * A list of filters used to match properties for tags.
 */
@property (nonatomic, retain) NSMutableArray *filters;


/**
 * Default constructor for a new DescribeTagsRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DescribeTagsRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theFilters A list of filters used to match properties for tags.
 */
-(id)initWithFilters:(NSMutableArray *)theFilters;

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
