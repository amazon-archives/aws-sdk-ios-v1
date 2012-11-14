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

#import "EC2SpotInstanceStateFault.h"
#import "EC2SpotInstanceStatus.h"
#import "EC2LaunchSpecification.h"
#import "EC2Tag.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Spot Instance Request
 */

@interface EC2SpotInstanceRequest:AmazonServiceRequestConfig

{
    NSString                  *spotInstanceRequestId;
    NSString                  *spotPrice;
    NSString                  *type;
    NSString                  *state;
    EC2SpotInstanceStateFault *fault;
    EC2SpotInstanceStatus     *status;
    NSDate                    *validFrom;
    NSDate                    *validUntil;
    NSString                  *launchGroup;
    NSString                  *availabilityZoneGroup;
    EC2LaunchSpecification    *launchSpecification;
    NSString                  *instanceId;
    NSDate                    *createTime;
    NSString                  *productDescription;
    NSMutableArray            *tags;
    NSString                  *launchedAvailabilityZone;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the SpotInstanceRequestId property for this object.
 */
@property (nonatomic, retain) NSString *spotInstanceRequestId;

/**
 * The value of the SpotPrice property for this object.
 */
@property (nonatomic, retain) NSString *spotPrice;

/**
 * The value of the Type property for this object.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>one-time, persistent
 */
@property (nonatomic, retain) NSString *type;

/**
 * The value of the State property for this object.
 */
@property (nonatomic, retain) NSString *state;

/**
 * The value of the Fault property for this object.
 */
@property (nonatomic, retain) EC2SpotInstanceStateFault *fault;

/**
 * The value of the Status property for this object.
 */
@property (nonatomic, retain) EC2SpotInstanceStatus *status;

/**
 * The value of the ValidFrom property for this object.
 */
@property (nonatomic, retain) NSDate *validFrom;

/**
 * The value of the ValidUntil property for this object.
 */
@property (nonatomic, retain) NSDate *validUntil;

/**
 * The value of the LaunchGroup property for this object.
 */
@property (nonatomic, retain) NSString *launchGroup;

/**
 * The value of the AvailabilityZoneGroup property for this object.
 */
@property (nonatomic, retain) NSString *availabilityZoneGroup;

/**
 * The LaunchSpecificationType data type.
 */
@property (nonatomic, retain) EC2LaunchSpecification *launchSpecification;

/**
 * The value of the InstanceId property for this object.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * The value of the CreateTime property for this object.
 */
@property (nonatomic, retain) NSDate *createTime;

/**
 * The value of the ProductDescription property for this object.
 */
@property (nonatomic, retain) NSString *productDescription;

/**
 * A list of tags for this spot instance request.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * The Availability Zone in which the bid is launched.
 */
@property (nonatomic, retain) NSString *launchedAvailabilityZone;

/**
 * Adds a single object to tags.
 * This function will alloc and init tags if not already done.
 */
-(void)addTag:(EC2Tag *)tagObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
