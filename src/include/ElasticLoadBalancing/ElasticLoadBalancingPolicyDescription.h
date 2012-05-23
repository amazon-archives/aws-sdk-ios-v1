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

#import "ElasticLoadBalancingPolicyAttributeDescription.h"



/**
 * Policy Description
 */

@interface ElasticLoadBalancingPolicyDescription:NSObject

{
    NSString       *policyName;
    NSString       *policyTypeName;
    NSMutableArray *policyAttributeDescriptions;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name mof the policy associated with the LoadBalancer.
 */
@property (nonatomic, retain) NSString *policyName;

/**
 * The name of the policy type associated with the LoadBalancer.
 */
@property (nonatomic, retain) NSString *policyTypeName;

/**
 * A list of policy attribute description structures.
 */
@property (nonatomic, retain) NSMutableArray *policyAttributeDescriptions;

/**
 * Adds a single object to policyAttributeDescriptions.
 * This function will alloc and init policyAttributeDescriptions if not already done.
 */
-(void)addPolicyAttributeDescription:(ElasticLoadBalancingPolicyAttributeDescription *)policyAttributeDescriptionObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
