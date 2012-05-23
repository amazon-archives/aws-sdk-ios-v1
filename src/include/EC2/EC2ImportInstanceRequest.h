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

#import "EC2ImportInstanceLaunchSpecification.h"
#import "EC2DiskImage.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Import Instance Request
 */

@interface EC2ImportInstanceRequest:AmazonServiceRequestConfig

{
    NSString                             *descriptionValue;
    EC2ImportInstanceLaunchSpecification *launchSpecification;
    NSMutableArray                       *diskImages;
    NSString                             *platform;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Description property for this object.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * The value of the LaunchSpecification property for this object.
 */
@property (nonatomic, retain) EC2ImportInstanceLaunchSpecification *launchSpecification;

/**
 * The value of the DiskImages property for this object.
 */
@property (nonatomic, retain) NSMutableArray *diskImages;

/**
 * The value of the Platform property for this object.
 */
@property (nonatomic, retain) NSString *platform;

/**
 * Adds a single object to diskImages.
 * This function will alloc and init diskImages if not already done.
 */
-(void)addDiskImage:(EC2DiskImage *)diskImageObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
