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

#import "EC2LaunchSpecification.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Request Spot Instances Request
 */

@interface EC2RequestSpotInstancesRequest:AmazonServiceRequestConfig

{
    NSString               *spotPrice;
    NSNumber               *instanceCount;
    NSString               *type;
    NSDate                 *validFrom;
    NSDate                 *validUntil;
    NSString               *launchGroup;
    NSString               *availabilityZoneGroup;
    EC2LaunchSpecification *launchSpecification;
}



/**
 * Specifies the maximum hourly price for any Spot Instance launched to
 * fulfill the request.
 */
@property (nonatomic, retain) NSString *spotPrice;

/**
 * Specifies the maximum number of Spot Instances to launch.
 */
@property (nonatomic, retain) NSNumber *instanceCount;

/**
 * Specifies the Spot Instance type.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>one-time, persistent
 */
@property (nonatomic, retain) NSString *type;

/**
 * Defines the start date of the request. <p> If this is a one-time
 * request, the request becomes active at this date and time and remains
 * active until all instances launch, the request expires, or the request
 * is canceled. If the request is persistent, the request becomes active
 * at this date and time and remains active until it expires or is
 * canceled.
 */
@property (nonatomic, retain) NSDate *validFrom;

/**
 * End date of the request. <p> If this is a one-time request, the
 * request remains active until all instances launch, the request is
 * canceled, or this date is reached. If the request is persistent, it
 * remains active until it is canceled or this date and time is reached.
 */
@property (nonatomic, retain) NSDate *validUntil;

/**
 * Specifies the instance launch group. Launch groups are Spot Instances
 * that launch and terminate together.
 */
@property (nonatomic, retain) NSString *launchGroup;

/**
 * Specifies the Availability Zone group. <p> When specifying the same
 * Availability Zone group for all Spot Instance requests, all Spot
 * Instances are launched in the same Availability Zone.
 */
@property (nonatomic, retain) NSString *availabilityZoneGroup;

/**
 * Specifies additional launch instance information.
 */
@property (nonatomic, retain) EC2LaunchSpecification *launchSpecification;


/**
 * Default constructor for a new RequestSpotInstancesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new RequestSpotInstancesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSpotPrice Specifies the maximum hourly price for any Spot
 * Instance launched to fulfill the request.
 */
-(id)initWithSpotPrice:(NSString *)theSpotPrice;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
