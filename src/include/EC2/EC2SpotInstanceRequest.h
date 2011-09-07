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

#import "EC2SpotInstanceStateFault.h"
#import "EC2LaunchSpecification.h"
#import "EC2Tag.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Spot Instance Request
 *
 * \ingroup EC2
 */

@interface EC2SpotInstanceRequest:AmazonServiceRequestConfig

{
    NSString                  *spotInstanceRequestId;
    NSString                  *spotPrice;
    NSString                  *type;
    NSString                  *state;
    EC2SpotInstanceStateFault *fault;
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

@property (nonatomic, retain) NSString                  *spotInstanceRequestId;

@property (nonatomic, retain) NSString                  *spotPrice;

@property (nonatomic, retain) NSString                  *type;

@property (nonatomic, retain) NSString                  *state;

@property (nonatomic, retain) EC2SpotInstanceStateFault *fault;

@property (nonatomic, retain) NSDate                    *validFrom;

@property (nonatomic, retain) NSDate                    *validUntil;

@property (nonatomic, retain) NSString                  *launchGroup;

@property (nonatomic, retain) NSString                  *availabilityZoneGroup;

/**
 * The LaunchSpecificationType data type.
 */
@property (nonatomic, retain) EC2LaunchSpecification *launchSpecification;

@property (nonatomic, retain) NSString               *instanceId;

@property (nonatomic, retain) NSDate                 *createTime;

@property (nonatomic, retain) NSString               *productDescription;

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
