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

#import "EC2Tag.h"



/**
 * Snapshot
 */

@interface EC2Snapshot:NSObject

{
    NSString       *snapshotId;
    NSString       *volumeId;
    NSString       *state;
    NSDate         *startTime;
    NSString       *progress;
    NSString       *ownerId;
    NSString       *descriptionValue;
    NSNumber       *volumeSize;
    NSString       *ownerAlias;
    NSMutableArray *tags;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The unique ID of this snapshot.
 */
@property (nonatomic, retain) NSString *snapshotId;

/**
 * The ID of the volume from which this snapshot was created.
 */
@property (nonatomic, retain) NSString *volumeId;

/**
 * Snapshot state (e.g., pending, completed, or error).
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>pending, completed, error
 */
@property (nonatomic, retain) NSString *state;

/**
 * Time stamp when the snapshot was initiated.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The progress of the snapshot, in percentage.
 */
@property (nonatomic, retain) NSString *progress;

/**
 * AWS Access Key ID of the user who owns the snapshot.
 */
@property (nonatomic, retain) NSString *ownerId;

/**
 * Description of the snapshot.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The size of the volume, in gigabytes.
 */
@property (nonatomic, retain) NSNumber *volumeSize;

/**
 * The AWS account alias (e.g., "amazon", "redhat", "self", etc.) or AWS
 * account ID that owns the AMI.
 */
@property (nonatomic, retain) NSString *ownerAlias;

/**
 * A list of tags for the Snapshot.
 */
@property (nonatomic, retain) NSMutableArray *tags;

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
