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
 * Report Instance Status Request
 */

@interface EC2ReportInstanceStatusRequest:AmazonServiceRequestConfig

{
    NSMutableArray *instances;
    NSString       *status;
    NSDate         *startTime;
    NSDate         *endTime;
    NSMutableArray *reasonCodes;
    NSString       *descriptionValue;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The value of the Instances property for this object.
 */
@property (nonatomic, retain) NSMutableArray *instances;

/**
 * The value of the Status property for this object.
 */
@property (nonatomic, retain) NSString *status;

/**
 * The value of the StartTime property for this object.
 */
@property (nonatomic, retain) NSDate *startTime;

/**
 * The value of the EndTime property for this object.
 */
@property (nonatomic, retain) NSDate *endTime;

/**
 * The value of the ReasonCodes property for this object.
 */
@property (nonatomic, retain) NSMutableArray *reasonCodes;

/**
 * The value of the Description property for this object.
 */
@property (nonatomic, retain) NSString *descriptionValue;

/**
 * Adds a single object to instances.
 * This function will alloc and init instances if not already done.
 */
-(void)addInstance:(NSString *)instanceObject;

/**
 * Adds a single object to reasonCodes.
 * This function will alloc and init reasonCodes if not already done.
 */
-(void)addReasonCode:(NSString *)reasonCodeObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
