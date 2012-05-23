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
 * Detach Load Balancer From Subnets Request
 */

@interface ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequest:AmazonServiceRequestConfig

{
    NSString       *loadBalancerName;
    NSMutableArray *subnets;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name associated with the LoadBalancer to be detached. The name
 * must be unique within the client AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * A list of subnet IDs to remove from the set of configured subnets for
 * the LoadBalancer.
 */
@property (nonatomic, retain) NSMutableArray *subnets;

/**
 * Adds a single object to subnets.
 * This function will alloc and init subnets if not already done.
 */
-(void)addSubnet:(NSString *)subnetObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
