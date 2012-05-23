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

#import "EC2SpotInstanceStateFault.h"



/**
 * Spot Datafeed Subscription
 */

@interface EC2SpotDatafeedSubscription:NSObject

{
    NSString                  *ownerId;
    NSString                  *bucket;
    NSString                  *prefix;
    NSString                  *state;
    EC2SpotInstanceStateFault *fault;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Specifies the AWS account ID of the account.
 */
@property (nonatomic, retain) NSString *ownerId;

/**
 * Specifies the Amazon S3 bucket where the Spot Instance data feed is
 * located.
 */
@property (nonatomic, retain) NSString *bucket;

/**
 * Contains the prefix that is prepended to data feed files.
 */
@property (nonatomic, retain) NSString *prefix;

/**
 * Specifies the state of the Spot Instance request.
 */
@property (nonatomic, retain) NSString *state;

/**
 * Specifies a fault code for the Spot Instance request, if present.
 */
@property (nonatomic, retain) EC2SpotInstanceStateFault *fault;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
