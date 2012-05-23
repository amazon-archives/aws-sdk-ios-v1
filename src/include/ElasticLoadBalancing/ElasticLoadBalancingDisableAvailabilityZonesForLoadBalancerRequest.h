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
 * Disable Availability Zones For Load Balancer Request
 */

@interface ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequest:AmazonServiceRequestConfig

{
    NSString       *loadBalancerName;
    NSMutableArray *availabilityZones;
}



/**
 * The name associated with the LoadBalancer. The name must be unique
 * within the client AWS account.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * A list of Availability Zones to be removed from the LoadBalancer.
 * <note> There must be at least one Availability Zone registered with a
 * LoadBalancer at all times. The client cannot remove all the
 * Availability Zones from a LoadBalancer. Specified Availability Zones
 * must be in the same Region. </note>
 */
@property (nonatomic, retain) NSMutableArray *availabilityZones;


/**
 * Default constructor for a new DisableAvailabilityZonesForLoadBalancerRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DisableAvailabilityZonesForLoadBalancerRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The name associated with the LoadBalancer.
 * The name must be unique within the client AWS account.
 * @param theAvailabilityZones A list of Availability Zones to be removed
 * from the LoadBalancer. <note> There must be at least one Availability
 * Zone registered with a LoadBalancer at all times. The client cannot
 * remove all the Availability Zones from a LoadBalancer. Specified
 * Availability Zones must be in the same Region. </note>
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andAvailabilityZones:(NSMutableArray *)theAvailabilityZones;

/**
 * Adds a single object to availabilityZones.
 * This function will alloc and init availabilityZones if not already done.
 */
-(void)addAvailabilityZone:(NSString *)availabilityZoneObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
