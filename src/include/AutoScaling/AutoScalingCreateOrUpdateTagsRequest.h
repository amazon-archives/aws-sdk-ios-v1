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
 * Create Or Update Tags Request
 */

@interface AutoScalingCreateOrUpdateTagsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *tags;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The tag to be created or updated. Each tag should be defined by its
 * resource type, resource ID, key, value, and a propagate flag. The
 * resource type and resource ID identify the type and name of resource
 * for which the tag is created. Currently,
 * <code>auto-scaling-group</code> is the only supported resource type.
 * The valid value for the resource ID is <i>groupname</i>. <p>The
 * <code>PropagateAtLaunch</code> flag defines whether the new tag will
 * be applied to instances launched by the Auto Scaling group. Valid
 * values are <code>true</code> or <code>false</code>. However, instances
 * that are already running will not get the new or updated tag.
 * Likewise, when you modify a tag, the updated version will be applied
 * only to new instances launched by the Auto Scaling group after the
 * change. Running instances that had the previous version of the tag
 * will continue to have the older tag. <p>When you create a tag and a
 * tag of the same name already exists, the operation overwrites the
 * previous tag definition, but you will not get an error message.
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
