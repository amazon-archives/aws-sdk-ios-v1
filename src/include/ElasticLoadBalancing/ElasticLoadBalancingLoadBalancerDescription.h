/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "ElasticLoadBalancingListenerDescription.h"
#import "ElasticLoadBalancingPolicies.h"
#import "ElasticLoadBalancingInstance.h"
#import "ElasticLoadBalancingHealthCheck.h"



/**
 * Load Balancer Description
 *
 * \ingroup ElasticLoadBalancing
 */

@interface ElasticLoadBalancingLoadBalancerDescription:NSObject

{
    NSString                        *loadBalancerName;
    NSString                        *dNSName;
    NSMutableArray                  *listenerDescriptions;
    ElasticLoadBalancingPolicies    *policies;
    NSMutableArray                  *availabilityZones;
    NSMutableArray                  *instances;
    ElasticLoadBalancingHealthCheck *healthCheck;
    NSDate                          *createdTime;
}


/**
 * Specifies the name associated with the LoadBalancer.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * Specifies the external DNS name associated with the LoadBalancer.
 */
@property (nonatomic, retain) NSString *dNSName;

/**
 * LoadBalancerPort, InstancePort, Protocol, and PolicyNames are returned
 * in a list of tuples in the ListenerDescriptions element.
 */
@property (nonatomic, retain) NSMutableArray *listenerDescriptions;

/**
 * Provides a list of policies defined for the LoadBalancer.
 */
@property (nonatomic, retain) ElasticLoadBalancingPolicies *policies;

/**
 * Specifies a list of Availability Zones.
 */
@property (nonatomic, retain) NSMutableArray *availabilityZones;

/**
 * Provides a list of EC2 instance IDs for the LoadBalancer.
 */
@property (nonatomic, retain) NSMutableArray *instances;

/**
 * Specifies information regarding the various health probes conducted on
 * the LoadBalancer.
 */
@property (nonatomic, retain) ElasticLoadBalancingHealthCheck *healthCheck;

/**
 * Provides the date and time the LoadBalancer was created.
 */
@property (nonatomic, retain) NSDate *createdTime;


/**
 * Default constructor for a new LoadBalancerDescription object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Adds a single object to listenerDescriptions.
 * This function will alloc and init listenerDescriptions if not already done.
 */
-(void)addListenerDescription:(ElasticLoadBalancingListenerDescription *)listenerDescription;

/**
 * Adds a single object to instances.
 * This function will alloc and init instances if not already done.
 */
-(void)addInstance:(ElasticLoadBalancingInstance *)instance;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
