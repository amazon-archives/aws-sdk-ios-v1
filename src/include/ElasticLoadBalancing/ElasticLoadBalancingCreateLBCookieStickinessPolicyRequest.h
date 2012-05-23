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
 * Create L B Cookie Stickiness Policy Request
 */

@interface ElasticLoadBalancingCreateLBCookieStickinessPolicyRequest:AmazonServiceRequestConfig

{
    NSString *loadBalancerName;
    NSString *policyName;
    NSNumber *cookieExpirationPeriod;
}



/**
 * The name associated with the LoadBalancer. The name must be unique
 * within the client AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * The name of the policy being created. The name must be unique within
 * the set of policies for this LoadBalancer.
 */
@property (nonatomic, retain) NSString *policyName;

/**
 * The time period in seconds after which the cookie should be considered
 * stale. Not specifying this parameter indicates that the sticky session
 * will last for the duration of the browser session.
 */
@property (nonatomic, retain) NSNumber *cookieExpirationPeriod;


/**
 * Default constructor for a new CreateLBCookieStickinessPolicyRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new CreateLBCookieStickinessPolicyRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The name associated with the LoadBalancer.
 * The name must be unique within the client AWS account.
 * @param thePolicyName The name of the policy being created. The name
 * must be unique within the set of policies for this LoadBalancer.
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andPolicyName:(NSString *)thePolicyName;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
