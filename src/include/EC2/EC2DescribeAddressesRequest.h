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
 * Describe Addresses Request
 */

@interface EC2DescribeAddressesRequest:AmazonServiceRequestConfig

{
    NSMutableArray *publicIps;
    NSMutableArray *filters;
    NSMutableArray *allocationIds;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The optional list of Elastic IP addresses to describe.
 */
@property (nonatomic, retain) NSMutableArray *publicIps;

/**
 * A list of filters used to match properties for Addresses. For a
 * complete reference to the available filter keys for this operation,
 * see the <a
 * "http://docs.amazonwebservices.com/AWSEC2/latest/APIReference/">Amazon
 * EC2 API reference</a>.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * The value of the AllocationIds property for this object.
 */
@property (nonatomic, retain) NSMutableArray *allocationIds;

/**
 * Adds a single object to publicIps.
 * This function will alloc and init publicIps if not already done.
 */
-(void)addPublicIp:(NSString *)publicIpObject;

/**
 * Adds a single object to filters.
 * This function will alloc and init filters if not already done.
 */
-(void)addFilter:(EC2Filter *)filterObject;

/**
 * Adds a single object to allocationIds.
 * This function will alloc and init allocationIds if not already done.
 */
-(void)addAllocationId:(NSString *)allocationIdObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
