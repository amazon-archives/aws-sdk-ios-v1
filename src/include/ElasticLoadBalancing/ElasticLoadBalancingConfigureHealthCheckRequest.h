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

#import "ElasticLoadBalancingHealthCheck.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Configure Health Check Request
 */

@interface ElasticLoadBalancingConfigureHealthCheckRequest:AmazonServiceRequestConfig

{
    NSString                        *loadBalancerName;
    ElasticLoadBalancingHealthCheck *healthCheck;
}



/**
 * The mnemonic name associated with the LoadBalancer. This name must be
 * unique within the client AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * A structure containing the configuration information for the new
 * healthcheck.
 */
@property (nonatomic, retain) ElasticLoadBalancingHealthCheck *healthCheck;


/**
 * Default constructor for a new ConfigureHealthCheckRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ConfigureHealthCheckRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The mnemonic name associated with the
 * LoadBalancer. This name must be unique within the client AWS account.
 * @param theHealthCheck A structure containing the configuration
 * information for the new healthcheck.
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andHealthCheck:(ElasticLoadBalancingHealthCheck *)theHealthCheck;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
