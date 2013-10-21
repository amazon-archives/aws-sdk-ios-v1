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
 * Describe Snapshots Request
 */

@interface EC2DescribeSnapshotsRequest:AmazonServiceRequestConfig

{
    BOOL           dryRun;
    BOOL           dryRunIsSet;
    NSMutableArray *snapshotIds;
    NSMutableArray *ownerIds;
    NSMutableArray *restorableByUserIds;
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
 * The optional list of EBS snapshot IDs to describe.
 */
@property (nonatomic, retain) NSMutableArray *snapshotIds;

/**
 * An optional list of owners by which to scope the described EBS
 * snapshots. Valid values are: <ul> <li> <code>self</code> : Snapshots
 * owned by you </li> <li> <i>AWS account ID</i> : Snapshots owned by
 * this account ID </li> <li> <code>amazon</code> : Snapshots owned by
 * Amazon </li> </ul> <p> The values <code>self</code> and
 * <code>amazon</code> are literals.
 */
@property (nonatomic, retain) NSMutableArray *ownerIds;

/**
 * An optional list of users. The described snapshots are scoped to only
 * those snapshots from which these users can create volumes.
 */
@property (nonatomic, retain) NSMutableArray *restorableByUserIds;

/**
 * A list of filters used to match properties for Snapshots. For a
 * complete reference to the available filter keys for this operation,
 * see the <a
 * "http://docs.amazonwebservices.com/AWSEC2/latest/APIReference/">Amazon
 * EC2 API reference</a>.
 */
@property (nonatomic, retain) NSMutableArray *filters;

/**
 * Adds a single object to snapshotIds.
 * This function will alloc and init snapshotIds if not already done.
 */
-(void)addSnapshotId:(NSString *)snapshotIdObject;

/**
 * Adds a single object to ownerIds.
 * This function will alloc and init ownerIds if not already done.
 */
-(void)addOwnerId:(NSString *)ownerIdObject;

/**
 * Adds a single object to restorableByUserIds.
 * This function will alloc and init restorableByUserIds if not already done.
 */
-(void)addRestorableByUserId:(NSString *)restorableByUserIdObject;

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
