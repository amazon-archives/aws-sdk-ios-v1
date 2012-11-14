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

#import "EC2Filter.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Describe Reserved Instances Offerings Request
 */

@interface EC2DescribeReservedInstancesOfferingsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *reservedInstancesOfferingIds;
    NSString       *instanceType;
    NSString       *availabilityZone;
    NSString       *productDescription;
    NSMutableArray *filters;
    NSString       *instanceTenancy;
    NSString       *offeringType;
    NSString       *nextToken;
    NSNumber       *maxResults;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * An optional list of the unique IDs of the Reserved Instance offerings
 * to describe.
 */
@property (nonatomic, retain) NSMutableArray *reservedInstancesOfferingIds;

/**
 * The instance type on which the Reserved Instance can be used.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>t1.micro, m1.small, m1.medium, m1.large, m1.xlarge, m2.xlarge, m2.2xlarge, m2.4xlarge, c1.medium, c1.xlarge, hi1.4xlarge, cc1.4xlarge, cc2.8xlarge, cg1.4xlarge
 */
@property (nonatomic, retain) NSString *instanceType;

/**
 * The Availability Zone in which the Reserved Instance can be used.
 */
@property (nonatomic, retain) NSString *availabilityZone;

/**
 * The Reserved Instance product description.
 */
@property (nonatomic, retain) NSString *productDescription;

/**
 * A list of filters used to match properties for
 * ReservedInstancesOfferings. For a complete reference to the available
 * filter keys for this operation, see the <a
 * "http://docs.amazonwebservices.com/AWSEC2/latest/APIReference/">Amazon
 * EC2 API reference</a>.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * The tenancy of the Reserved Instance offering. A Reserved Instance
 * with tenancy of dedicated will run on single-tenant hardware and can
 * only be launched within a VPC.
 */
@property (nonatomic, retain) NSString *instanceTenancy;

/**
 * The Reserved Instance offering type.
 */
@property (nonatomic, retain) NSString *offeringType;

/**
 * The value of the NextToken property for this object.
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * The value of the MaxResults property for this object.
 */
@property (nonatomic, retain) NSNumber *maxResults;

/**
 * Adds a single object to reservedInstancesOfferingIds.
 * This function will alloc and init reservedInstancesOfferingIds if not already done.
 */
-(void)addReservedInstancesOfferingId:(NSString *)reservedInstancesOfferingIdObject;

/**
 * Adds a single object to filters.
 * This function will alloc and init filters if not already done.
 */
-(void)addFilter:(EC2Filter *)filterObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
