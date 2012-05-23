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

#import "EC2CreateVolumePermission.h"
#import "EC2ProductCode.h"

#import "EC2Response.h"
#import "../AmazonServiceExceptionUnmarshaller.h"



/**
 * Describe Snapshot Attribute Response
 */

@interface EC2DescribeSnapshotAttributeResponse:EC2Response

{
    NSString       *snapshotId;
    NSMutableArray *createVolumePermissions;
    NSMutableArray *productCodes;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The ID of the snapshot whose attribute is being described.
 */
@property (nonatomic, retain) NSString *snapshotId;

/**
 * The list of permissions describing who can create a volume from the
 * associated EBS snapshot. <p> Only available if the
 * createVolumePermission attribute is requested.
 */
@property (nonatomic, retain) NSMutableArray *createVolumePermissions;

/**
 * The value of the ProductCodes property for this object.
 */
@property (nonatomic, retain) NSMutableArray *productCodes;



/**
 * Returns a value from the createVolumePermissions array for the specified index
 */
-(EC2CreateVolumePermission *)createVolumePermissionsObjectAtIndex:(int)index;



/**
 * Returns a value from the productCodes array for the specified index
 */
-(EC2ProductCode *)productCodesObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
