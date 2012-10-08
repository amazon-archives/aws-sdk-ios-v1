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

#import "EC2InstanceCount.h"
#import "EC2PriceSchedule.h"
#import "EC2Tag.h"



/**
 * Reserved Instances Listing
 */

@interface EC2ReservedInstancesListing:NSObject

{
    NSString       *reservedInstancesListingId;
    NSString       *reservedInstancesId;
    NSDate         *createDate;
    NSDate         *updateDate;
    NSString       *status;
    NSString       *statusMessage;
    NSMutableArray *instanceCounts;
    NSMutableArray *priceSchedules;
    NSMutableArray *tags;
    NSString       *clientToken;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the ReservedInstancesListingId property for this object.
 */
@property (nonatomic, retain) NSString *reservedInstancesListingId;

/**
 * The value of the ReservedInstancesId property for this object.
 */
@property (nonatomic, retain) NSString *reservedInstancesId;

/**
 * The value of the CreateDate property for this object.
 */
@property (nonatomic, retain) NSDate *createDate;

/**
 * The value of the UpdateDate property for this object.
 */
@property (nonatomic, retain) NSDate *updateDate;

/**
 * The value of the Status property for this object.
 */
@property (nonatomic, retain) NSString *status;

/**
 * The value of the StatusMessage property for this object.
 */
@property (nonatomic, retain) NSString *statusMessage;

/**
 * The value of the InstanceCounts property for this object.
 */
@property (nonatomic, retain) NSMutableArray *instanceCounts;

/**
 * The value of the PriceSchedules property for this object.
 */
@property (nonatomic, retain) NSMutableArray *priceSchedules;

/**
 * The value of the Tags property for this object.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * The value of the ClientToken property for this object.
 */
@property (nonatomic, retain) NSString *clientToken;

/**
 * Adds a single object to instanceCounts.
 * This function will alloc and init instanceCounts if not already done.
 */
-(void)addInstanceCount:(EC2InstanceCount *)instanceCountObject;

/**
 * Adds a single object to priceSchedules.
 * This function will alloc and init priceSchedules if not already done.
 */
-(void)addPriceSchedule:(EC2PriceSchedule *)priceScheduleObject;

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
