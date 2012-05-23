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
 * Delete Load Balancer Listeners Request
 */

@interface ElasticLoadBalancingDeleteLoadBalancerListenersRequest:AmazonServiceRequestConfig

{
    NSString       *loadBalancerName;
    NSMutableArray *loadBalancerPorts;
}



/**
 * The mnemonic name associated with the LoadBalancer.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * The client port number(s) of the LoadBalancerListener(s) to be
 * removed.
 */
@property (nonatomic, retain) NSMutableArray *loadBalancerPorts;


/**
 * Default constructor for a new DeleteLoadBalancerListenersRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeleteLoadBalancerListenersRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The mnemonic name associated with the
 * LoadBalancer.
 * @param theLoadBalancerPorts The client port number(s) of the
 * LoadBalancerListener(s) to be removed.
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andLoadBalancerPorts:(NSMutableArray *)theLoadBalancerPorts;

/**
 * Adds a single object to loadBalancerPorts.
 * This function will alloc and init loadBalancerPorts if not already done.
 */
-(void)addLoadBalancerPort:(NSNumber *)loadBalancerPortObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
