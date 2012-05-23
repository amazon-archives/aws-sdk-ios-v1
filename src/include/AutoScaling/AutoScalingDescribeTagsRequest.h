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

#import "AutoScalingFilter.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Describe Tags Request
 */

@interface AutoScalingDescribeTagsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *filters;
    NSString       *nextToken;
    NSNumber       *maxRecords;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the filter type used to identify the tags to be returned.
 * For example, you can filter so that tags are returned according to
 * Auto Scaling group, the key and value, or whether the new tag will be
 * applied to instances launched after the tag is created
 * (PropagateAtLaunch).
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * A string that marks the start of the next batch of returned results.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * The maximum number of records to return.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 50<br/>
 */
@property (nonatomic, retain) NSNumber *maxRecords;

/**
 * Adds a single object to filters.
 * This function will alloc and init filters if not already done.
 */
-(void)addFilter:(AutoScalingFilter *)filterObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
