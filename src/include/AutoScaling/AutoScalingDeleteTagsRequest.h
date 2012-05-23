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

#import "AutoScalingTag.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Delete Tags Request
 */

@interface AutoScalingDeleteTagsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *tags;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Each tag should be defined by its resource type, resource ID, key,
 * value, and a propagate flag. Valid values are: Resource type =
 * <i>auto-scaling-group</i>, Resource ID = <i>AutoScalingGroupName</i>,
 * key=<i>value</i>, value=<i>value</i>, propagate=<i>true</i> or
 * <i>false</i>.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * Adds a single object to tags.
 * This function will alloc and init tags if not already done.
 */
-(void)addTag:(AutoScalingTag *)tagObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
