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


#import "SimpleDBResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "SimpleDBNoSuchDomainException.h"
#import "SimpleDBMissingParameterException.h"


/**
 * Domain Metadata Result
 */

@interface SimpleDBDomainMetadataResponse:SimpleDBResponse

{
    NSNumber *itemCount;
    NSNumber *itemNamesSizeBytes;
    NSNumber *attributeNameCount;
    NSNumber *attributeNamesSizeBytes;
    NSNumber *attributeValueCount;
    NSNumber *attributeValuesSizeBytes;
    NSNumber *timestamp;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The number of all items in the domain.
 */
@property (nonatomic, retain) NSNumber *itemCount;

/**
 * The total size of all item names in the domain, in bytes.
 */
@property (nonatomic, retain) NSNumber *itemNamesSizeBytes;

/**
 * The number of unique attribute names in the domain.
 */
@property (nonatomic, retain) NSNumber *attributeNameCount;

/**
 * The total size of all unique attribute names in the domain, in bytes.
 */
@property (nonatomic, retain) NSNumber *attributeNamesSizeBytes;

/**
 * The number of all attribute name/value pairs in the domain.
 */
@property (nonatomic, retain) NSNumber *attributeValueCount;

/**
 * The total size of all attribute values in the domain, in bytes.
 */
@property (nonatomic, retain) NSNumber *attributeValuesSizeBytes;

/**
 * The data and time when metadata was calculated, in Epoch (UNIX)
 * seconds.
 */
@property (nonatomic, retain) NSNumber *timestamp;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
