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

#import "SESDestination.h"
#import "SESMessage.h"

#import "../AmazonServiceRequestConfig.h"



/**
 * Send Email Request
 */

@interface SESSendEmailRequest:AmazonServiceRequestConfig

{
    NSString       *source;
    SESDestination *destination;
    SESMessage     *message;
    NSMutableArray *replyToAddresses;
    NSString       *returnPath;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The identity's email address.
 */
@property (nonatomic, retain) NSString *source;

/**
 * The destination for this email, composed of To:, CC:, and BCC: fields.
 */
@property (nonatomic, retain) SESDestination *destination;

/**
 * The message to be sent.
 */
@property (nonatomic, retain) SESMessage *message;

/**
 * The reply-to email address(es) for the message. If the recipient
 * replies to the message, each reply-to address will receive the reply.
 */
@property (nonatomic, retain) NSMutableArray *replyToAddresses;

/**
 * The email address to which bounce notifications are to be forwarded.
 * If the message cannot be delivered to the recipient, then an error
 * message will be returned from the recipient's ISP; this message will
 * then be forwarded to the email address specified by the
 * <code>ReturnPath</code> parameter.
 */
@property (nonatomic, retain) NSString *returnPath;

/**
 * Adds a single object to replyToAddresses.
 * This function will alloc and init replyToAddresses if not already done.
 */
-(void)addReplyToAddresse:(NSString *)replyToAddresseObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
