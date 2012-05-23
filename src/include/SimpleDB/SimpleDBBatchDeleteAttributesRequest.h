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

#import "SimpleDBDeletableItem.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Batch Delete Attributes Request
 */

@interface SimpleDBBatchDeleteAttributesRequest:AmazonServiceRequestConfig

{
    NSString       *domainName;
    NSMutableArray *items;
}



/**
 * The name of the domain in which the attributes are being deleted.
 */
@property (nonatomic, retain) NSString *domainName;

/**
 * A list of items on which to perform the operation.
 */
@property (nonatomic, retain) NSMutableArray *items;


/**
 * Default constructor for a new BatchDeleteAttributesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new BatchDeleteAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain in which the attributes
 * are being deleted.
 * @param theItems A list of items on which to perform the operation.
 */
-(id)initWithDomainName:(NSString *)theDomainName andItems:(NSMutableArray *)theItems;

/**
 * Adds a single object to items.
 * This function will alloc and init items if not already done.
 */
-(void)addItem:(SimpleDBDeletableItem *)itemObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
