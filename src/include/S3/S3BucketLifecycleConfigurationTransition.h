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

#import <Foundation/Foundation.h>

/**
 * A Lifecycle transition is a comprised of a target storage class and 
 * a time, either expressed in an age, or an explicit date.
 */
@interface S3BucketLifecycleConfigurationTransition:NSObject {
    NSString *storageClass;
    NSString *transitionDays;
    NSDate   *transitionDate;
    
}

/** The storage class for this transition. Currently only 'GLACIER' is supported. **/
@property (nonatomic, retain) NSString *storageClass;

/** The time for this transition in days **/
@property (nonatomic, assign) NSInteger transitionDays;

/** 
 * The date for this transition as an absolute date.
 * If transitionDays is non-zero, this property will be
 * ignored.
 **/
@property (nonatomic, retain) NSDate *transitionDate;

-(NSString *)toXml;

/** initializer that creates a new transition with a time in days **/
-(id)initWithTimeInDays:(NSInteger)theDays;

/** initializer that creates a new transition with an explicit date **/
-(id)initWithDate:(NSDate *)theDate;

@end
