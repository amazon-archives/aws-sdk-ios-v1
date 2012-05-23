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

#import "ElasticLoadBalancingListener.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Create Load Balancer Listeners Request
 */

@interface ElasticLoadBalancingCreateLoadBalancerListenersRequest:AmazonServiceRequestConfig

{
    NSString       *loadBalancerName;
    NSMutableArray *listeners;
}



/**
 * The name of the new LoadBalancer. The name must be unique within your
 * AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * A list of <code>LoadBalancerPort</code>, <code>InstancePort</code>,
 * <code>Protocol</code>, and <code>SSLCertificateId</code> items.
 */
@property (nonatomic, retain) NSMutableArray *listeners;


/**
 * Default constructor for a new CreateLoadBalancerListenersRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new CreateLoadBalancerListenersRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The name of the new LoadBalancer. The name
 * must be unique within your AWS account.
 * @param theListeners A list of <code>LoadBalancerPort</code>,
 * <code>InstancePort</code>, <code>Protocol</code>, and
 * <code>SSLCertificateId</code> items.
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andListeners:(NSMutableArray *)theListeners;

/**
 * Adds a single object to listeners.
 * This function will alloc and init listeners if not already done.
 */
-(void)addListener:(ElasticLoadBalancingListener *)listenerObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
