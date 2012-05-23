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
 * Describe Security Groups Request
 */

@interface EC2DescribeSecurityGroupsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *groupNames;
    NSMutableArray *groupIds;
    NSMutableArray *filters;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The optional list of Amazon EC2 security groups to describe.
 */
@property (nonatomic, retain) NSMutableArray *groupNames;

/**
 * The value of the GroupIds property for this object.
 */
@property (nonatomic, retain) NSMutableArray *groupIds;

/**
 * A list of filters used to match properties for SecurityGroups. For a
 * complete reference to the available filter keys for this operation,
 * see the <a
 * "http://docs.amazonwebservices.com/AWSEC2/latest/APIReference/">Amazon
 * EC2 API reference</a>.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * Adds a single object to groupNames.
 * This function will alloc and init groupNames if not already done.
 */
-(void)addGroupName:(NSString *)groupNameObject;

/**
 * Adds a single object to groupIds.
 * This function will alloc and init groupIds if not already done.
 */
-(void)addGroupId:(NSString *)groupIdObject;

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
