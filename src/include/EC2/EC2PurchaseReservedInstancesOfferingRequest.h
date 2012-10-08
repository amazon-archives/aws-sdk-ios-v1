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

#import "EC2ReservedInstanceLimitPrice.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Purchase Reserved Instances Offering Request
 */

@interface EC2PurchaseReservedInstancesOfferingRequest:AmazonServiceRequestConfig

{
    NSString                      *reservedInstancesOfferingId;
    NSNumber                      *instanceCount;
    EC2ReservedInstanceLimitPrice *limitPrice;
}



/**
 * The unique ID of the Reserved Instances offering being purchased.
 */
@property (nonatomic, retain) NSString *reservedInstancesOfferingId;

/**
 * The number of Reserved Instances to purchase.
 */
@property (nonatomic, retain) NSNumber *instanceCount;

/**
 * The value of the LimitPrice property for this object.
 */
@property (nonatomic, retain) EC2ReservedInstanceLimitPrice *limitPrice;


/**
 * Default constructor for a new PurchaseReservedInstancesOfferingRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new PurchaseReservedInstancesOfferingRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theReservedInstancesOfferingId The unique ID of the Reserved
 * Instances offering being purchased.
 * @param theInstanceCount The number of Reserved Instances to purchase.
 */
-(id)initWithReservedInstancesOfferingId:(NSString *)theReservedInstancesOfferingId andInstanceCount:(NSNumber *)theInstanceCount;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
