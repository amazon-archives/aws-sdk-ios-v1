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
 * Short-lived token sent to an endpoint during the Subscribe action.
 */
@property (nonatomic, retain) NSString *token;

/**
 * Indicates that you want to disallow unauthenticated unsubscribes of
 * the subscription. If value of this parameter is "true" and the request
 * has an AWS signature then only the topic owner and the subscription
 * owner will be permitted to unsubscribe the endpoint. The unsubscribe
 * action will require AWS authentication.
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
 * Subscribe action.
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andToken:(NSString *)theToken;

/**
 * Constructs a new ConfirmSubscriptionRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The ARN of the topic for which you wish to confirm
 * a subscription.
 * @param theToken Short-lived token sent to an endpoint during the
 * Subscribe action.
 * @param theAuthenticateOnUnsubscribe Indicates that you want to
 * disallow unauthenticated unsubscribes of the subscription. If value of
 * this parameter is "true" and the request has an AWS signature then
 * only the topic owner and the subscription owner will be permitted to
 * unsubscribe the endpoint. The unsubscribe action will require AWS
 * authentication.
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
