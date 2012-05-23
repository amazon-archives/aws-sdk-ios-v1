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

#import "SimpleDBItem.h"

#import "SimpleDBResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "SimpleDBInvalidParameterValueException.h"
#import "SimpleDBInvalidQueryExpressionException.h"
#import "SimpleDBRequestTimeoutException.h"
#import "SimpleDBInvalidNumberPredicatesException.h"
#import "SimpleDBNoSuchDomainException.h"
#import "SimpleDBInvalidNextTokenException.h"
#import "SimpleDBTooManyRequestedAttributesException.h"
#import "SimpleDBMissingParameterException.h"
#import "SimpleDBInvalidNumberValueTestsException.h"


/**
 * Select Result
 */

@interface SimpleDBSelectResponse:SimpleDBResponse

{
    NSMutableArray *items;
    NSString       *nextToken;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A list of items that match the select expression.
 */
@property (nonatomic, retain) NSMutableArray *items;

/**
 * An opaque token indicating that more items than
 * <code>MaxNumberOfItems</code> were matched, the response size exceeded
 * 1 megabyte, or the execution time exceeded 5 seconds.
 */
@property (nonatomic, retain) NSString *nextToken;



/**
 * Returns a value from the items array for the specified index
 */
-(SimpleDBItem *)itemsObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
