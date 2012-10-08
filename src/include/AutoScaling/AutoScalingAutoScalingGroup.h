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

#import "AutoScalingInstance.h"
#import "AutoScalingSuspendedProcess.h"
#import "AutoScalingEnabledMetric.h"
#import "AutoScalingTagDescription.h"



/**
 * Auto Scaling Group
 */

@interface AutoScalingAutoScalingGroup:NSObject

{
    NSString       *autoScalingGroupName;
    NSString       *autoScalingGroupARN;
    NSString       *launchConfigurationName;
    NSNumber       *minSize;
    NSNumber       *maxSize;
    NSNumber       *desiredCapacity;
    NSNumber       *defaultCooldown;
    NSMutableArray *availabilityZones;
    NSMutableArray *loadBalancerNames;
    NSString       *healthCheckType;
    NSNumber       *healthCheckGracePeriod;
    NSMutableArray *instances;
    NSDate         *createdTime;
    NSMutableArray *suspendedProcesses;
    NSString       *placementGroup;
    NSString       *vPCZoneIdentifier;
    NSMutableArray *enabledMetrics;
    NSString       *status;
    NSMutableArray *tags;
    NSMutableArray *terminationPolicies;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the name of the group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The Amazon Resource Name (ARN) of the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 1600<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupARN;

/**
 * Specifies the name of the associated <a>LaunchConfiguration</a>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *launchConfigurationName;

/**
 * Contains the minimum size of the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *minSize;

/**
 * Contains the maximum size of the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *maxSize;

/**
 * Specifies the desired capacity for the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *desiredCapacity;

/**
 * The number of seconds after a scaling activity completes before any
 * further scaling activities can start.
 */
@property (nonatomic, retain) NSNumber *defaultCooldown;

/**
 * Contains a list of Availability Zones for the group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *availabilityZones;

/**
 * A list of load balancers associated with this Auto Scaling group.
 */
@property (nonatomic, retain) NSMutableArray *loadBalancerNames;

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
 * Provides a summary list of Amazon EC2 instances.
 */
@property (nonatomic, retain) NSMutableArray *instances;

/**
 * Specifies the date and time the Auto Scaling group was created.
 */
@property (nonatomic, retain) NSDate *createdTime;

/**
 * Suspended processes associated with this Auto Scaling group.
 */
@property (nonatomic, retain) NSMutableArray *suspendedProcesses;

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
 * A list of metrics enabled for this Auto Scaling group.
 */
@property (nonatomic, retain) NSMutableArray *enabledMetrics;

/**
 * A list of status conditions for the Auto Scaling group.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *status;

/**
 * A list of tags for the Auto Scaling group.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * A standalone termination policy or a list of termination policies for
 * this Auto Scaling group.
 */
@property (nonatomic, retain) NSMutableArray *terminationPolicies;

/**
 * Adds a single object to availabilityZones.
 * This function will alloc and init availabilityZones if not already done.
 */
-(void)addAvailabilityZone:(NSString *)availabilityZoneObject;

/**
 * Adds a single object to loadBalancerNames.
 * This function will alloc and init loadBalancerNames if not already done.
 */
-(void)addLoadBalancerName:(NSString *)loadBalancerNameObject;

/**
 * Adds a single object to instances.
 * This function will alloc and init instances if not already done.
 */
-(void)addInstance:(AutoScalingInstance *)instanceObject;

/**
 * Adds a single object to suspendedProcesses.
 * This function will alloc and init suspendedProcesses if not already done.
 */
-(void)addSuspendedProcesse:(AutoScalingSuspendedProcess *)suspendedProcesseObject;

/**
 * Adds a single object to enabledMetrics.
 * This function will alloc and init enabledMetrics if not already done.
 */
-(void)addEnabledMetric:(AutoScalingEnabledMetric *)enabledMetricObject;

/**
 * Adds a single object to tags.
 * This function will alloc and init tags if not already done.
 */
-(void)addTag:(AutoScalingTagDescription *)tagObject;

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
