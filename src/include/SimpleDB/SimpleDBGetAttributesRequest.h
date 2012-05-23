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


#import "../AmazonServiceRequestConfig.h"



/**
 * Get Attributes Request
 */

@interface SimpleDBGetAttributesRequest:AmazonServiceRequestConfig

{
    NSString       *domainName;
    NSString       *itemName;
    NSMutableArray *attributeNames;
    bool           consistentRead;
    bool           consistentReadIsSet;
}



/**
 * The name of the domain in which to perform the operation.
 */
@property (nonatomic, retain) NSString *domainName;

/**
 * The name of the item.
 */
@property (nonatomic, retain) NSString *itemName;

/**
 * The names of the attributes.
 */
@property (nonatomic, retain) NSMutableArray *attributeNames;

/**
 * Determines whether or not strong consistency should be enforced when
 * data is read from SimpleDB. If <code>true</code>, any data previously
 * written to SimpleDB will be returned. Otherwise, results will be
 * consistent eventually, and the client may not see data that was
 * written immediately before your read.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;


/**
 * Default constructor for a new GetAttributesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new GetAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theDomainName The name of the domain in which to perform the
 * operation.
 * @param theItemName The name of the item.
 */
-(id)initWithDomainName:(NSString *)theDomainName andItemName:(NSString *)theItemName;

/**
 * Adds a single object to attributeNames.
 * This function will alloc and init attributeNames if not already done.
 */
-(void)addAttributeName:(NSString *)attributeNameObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
