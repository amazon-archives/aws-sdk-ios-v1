/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Create Auto Scaling Group Request
 */

@interface AutoScalingCreateAutoScalingGroupRequest:AmazonServiceRequestConfig

{
    NSString       *autoScalingGroupName;
    NSString       *launchConfigurationName;
    NSNumber       *minSize;
    NSNumber       *maxSize;
    NSNumber       *desiredCapacity;
    NSNumber       *defaultCooldown;
    NSMutableArray *availabilityZones;
    NSMutableArray *loadBalancerNames;
    NSString       *healthCheckType;
    NSNumber       *healthCheckGracePeriod;
    NSString       *placementGroup;
    NSString       *vPCZoneIdentifier;
    NSMutableArray *terminationPolicies;
    NSMutableArray *tags;
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
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *autoScalingGroupName;

/**
 * The name of an existing launch configuration to use to launch new
 * instances.
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
 * The number of Amazon EC2 instances that should be running in the
 * group. The desired capacity must be greater than or equal to the
 * minimum size and less than or equal to the maximum size specified for
 * the Auto Scaling group.
 */
@property (nonatomic, retain) NSNumber *desiredCapacity;

/**
 * The amount of time, in seconds, between a successful scaling activity
 * and the succeeding scaling activity. <p>If a
 * <code>DefaultCooldown</code> period is not specified, Auto Scaling
 * uses the default value of 300 as the default cool down period for the
 * Auto Scaling group. For more information, see <a
 * /AutoScaling/latest/DeveloperGuide/AS_Concepts.html#Cooldown">Cooldown
 * Period</a>
 */
@property (nonatomic, retain) NSNumber *defaultCooldown;

/**
 * A list of Availability Zones for the Auto Scaling group. This is
 * required unless you have specified subnets.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - <br/>
 */
@property (nonatomic, retain) NSMutableArray *availabilityZones;

/**
 * A list of existing Elastic Load Balancing load balancers to use. The
 * load balancers must be associated with the AWS account. <p>For
 * information on using load balancers, see <a
 * amazon.com/AutoScaling/latest/DeveloperGuide/US_SetUpASLBApp.html">Use
 * Load Balancer to Load Balance Your Auto Scaling Group</a>.
 */
@property (nonatomic, retain) NSMutableArray *loadBalancerNames;

/**
 * The service you want the health checks from, Amazon EC2 or Elastic
 * Load Balancer. Valid values are <code>EC2</code> or <code>ELB</code>.
 * <p>By default, the Auto Scaling health check uses the results of
 * Amazon EC2 instance status checks to determine the health of an
 * instance. For more information, see <a
 * AutoScaling/latest/DeveloperGuide/AS_Concepts.html#healthcheck">Health
 * Check</a>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 32<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *healthCheckType;

/**
 * Length of time in seconds after a new Amazon EC2 instance comes into
 * service that Auto Scaling starts checking its health. During this time
 * any health check failure for the that instance is ignored. <p>This is
 * required if you are adding <code>ELB</code> health check. Frequently,
 * new instances need to warm up, briefly, before they can pass a health
 * check. To provide ample warm-up time, set the health check grace
 * period of the group to match the expected startup period of your
 * application.
 */
@property (nonatomic, retain) NSNumber *healthCheckGracePeriod;

/**
 * Physical location of an existing cluster placement group into which
 * you want to launch your instances. For information about cluster
 * placement group, see <a
 * amazon.com/AWSEC2/latest/UserGuide/using_cluster_computing.html">Using
 * Cluster Instances</a>
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *placementGroup;

/**
 * A comma-separated list of subnet identifiers of Amazon Virtual Private
 * Clouds (Amazon VPCs). <p>If you specify subnets and Availability Zones
 * with this call, ensure that the subnets' Availability Zones match the
 * Availability Zones specified. <p>For information on launching your
 * Auto Scaling group into Amazon VPC subnets, see <a
 * .com/AutoScaling/latest/DeveloperGuide/autoscalingsubnets.html">Launch
 * Auto Scaling Instances into Amazon VPC</a>.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 255<br/>
 * <b>Pattern: </b>[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*<br/>
 */
@property (nonatomic, retain) NSString *vPCZoneIdentifier;

/**
 * A standalone termination policy or a list of termination policies used
 * to select the instance to terminate. The policies are executed in the
 * order that they are listed. <p> For more information on configuring a
 * termination policy for your Auto Scaling group, see <a
 * AutoScaling/latest/DeveloperGuide/us-termination-policy.html">Instance
 * Termination Policy for Your Auto Scaling Group</a> in the the <i>Auto
 * Scaling Developer Guide</i>.
 */
@property (nonatomic, retain) NSMutableArray *terminationPolicies;

/**
 * The tag to be created or updated. Each tag should be defined by its
 * resource type, resource ID, key, value, and a propagate flag. Valid
 * values: key=<i>value</i>, value=<i>value</i>, propagate=<i>true</i> or
 * <i>false</i>. Value and propagate are optional parameters. <p>For
 * information about using tags, see <a
 * s.aws.amazon.com/AutoScaling/latest/DeveloperGuide/ASTagging.html">Tag
 * Your Auto Scaling Groups and Amazon EC2 Instances</a>.
 */
@property (nonatomic, retain) NSMutableArray *tags;

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
 * Adds a single object to terminationPolicies.
 * This function will alloc and init terminationPolicies if not already done.
 */
-(void)addTerminationPolicy:(NSString *)terminationPolicyObject;

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
