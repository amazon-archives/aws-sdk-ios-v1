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
 * Auto Scaling Instance Details
 */

@interface AutoScalingAutoScalingInstanceDetails:NSObject

{
    NSString *instanceId;
    NSString *autoScalingGroupName;
    NSString *availabilityZone;
    NSString *lifecycleState;
    NSString *healthStatus;
    NSString *launchConfigurationName;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The instance ID of the Amazon EC2 instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 16<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The name of the Auto Scaling group associated with this instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The Availability Zone in which this instance resides.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * The life cycle state of this instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 32<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *lifecycleState;

/**
 * The health status of this instance. "Healthy" means that the instance
 * is healthy and should remain in service. "Unhealthy" means that the
 * instance is unhealthy. Auto Scaling should terminate and replace it.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 32<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *healthStatus;

/**
 * The launch configuration associated with this instance.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *launchConfigurationName;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
