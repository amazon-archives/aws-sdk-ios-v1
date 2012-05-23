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
 * Terminate Instance In Auto Scaling Group Request
 */

@interface AutoScalingTerminateInstanceInAutoScalingGroupRequest:AmazonServiceRequestConfig

{
    NSString *instanceId;
    bool     shouldDecrementDesiredCapacity;
    bool     shouldDecrementDesiredCapacityIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The ID of the Amazon EC2 instance to be terminated.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 16<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * Specifies whether (<i>true</i>) or not (<i>false</i>) terminating this
 * instance should also decrement the size of the
 * <a>AutoScalingGroup</a>.
 */
@property (nonatomic) bool           shouldDecrementDesiredCapacity;

@property (nonatomic, readonly) bool shouldDecrementDesiredCapacityIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
