/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "DynamoDBAttributeValue.h"



/**
 * Item Collection Metrics
 */

@interface DynamoDBItemCollectionMetrics:NSObject

{
    NSMutableDictionary *itemCollectionKey;
    NSMutableArray      *sizeEstimateRangeGB;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the ItemCollectionKey property for this object.
 */
@property (nonatomic, retain) NSMutableDictionary *itemCollectionKey;

/**
 * The value of the SizeEstimateRangeGB property for this object.
 */
@property (nonatomic, retain) NSMutableArray *sizeEstimateRangeGB;


/**
 * Set a value in the dictionary itemCollectionKey for the specified key.
 * This function will alloc and init itemCollectionKey if not already done.
 */
-(void)setItemCollectionKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey;

/**
 * Adds a single object to sizeEstimateRangeGB.
 * This function will alloc and init sizeEstimateRangeGB if not already done.
 */
-(void)addSizeEstimateRangeGB:(NSNumber *)sizeEstimateRangeGBObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
