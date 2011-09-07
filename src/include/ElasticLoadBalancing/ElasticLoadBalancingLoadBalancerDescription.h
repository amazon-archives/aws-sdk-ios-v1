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
#import "ElasticLoadBalancingBackendServerDescription.h"
#import "ElasticLoadBalancingInstance.h"
#import "ElasticLoadBalancingHealthCheck.h"
#import "ElasticLoadBalancingSourceSecurityGroup.h"



/**
 * Load Balancer Description
 *
 * \ingroup ElasticLoadBalancing
 */

@interface ElasticLoadBalancingLoadBalancerDescription:NSObject

{
    NSString                                *loadBalancerName;
    NSString                                *dNSName;
    NSString                                *canonicalHostedZoneName;
    NSString                                *canonicalHostedZoneNameID;
    NSMutableArray                          *listenerDescriptions;
    ElasticLoadBalancingPolicies            *policies;
    NSMutableArray                          *backendServerDescriptions;
    NSMutableArray                          *availabilityZones;
    NSMutableArray                          *instances;
    ElasticLoadBalancingHealthCheck         *healthCheck;
    ElasticLoadBalancingSourceSecurityGroup *sourceSecurityGroup;
    NSDate                                  *createdTime;
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
 * Provides the name of the Amazon Route 53 hosted zone that is
 * associated with the LoadBalancer. For information on how to associate
 * your load balancer with a hosted zone, go to <a
 * alancing/latest/DeveloperGuide/using-domain-names-with-elb.html">Using
 * Domain Names With Elastic Load Balancing</a> in the <i>Elastic Load
 * Balancing Developer Guide</i>.
 */
@property (nonatomic, retain) NSString *canonicalHostedZoneName;

/**
 * Provides the ID of the Amazon Route 53 hosted zone name that is
 * associated with the LoadBalancer. For information on how to associate
 * or disassociate your load balancer with a hosted zone, go to <a
 * alancing/latest/DeveloperGuide/using-domain-names-with-elb.html">Using
 * Domain Names With Elastic Load Balancing</a> in the <i>Elastic Load
 * Balancing Developer Guide</i>.
 */
@property (nonatomic, retain) NSString *canonicalHostedZoneNameID;

/**
 * LoadBalancerPort, InstancePort, Protocol, InstanceProtocol, and
 * PolicyNames are returned in a list of tuples in the
 * ListenerDescriptions element.
 */
@property (nonatomic, retain) NSMutableArray *listenerDescriptions;

/**
 * Provides a list of policies defined for the LoadBalancer.
 */
@property (nonatomic, retain) ElasticLoadBalancingPolicies *policies;

/**
 * Contains a list of back-end server descriptions.
 */
@property (nonatomic, retain) NSMutableArray *backendServerDescriptions;

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
 * The security group that you can use as part of your inbound rules for
 * your LoadBalancer's back-end Amazon EC2 application instances. To only
 * allow traffic from LoadBalancers, add a security group rule to your
 * back end instance that specifies this source security group as the
 * inbound source.
 */
@property (nonatomic, retain) ElasticLoadBalancingSourceSecurityGroup *sourceSecurityGroup;

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
-(void)addListenerDescription:(ElasticLoadBalancingListenerDescription *)listenerDescriptionObject;

/**
 * Adds a single object to backendServerDescriptions.
 * This function will alloc and init backendServerDescriptions if not already done.
 */
-(void)addBackendServerDescription:(ElasticLoadBalancingBackendServerDescription *)backendServerDescriptionObject;

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
