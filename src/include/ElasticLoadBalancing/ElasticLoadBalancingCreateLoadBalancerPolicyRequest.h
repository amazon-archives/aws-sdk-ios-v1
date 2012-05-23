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

#import "ElasticLoadBalancingPolicyAttribute.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Create Load Balancer Policy Request
 */

@interface ElasticLoadBalancingCreateLoadBalancerPolicyRequest:AmazonServiceRequestConfig

{
    NSString       *loadBalancerName;
    NSString       *policyName;
    NSString       *policyTypeName;
    NSMutableArray *policyAttributes;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name associated with the LoadBalancer for which the policy is
 * being created. This name must be unique within the client AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * The name of the LoadBalancer policy being created. The name must be
 * unique within the set of policies for this LoadBalancer.
 */
@property (nonatomic, retain) NSString *policyName;

/**
 * The name of the base policy type being used to create this policy. To
 * get the list of policy types, use the
 * <a>DescribeLoadBalancerPolicyTypes</a> action.
 */
@property (nonatomic, retain) NSString *policyTypeName;

/**
 * A list of attributes associated with the policy being created.
 */
@property (nonatomic, retain) NSMutableArray *policyAttributes;

/**
 * Adds a single object to policyAttributes.
 * This function will alloc and init policyAttributes if not already done.
 */
-(void)addPolicyAttribute:(ElasticLoadBalancingPolicyAttribute *)policyAttributeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
