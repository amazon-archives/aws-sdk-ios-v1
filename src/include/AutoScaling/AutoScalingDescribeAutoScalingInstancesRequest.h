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


#import "../AmazonServiceRequestConfig.h"



/**
 * Describe Auto Scaling Instances Request
 */

@interface AutoScalingDescribeAutoScalingInstancesRequest:AmazonServiceRequestConfig

{
    NSMutableArray *instanceIds;
    NSNumber       *maxRecords;
    NSString       *nextToken;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The list of Auto Scaling instances to describe. If this list is
 * omitted, all auto scaling instances are described. The list of
 * requested instances cannot contain more than 50 items. If unknown
 * instances are requested, they are ignored with no error.
 */
@property (nonatomic, retain) NSMutableArray *instanceIds;

/**
 * The maximum number of Auto Scaling instances to be described with each
 * call.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 50<br/>
 */
@property (nonatomic, retain) NSNumber *maxRecords;

/**
 * The token returned by a previous call to indicate that there is more
 * data available.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * Adds a single object to instanceIds.
 * This function will alloc and init instanceIds if not already done.
 */
-(void)addInstanceId:(NSString *)instanceIdObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
