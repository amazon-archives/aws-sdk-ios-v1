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

#import "ElasticLoadBalancingInstance.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Register Instances With Load Balancer Request
 */

@interface ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequest:AmazonServiceRequestConfig

{
    NSString       *loadBalancerName;
    NSMutableArray *instances;
}



/**
 * The name associated with the LoadBalancer. The name must be unique
 * within the client AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * A list of instance IDs that should be registered with the
 * LoadBalancer. <note>When the instance is stopped and then restarted,
 * the IP addresses associated with your instance changes. Elastic Load
 * Balancing cannot recognize the new IP address, which prevents it from
 * routing traffic to your instances. We recommend that you de-register
 * your Amazon EC2 instances from your load balancer after you stop your
 * instance, and then register the load balancer with your instance after
 * you've restarted. To de-register your instances from load balancer,
 * use <a>DeregisterInstancesFromLoadBalancer</a> action.</note>
 */
@property (nonatomic, retain) NSMutableArray *instances;


/**
 * Default constructor for a new RegisterInstancesWithLoadBalancerRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new RegisterInstancesWithLoadBalancerRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The name associated with the LoadBalancer.
 * The name must be unique within the client AWS account.
 * @param theInstances A list of instance IDs that should be registered
 * with the LoadBalancer. <note>When the instance is stopped and then
 * restarted, the IP addresses associated with your instance changes.
 * Elastic Load Balancing cannot recognize the new IP address, which
 * prevents it from routing traffic to your instances. We recommend that
 * you de-register your Amazon EC2 instances from your load balancer
 * after you stop your instance, and then register the load balancer with
 * your instance after you've restarted. To de-register your instances
 * from load balancer, use <a>DeregisterInstancesFromLoadBalancer</a>
 * action.</note>
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andInstances:(NSMutableArray *)theInstances;

/**
 * Adds a single object to instances.
 * This function will alloc and init instances if not already done.
 */
-(void)addInstance:(ElasticLoadBalancingInstance *)instanceObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
