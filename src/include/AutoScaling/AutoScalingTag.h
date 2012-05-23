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




/**
 * Tag
 */

@interface AutoScalingTag:NSObject

{
    NSString *resourceId;
    NSString *resourceType;
    NSString *key;
    NSString *value;
    bool     propagateAtLaunch;
    bool     propagateAtLaunchIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *resourceId;

/**
 * The kind of resource to which the tag is applied. Currently, Auto
 * Scaling supports the <code>auto-scaling-group</code> resource type.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *resourceType;

/**
 * The key of the tag.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 128<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *key;

/**
 * The value of the tag.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>0 - 256<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *value;

/**
 * Specifies whether the new tag will be applied to instances launched
 * after the tag is created. The same behavior applies to updates: If you
 * change a tag, the changed tag will be applied to all instances
 * launched after you made the change.
 */
@property (nonatomic) bool           propagateAtLaunch;

@property (nonatomic, readonly) bool propagateAtLaunchIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
