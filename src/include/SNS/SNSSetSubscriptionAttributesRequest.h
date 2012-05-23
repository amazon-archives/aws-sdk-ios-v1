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
 * Set Subscription Attributes Request
 */

@interface SNSSetSubscriptionAttributesRequest:AmazonServiceRequestConfig

{
    NSString *subscriptionArn;
    NSString *attributeName;
    NSString *attributeValue;
}



/**
 * The ARN of the subscription to modify.
 */
@property (nonatomic, retain) NSString *subscriptionArn;

/**
 * The name of the attribute you want to set. Only a subset of the
 * subscriptions attributes are mutable. <p>Valid values: DeliveryPolicy
 */
@property (nonatomic, retain) NSString *attributeName;

/**
 * The new value for the attribute.
 */
@property (nonatomic, retain) NSString *attributeValue;


/**
 * Default constructor for a new SetSubscriptionAttributesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new SetSubscriptionAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSubscriptionArn The ARN of the subscription to modify.
 * @param theAttributeName The name of the attribute you want to set.
 * Only a subset of the subscriptions attributes are mutable. <p>Valid
 * values: DeliveryPolicy
 * @param theAttributeValue The new value for the attribute.
 */
-(id)initWithSubscriptionArn:(NSString *)theSubscriptionArn andAttributeName:(NSString *)theAttributeName andAttributeValue:(NSString *)theAttributeValue;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
