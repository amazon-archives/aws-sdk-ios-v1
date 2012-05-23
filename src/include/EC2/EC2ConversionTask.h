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

#import "EC2ImportInstanceTaskDetails.h"
#import "EC2ImportVolumeTaskDetails.h"
#import "EC2Tag.h"



/**
 * Conversion Task
 */

@interface EC2ConversionTask:NSObject

{
    NSString                     *conversionTaskId;
    NSString                     *expirationTime;
    EC2ImportInstanceTaskDetails *importInstance;
    EC2ImportVolumeTaskDetails   *importVolume;
    NSString                     *state;
    NSString                     *statusMessage;
    NSMutableArray               *tags;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the ConversionTaskId property for this object.
 */
@property (nonatomic, retain) NSString *conversionTaskId;

/**
 * The value of the ExpirationTime property for this object.
 */
@property (nonatomic, retain) NSString *expirationTime;

/**
 * The value of the ImportInstance property for this object.
 */
@property (nonatomic, retain) EC2ImportInstanceTaskDetails *importInstance;

/**
 * The value of the ImportVolume property for this object.
 */
@property (nonatomic, retain) EC2ImportVolumeTaskDetails *importVolume;

/**
 * The value of the State property for this object.
 */
@property (nonatomic, retain) NSString *state;

/**
 * The value of the StatusMessage property for this object.
 */
@property (nonatomic, retain) NSString *statusMessage;

/**
 * The value of the Tags property for this object.
 */
@property (nonatomic, retain) NSMutableArray *tags;

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
