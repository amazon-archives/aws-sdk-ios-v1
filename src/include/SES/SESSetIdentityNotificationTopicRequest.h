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
 * Set Identity Notification Topic Request
 */

@interface SESSetIdentityNotificationTopicRequest:AmazonServiceRequestConfig

{
    NSString *identity;
    NSString *notificationType;
    NSString *snsTopic;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The identity for which the topic will be set. Examples:
 * <code>user@example.com</code>, <code>example.com</code>.
 */
@property (nonatomic, retain) NSString *identity;

/**
 * The type of feedback notifications that will be published to the
 * specified topic.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Allowed Values: </b>Bounce, Complaint
 */
@property (nonatomic, retain) NSString *notificationType;

/**
 * The Amazon Resource Name (ARN) of the Amazon Simple Notification
 * Service (Amazon SNS) topic. If the parameter is ommited from the
 * request or a null value is passed, the topic is cleared and publishing
 * is disabled.
 */
@property (nonatomic, retain) NSString *snsTopic;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
