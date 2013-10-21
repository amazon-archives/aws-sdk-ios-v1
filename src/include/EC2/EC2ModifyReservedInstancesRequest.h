/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "EC2ReservedInstancesConfiguration.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Modify Reserved Instances Request
 */

@interface EC2ModifyReservedInstancesRequest:AmazonServiceRequestConfig

{
    NSString       *clientToken;
    NSMutableArray *reservedInstancesIds;
    NSMutableArray *targetConfigurations;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A unique, case-sensitive, token you provide to ensure idempotency of
 * your modification request.
 */
@property (nonatomic, retain) NSString *clientToken;

/**
 * The IDs of the Reserved Instances to modify.
 */
@property (nonatomic, retain) NSMutableArray *reservedInstancesIds;

/**
 * The configuration settings for the Reserved Instances to modify.
 */
@property (nonatomic, retain) NSMutableArray *targetConfigurations;

/**
 * Adds a single object to reservedInstancesIds.
 * This function will alloc and init reservedInstancesIds if not already done.
 */
-(void)addReservedInstancesId:(NSString *)reservedInstancesIdObject;

/**
 * Adds a single object to targetConfigurations.
 * This function will alloc and init targetConfigurations if not already done.
 */
-(void)addTargetConfiguration:(EC2ReservedInstancesConfiguration *)targetConfigurationObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
