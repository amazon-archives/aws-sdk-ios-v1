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


#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Confirm Subscription Request
 */

@interface SNSConfirmSubscriptionRequest:AmazonServiceRequestConfig

{
    NSString *topicArn;
    NSString *token;
    NSString *authenticateOnUnsubscribe;
}



/**
 * The ARN of the topic for which you wish to confirm a subscription.
 */
@property (nonatomic, retain) NSString *topicArn;

/**
 * Short-lived token sent to an endpoint during the
 * <code>Subscribe</code> action.
 */
@property (nonatomic, retain) NSString *token;

/**
 * Disallows unauthenticated unsubscribes of the subscription. If the
 * value of this parameter is <code>true</code> and the request has an
 * AWS signature, then only the topic owner and the subscription owner
 * can unsubscribe the endpoint. The unsubscribe action requires AWS
 * authentication.
 */
@property (nonatomic, retain) NSString *authenticateOnUnsubscribe;


/**
 * Default constructor for a new ConfirmSubscriptionRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ConfirmSubscriptionRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The ARN of the topic for which you wish to confirm
 * a subscription.
 * @param theToken Short-lived token sent to an endpoint during the
 * <code>Subscribe</code> action.
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andToken:(NSString *)theToken;

/**
 * Constructs a new ConfirmSubscriptionRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The ARN of the topic for which you wish to confirm
 * a subscription.
 * @param theToken Short-lived token sent to an endpoint during the
 * <code>Subscribe</code> action.
 * @param theAuthenticateOnUnsubscribe Disallows unauthenticated
 * unsubscribes of the subscription. If the value of this parameter is
 * <code>true</code> and the request has an AWS signature, then only the
 * topic owner and the subscription owner can unsubscribe the endpoint.
 * The unsubscribe action requires AWS authentication.
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andToken:(NSString *)theToken andAuthenticateOnUnsubscribe:(NSString *)theAuthenticateOnUnsubscribe;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
