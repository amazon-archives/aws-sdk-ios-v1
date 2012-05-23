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
 * Send Message Batch Request Entry
 */

@interface SQSSendMessageBatchRequestEntry:AmazonServiceRequestConfig

{
    NSString *idValue;
    NSString *messageBody;
    NSNumber *delaySeconds;
}



/**
 * An identifier for the message in this batch. This is used to
 * communicate the result. Note that the the <code>Id</code>s of a batch
 * request need to be unique within the request.
 */
@property (nonatomic, retain) NSString *idValue;

/**
 * Body of the message.
 */
@property (nonatomic, retain) NSString *messageBody;

/**
 * The number of seconds for which the message has to be delayed.
 */
@property (nonatomic, retain) NSNumber *delaySeconds;


/**
 * Default constructor for a new SendMessageBatchRequestEntry object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new SendMessageBatchRequestEntry object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theIdValue An identifier for the message in this batch. This is
 * used to communicate the result. Note that the the <code>Id</code>s of
 * a batch request need to be unique within the request.
 * @param theMessageBody Body of the message.
 */
-(id)initWithIdValue:(NSString *)theIdValue andMessageBody:(NSString *)theMessageBody;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
