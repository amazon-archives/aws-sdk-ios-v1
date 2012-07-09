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




/**
 * Identity Notification Attributes
 */

@interface SESIdentityNotificationAttributes:NSObject

{
    NSString *bounceTopic;
    NSString *complaintTopic;
    bool     forwardingEnabled;
    bool     forwardingEnabledIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The Amazon Resource Name (ARN) of the Amazon Simple Notification
 * Service (SNS) topic where Amazon SES will publish bounce
 * notifications.
 */
@property (nonatomic, retain) NSString *bounceTopic;

/**
 * The Amazon Resource Name (ARN) of the Amazon Simple Notification
 * Service (SNS) topic where Amazon SES will publish complaint
 * notifications.
 */
@property (nonatomic, retain) NSString *complaintTopic;

/**
 * Describes whether Amazon SES will forward feedback as email.
 * <code>true</code> indicates that Amazon SES will forward feedback as
 * email, while <code>false</code> indicates that feedback will be
 * published only to the specified Bounce and Complaint topics.
 */
@property (nonatomic) bool           forwardingEnabled;

@property (nonatomic, readonly) bool forwardingEnabledIsSet;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
