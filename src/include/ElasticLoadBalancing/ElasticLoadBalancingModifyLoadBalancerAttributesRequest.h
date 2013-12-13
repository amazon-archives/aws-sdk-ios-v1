/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "ElasticLoadBalancingLoadBalancerAttributes.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Modify Load Balancer Attributes Request
 */

@interface ElasticLoadBalancingModifyLoadBalancerAttributesRequest:AmazonServiceRequestConfig

{
    NSString                                   *loadBalancerName;
    ElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The name of the load balancer.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * Attributes of the load balancer.
 */
@property (nonatomic, retain) ElasticLoadBalancingLoadBalancerAttributes *loadBalancerAttributes;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
