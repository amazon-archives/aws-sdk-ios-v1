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


#import "SQSResponse.h"



/**
 * Send Message Batch Result Entry
 */

@interface SQSSendMessageBatchResponseEntry:SQSResponse

{
    NSString *idValue;
    NSString *messageId;
    NSString *mD5OfMessageBody;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * An identifier for the message in this batch.
 */
@property (nonatomic, retain) NSString *idValue;

/**
 * An identifier for the message.
 */
@property (nonatomic, retain) NSString *messageId;

/**
 * An MD5 digest of the non-URL-encoded message body string. This can be
 * used to verify that SQS received the message correctly. SQS first URL
 * decodes the message before creating the MD5 digest. For information
 * about MD5, go to <a
 * p://faqs.org/rfcs/rfc1321.html">http://faqs.org/rfcs/rfc1321.html</a>.
 */
@property (nonatomic, retain) NSString *mD5OfMessageBody;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
