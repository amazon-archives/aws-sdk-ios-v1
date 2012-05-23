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

#import "ElasticLoadBalancingPolicyAttributeTypeDescription.h"



/**
 * Policy Type Description
 */

@interface ElasticLoadBalancingPolicyTypeDescription:NSObject

{
    NSString       *policyTypeName;
    NSString       *descriptionValue;
    NSMutableArray *policyAttributeTypeDescriptions;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the policy type.
 */
@property (nonatomic, retain) NSString *policyTypeName;

/**
 * A human-readable description of the policy type.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The description of the policy attributes associated with the
 * LoadBalancer policies defined by the Elastic Load Balancing service.
 */
@property (nonatomic, retain) NSMutableArray *policyAttributeTypeDescriptions;

/**
 * Adds a single object to policyAttributeTypeDescriptions.
 * This function will alloc and init policyAttributeTypeDescriptions if not already done.
 */
-(void)addPolicyAttributeTypeDescription:(ElasticLoadBalancingPolicyAttributeTypeDescription *)policyAttributeTypeDescriptionObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
