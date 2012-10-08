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
 * Update Auto Scaling Group Request
 */

@interface AutoScalingUpdateAutoScalingGroupRequest:AmazonServiceRequestConfig

{
    NSString       *autoScalingGroupName;
    NSString       *launchConfigurationName;
    NSNumber       *minSize;
    NSNumber       *maxSize;
    NSNumber       *desiredCapacity;
    NSNumber       *defaultCooldown;
    NSMutableArray *availabilityZones;
    NSString       *healthCheckType;
    NSNumber       *healthCheckGracePeriod;
    NSString       *placementGroup;
    NSString       *vPCZoneIdentifier;
    NSMutableArray *terminationPolicies;
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
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The name of the launch configuration.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *launchConfigurationName;

/**
 * The minimum size of the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *minSize;

/**
 * The maximum size of the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *maxSize;

/**
 * The desired capacity for the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *desiredCapacity;

/**
 * The amount of time, in seconds, after a scaling activity completes
 * before any further trigger-related scaling activities can start.
 */
@property (nonatomic, retain) NSNumber *defaultCooldown;

/**
 * Availability Zones for the group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *availabilityZones;

/**
 * The service of interest for the health status check, either "EC2" for
 * Amazon EC2 or "ELB" for Elastic Load Balancing.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 32<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *healthCheckType;

/**
 * The length of time that Auto Scaling waits before checking an
 * instance's health status. The grace period begins when an instance
 * comes into service.
 */
@property (nonatomic, retain) NSNumber *healthCheckGracePeriod;

/**
 * The name of the cluster placement group, if applicable. For more
 * information, go to <a
 * webservices.com/AWSEC2/latest/UserGuide/using_cluster_computing.html">
 * Using Cluster Instances</a> in the Amazon EC2 User Guide.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *placementGroup;

/**
 * The subnet identifier for the Amazon VPC connection, if applicable.
 * You can specify several subnets in a comma-separated list. <p> When
 * you specify <code>VPCZoneIdentifier</code> with
 * <code>AvailabilityZones</code>, ensure that the subnets' Availability
 * Zones match the values you specify for <code>AvailabilityZones</code>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *vPCZoneIdentifier;

/**
 * A standalone termination policy or a list of termination policies used
 * to select the instance to terminate. The policies are executed in the
 * order that they are listed. <p> For more information on creating a
 * termination policy for your Auto Scaling group, go to <a
 * AutoScaling/latest/DeveloperGuide/us-termination-policy.html">Instance
 * Termination Policy for Your Auto Scaling Group</a> in the the <i>Auto
 * Scaling Developer Guide</i>.
 */
@property (nonatomic, retain) NSMutableArray *terminationPolicies;

/**
 * Adds a single object to availabilityZones.
 * This function will alloc and init availabilityZones if not already done.
 */
-(void)addAvailabilityZone:(NSString *)availabilityZoneObject;

/**
 * Adds a single object to terminationPolicies.
 * This function will alloc and init terminationPolicies if not already done.
 */
-(void)addTerminationPolicy:(NSString *)terminationPolicyObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
