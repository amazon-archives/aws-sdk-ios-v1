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

#import "EC2Filter.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Describe Images Request
 */

@interface EC2DescribeImagesRequest:AmazonServiceRequestConfig

{
    BOOL           dryRun;
    BOOL           dryRunIsSet;
    NSMutableArray *imageIds;
    NSMutableArray *owners;
    NSMutableArray *executableUsers;
    NSMutableArray *filters;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the DryRun property for this object.
 */
@property (nonatomic) BOOL           dryRun;

@property (nonatomic, readonly) BOOL dryRunIsSet;

/**
 * An optional list of the AMI IDs to describe. If not specified, all
 * AMIs will be described.
 */
@property (nonatomic, retain) NSMutableArray *imageIds;

/**
 * An optional list of owners by which to scope the described AMIs. Valid
 * values are: <ul> <li> <code>self</code> : AMIs owned by you </li> <li>
 * <i>AWS account ID</i> : AMIs owned by this account ID </li> <li>
 * <code>aws-marketplace</code> : AMIs owned by the AWS Marketplace </li>
 * <li> <code>amazon</code> : AMIs owned by Amazon </li> <li>
 * <code>all</code> : Do not scope the AMIs returned by owner </li> </ul>
 * <p> The values <code>self</code>, <code>aws-marketplace</code>,
 * <code>amazon</code>, and <code>all</code> are literals.
 */
@property (nonatomic, retain) NSMutableArray *owners;

/**
 * An optional list of users whose launch permissions will be used to
 * scope the described AMIs. Valid values are: <ul> <li>
 * <code>self</code> : AMIs for which you have explicit launch
 * permissions </li> <li> <code>AWS account ID</code> : AMIs for which
 * this account ID has launch permissions </li> <li> <code>all</code> :
 * AMIs that have public launch permissions </li> </ul> <p> The values
 * <code>self</code> and <code>all</code> are literals.
 */
@property (nonatomic, retain) NSMutableArray *executableUsers;

/**
 * A list of filters used to match properties for Images. For a complete
 * reference to the available filter keys for this operation, see the <a
 * "http://docs.amazonwebservices.com/AWSEC2/latest/APIReference/">Amazon
 * EC2 API reference</a>.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * Adds a single object to imageIds.
 * This function will alloc and init imageIds if not already done.
 */
-(void)addImageId:(NSString *)imageIdObject;

/**
 * Adds a single object to owners.
 * This function will alloc and init owners if not already done.
 */
-(void)addOwner:(NSString *)ownerObject;

/**
 * Adds a single object to executableUsers.
 * This function will alloc and init executableUsers if not already done.
 */
-(void)addExecutableUser:(NSString *)executableUserObject;

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
