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
#import "EC2CreateVolumePermission.h"



/**
 * Create Volume Permission Modifications
 */

@interface EC2CreateVolumePermissionModifications:NSObject

{
    NSMutableArray *add;
    NSMutableArray *remove;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Add property for this object.
 */
@property (nonatomic, retain) NSMutableArray *add;

/**
 * The value of the Remove property for this object.
 */
@property (nonatomic, retain) NSMutableArray *remove;

/**
 * Adds a single object to add.
 * This function will alloc and init add if not already done.
 */
-(void)addAdd:(EC2CreateVolumePermission *)addObject;

/**
 * Adds a single object to remove.
 * This function will alloc and init remove if not already done.
 */
-(void)addRemove:(EC2CreateVolumePermission *)removeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
