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
 * Set Identity Feedback Forwarding Enabled Request
 */

@interface SESSetIdentityFeedbackForwardingEnabledRequest:AmazonServiceRequestConfig

{
    NSString *identity;
    bool     forwardingEnabled;
    bool     forwardingEnabledIsSet;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The identity for which to set feedback notification forwarding.
 * Examples: <code>user@example.com</code>, <code>example.com</code>.
 */
@property (nonatomic, retain) NSString *identity;

/**
 * Sets whether Amazon SES will forward feedback notifications as email.
 * <code>true</code> specifies that Amazon SES will forward feedback
 * notifications as email, in addition to any Amazon SNS topic publishing
 * otherwise specified. <code>false</code> specifies that Amazon SES will
 * publish feedback notifications only through Amazon SNS. This value can
 * only be set to <code>false</code> when topics are specified for both
 * <code>Bounce</code> and <code>Complaint</code> topic types.
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
