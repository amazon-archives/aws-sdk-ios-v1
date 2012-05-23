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

#import "EC2LicenseCapacity.h"
#import "EC2Tag.h"



/**
 * License
 */

@interface EC2License:NSObject

{
    NSString       *licenseId;
    NSString       *type;
    NSString       *pool;
    NSMutableArray *capacities;
    NSMutableArray *tags;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The unique ID identifying the license.
 */
@property (nonatomic, retain) NSString *licenseId;

/**
 * The license type (ex. "Microsoft/Windows/Standard").
 */
@property (nonatomic, retain) NSString *type;

/**
 * The name of the pool in which the license is kept.
 */
@property (nonatomic, retain) NSString *pool;

/**
 * The capacities available for this license, indicating how many
 * licenses are in use, how many are available, how many Amazon EC2
 * instances can be supported, etc.
 */
@property (nonatomic, retain) NSMutableArray *capacities;

/**
 * A list of tags for the License.
 */
@property (nonatomic, retain) NSMutableArray *tags;

/**
 * Adds a single object to capacities.
 * This function will alloc and init capacities if not already done.
 */
-(void)addCapacity:(EC2LicenseCapacity *)capacityObject;

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
