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

#import "EC2ReservedInstancesId.h"
#import "EC2ReservedInstancesModificationResult.h"



/**
 * Reserved Instances Modification
 */

@interface EC2ReservedInstancesModification:NSObject

{
    NSString       *reservedInstancesModificationId;
    NSMutableArray *reservedInstancesIds;
    NSMutableArray *modificationResults;
    NSDate         *createDate;
    NSDate         *updateDate;
    NSDate         *effectiveDate;
    NSString       *status;
    NSString       *statusMessage;
    NSString       *clientToken;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The unique ID for the submitted modification request.
 */
@property (nonatomic, retain) NSString *reservedInstancesModificationId;

/**
 * The IDs of the Reserved Instances submitted for modification.
 */
@property (nonatomic, retain) NSMutableArray *reservedInstancesIds;

/**
 * The resulting information about the modified Reserved Instances.
 */
@property (nonatomic, retain) NSMutableArray *modificationResults;

/**
 * The time the modification request was created.
 */
@property (nonatomic, retain) NSDate *createDate;

/**
 * The time the modification request was last updated.
 */
@property (nonatomic, retain) NSDate *updateDate;

/**
 * The time the modification becomes effective.
 */
@property (nonatomic, retain) NSDate *effectiveDate;

/**
 * The status of the modification request, which can be any of the
 * following values: processing, fulfilled, failed.
 */
@property (nonatomic, retain) NSString *status;

/**
 * The reason for the status.
 */
@property (nonatomic, retain) NSString *statusMessage;

/**
 * The idempotency token for the modification request.
 */
@property (nonatomic, retain) NSString *clientToken;

/**
 * Adds a single object to reservedInstancesIds.
 * This function will alloc and init reservedInstancesIds if not already done.
 */
-(void)addReservedInstancesId:(EC2ReservedInstancesId *)reservedInstancesIdObject;

/**
 * Adds a single object to modificationResults.
 * This function will alloc and init modificationResults if not already done.
 */
-(void)addModificationResult:(EC2ReservedInstancesModificationResult *)modificationResultObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
