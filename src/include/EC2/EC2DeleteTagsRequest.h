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
 * Delete Tags Request
 */

@interface EC2DeleteTagsRequest:AmazonServiceRequestConfig

{
    NSMutableArray *resources;
    NSMutableArray *tags;
}



/**
 * A list of one or more resource IDs. This could be the ID of an AMI, an
 * instance, an EBS volume, or snapshot, etc.
 */
@property (nonatomic, retain) NSMutableArray *resources;

/**
 * The tags to delete from the specified resources. Each tag item
 * consists of a key-value pair. <p> If a tag is specified without a
 * value, the tag and all of its values are deleted.
 */
@property (nonatomic, retain) NSMutableArray *tags;


/**
 * Default constructor for a new DeleteTagsRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeleteTagsRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theResources A list of one or more resource IDs. This could be
 * the ID of an AMI, an instance, an EBS volume, or snapshot, etc.
 */
-(id)initWithResources:(NSMutableArray *)theResources;

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
