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

#import "S3BucketLifecycleConfigurationTransition.h"

#define S3_BUCKET_LIFECYCLE_RULE_ENABLED @"Enabled"
#define S3_BUCKET_LIFECYCLE_RULE_DISABLED @"Disabled"

/**
 *
 */
@interface S3BucketLifecycleConfigurationRule:NSObject {
    NSString  *ruleId;
    NSString  *status;
    NSString  *prefix;
    NSInteger expirationInDays;
    NSDate    *expirationDate;
    NSArray   *transitions;
}

/** The id for this rule **/
@property (nonatomic, retain) NSString *ruleId;

/** The status for this rule **/
@property (nonatomic, retain) NSString *status;

/** The object key prefix for this rule **/
@property (nonatomic, retain) NSString *prefix;

/** The expiration time for this rule in days **/
@property (nonatomic, assign) NSInteger expirationInDays;

/** 
 * The expiration date for this rule as an absolute date.
 * If expirationInDays is non-zero, this property will be
 * ignored.
 **/
@property (nonatomic, retain) NSDate *expirationDate;

/** 
 * The list of storage class transitions.
 * Currently only one transition is supported.
 **/
@property (nonatomic, retain) NSArray *transitions;

-(NSString *)toXml;

/** initializer that creates a new rule with no expiration **/
-(id)initWithId:(NSString *)theRuleId andPrefix:(NSString *)thePrefix andStatus:(NSString *)theStatus;

/** initializer that creates a new rule with an expiration in days **/
-(id)initWithId:(NSString *)theRuleId andPrefix:(NSString *)thePrefix andExpirationInDays:(NSInteger)theExpiration andStatus:(NSString *)theStatus;

/** initializer that creates a new rule with an expiration date **/
-(id)initWithId:(NSString *)theRuleId andPrefix:(NSString *)thePrefix andExpirationDate:(NSDate *) theExpirationDate andStatus:(NSString *)theStatus;

/** Helper function to for boolean status **/
-(BOOL)isEnabled;

@end
