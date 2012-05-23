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


#import "SNSResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "SNSNotFoundException.h"
#import "SNSAuthorizationErrorException.h"
#import "SNSInternalErrorException.h"
#import "SNSInvalidParameterException.h"


/**
 * Get Subscription Attributes Result
 */

@interface SNSGetSubscriptionAttributesResponse:SNSResponse

{
    NSMutableDictionary *attributes;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A map of the subscription's attributes. Attributes in this map include
 * the following: <ul> <li>SubscriptionArn -- the subscription's ARN</li>
 * <li>TopicArn -- the topic ARN which the subscription is associated
 * with</li> <li>Owner -- the AWS account ID of the subscription's
 * owner</li> <li>ConfirmationWasAuthenticated -- True if the
 * subscription confirmation request was authenticated</li>
 * <li>DeliveryPolicy -- the JSON serialization of the subscription's
 * delivery policy</li> <li>EffectiveDeliveryPolicy -- the JSON
 * serialization of the effective delivery policy which takes into the
 * topic delivery policy and account system defaults</li> </ul>
 */
@property (nonatomic, retain) NSMutableDictionary *attributes;

/**
 * Returns a value from the attributes dictionary for the specified key.
 */
-(NSString *)attributesValueForKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
