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
 * Create Spot Datafeed Subscription Request
 */

@interface EC2CreateSpotDatafeedSubscriptionRequest:AmazonServiceRequestConfig

{
    NSString *bucket;
    NSString *prefix;
}



/**
 * The Amazon S3 bucket in which to store the Spot Instance datafeed.
 */
@property (nonatomic, retain) NSString *bucket;

/**
 * The prefix that is prepended to datafeed files.
 */
@property (nonatomic, retain) NSString *prefix;


/**
 * Default constructor for a new CreateSpotDatafeedSubscriptionRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new CreateSpotDatafeedSubscriptionRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theBucket The Amazon S3 bucket in which to store the Spot
 * Instance datafeed.
 */
-(id)initWithBucket:(NSString *)theBucket;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
