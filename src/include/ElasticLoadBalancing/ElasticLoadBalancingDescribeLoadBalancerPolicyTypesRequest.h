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
 * Describe Load Balancer Policy Types Request
 */

@interface ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequest:AmazonServiceRequestConfig

{
    NSMutableArray *policyTypeNames;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the name of the policy types. If no names are specified,
 * returns the description of all the policy types defined by Elastic
 * Load Balancing service.
 */
@property (nonatomic, retain) NSMutableArray *policyTypeNames;

/**
 * Adds a single object to policyTypeNames.
 * This function will alloc and init policyTypeNames if not already done.
 */
-(void)addPolicyTypeName:(NSString *)policyTypeNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
