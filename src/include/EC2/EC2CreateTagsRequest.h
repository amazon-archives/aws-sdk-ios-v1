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

#import "../AmazonServiceRequestConfig.h"



/**
 * Create Tags Request
 */

@interface EC2CreateTagsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *resources;
    NSMutableArray *tags;
}



/**
 * One or more IDs of resources to tag. This could be the ID of an AMI,
 * an instance, an EBS volume, or snapshot, etc.
 */
@property (nonatomic, retain) NSMutableArray *resources;

/**
 * The tags to add or overwrite for the specified resources. Each tag
 * item consists of a key-value pair.
 */
@property (nonatomic, retain) NSMutableArray *tags;


/**
 * Default constructor for a new CreateTagsRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new CreateTagsRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theResources One or more IDs of resources to tag. This could be
 * the ID of an AMI, an instance, an EBS volume, or snapshot, etc.
 * @param theTags The tags to add or overwrite for the specified
 * resources. Each tag item consists of a key-value pair.
 */
-(id)initWithResources:(NSMutableArray *)theResources andTags:(NSMutableArray *)theTags;

/**
 * Adds a single object to resources.
 * This function will alloc and init resources if not already done.
 */
-(void)addResource:(NSString *)resourceObject;

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
