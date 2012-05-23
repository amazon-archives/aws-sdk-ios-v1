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
 * Set Load Balancer Policies Of Listener Request
 */

@interface ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest:AmazonServiceRequestConfig

{
    NSString       *loadBalancerName;
    NSNumber       *loadBalancerPort;
    NSMutableArray *policyNames;
}



/**
 * The name associated with the LoadBalancer. The name must be unique
 * within the client AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * The external port of the LoadBalancer with which this policy applies
 * to.
 */
@property (nonatomic, retain) NSNumber *loadBalancerPort;

/**
 * List of policies to be associated with the listener. Currently this
 * list can have at most one policy. If the list is empty, the current
 * policy is removed from the listener.
 */
@property (nonatomic, retain) NSMutableArray *policyNames;


/**
 * Default constructor for a new SetLoadBalancerPoliciesOfListenerRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new SetLoadBalancerPoliciesOfListenerRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The name associated with the LoadBalancer.
 * The name must be unique within the client AWS account.
 * @param theLoadBalancerPort The external port of the LoadBalancer with
 * which this policy applies to.
 * @param thePolicyNames List of policies to be associated with the
 * listener. Currently this list can have at most one policy. If the list
 * is empty, the current policy is removed from the listener.
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andLoadBalancerPort:(NSNumber *)theLoadBalancerPort andPolicyNames:(NSMutableArray *)thePolicyNames;

/**
 * Adds a single object to policyNames.
 * This function will alloc and init policyNames if not already done.
 */
-(void)addPolicyName:(NSString *)policyNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
