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


#import "../AmazonServiceRequestConfig.h"



/**
 * Describe Load Balancers Request
 *
 * \ingroup ElasticLoadBalancing
 */

@interface ElasticLoadBalancingDescribeLoadBalancersRequest:AmazonServiceRequestConfig

{
    NSMutableArray *loadBalancerNames;
}


/**
 * A list of names associated with the LoadBalancers at creation time.
 */
@property (nonatomic, retain) NSMutableArray *loadBalancerNames;


/**
 * Default constructor for a new DescribeLoadBalancersRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DescribeLoadBalancersRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerNames A list of names associated with the
 * LoadBalancers at creation time.
 */
-(id)initWithLoadBalancerNames:(NSMutableArray *)theLoadBalancerNames;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
