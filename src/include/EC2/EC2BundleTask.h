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

#import "EC2Storage.h"
#import "EC2BundleTaskError.h"



/**
 * Bundle Task
 */

@interface EC2BundleTask:NSObject

{
    NSString           *instanceId;
    NSString           *bundleId;
    NSString           *state;
    NSDate             *startTime;
    NSDate             *updateTime;
    EC2Storage         *storage;
    NSString           *progress;
    EC2BundleTaskError *bundleTaskError;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Instance associated with this bundle task.
 */
@property (nonatomic, retain) NSString *instanceId;

/**
 * Unique identifier for this task.
 */
@property (nonatomic, retain) NSString *bundleId;

/**
 * The state of this task.
 */
@property (nonatomic, retain) NSString *state;

/**
 * The time this task started.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The time of the most recent update for the task.
 */
@property (nonatomic, retain) NSDate *updateTime;

/**
 * Amazon S3 storage locations.
 */
@property (nonatomic, retain) EC2Storage *storage;

/**
 * The level of task completion, in percent (e.g., 20%).
 */
@property (nonatomic, retain) NSString *progress;

/**
 * If the task fails, a description of the error.
 */
@property (nonatomic, retain) EC2BundleTaskError *bundleTaskError;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
