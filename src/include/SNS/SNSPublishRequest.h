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
 * Publish Request
 */

@interface SNSPublishRequest:AmazonServiceRequestConfig

{
    NSString *topicArn;
    NSString *message;
    NSString *subject;
    NSString *messageStructure;
}



/**
 * The topic you want to publish to.
 */
@property (nonatomic, retain) NSString *topicArn;

/**
 * The message you want to send to the topic. <p>Constraints: Messages
 * must be UTF-8 encoded strings at most 8 KB in size (8192 bytes, not
 * 8192 characters).
 */
@property (nonatomic, retain) NSString *message;

/**
 * Optional parameter to be used as the "Subject" line of when the
 * message is delivered to e-mail endpoints. This field will also be
 * included, if present, in the standard JSON messages delivered to other
 * endpoints. <p>Constraints: Subjects must be ASCII text that begins
 * with a letter, number or punctuation mark; must not include line
 * breaks or control characters; and must be less than 100 characters
 * long.
 */
@property (nonatomic, retain) NSString *subject;

/**
 * Optional parameter. It will have one valid value: "json". If this
 * option, Message is present and set to "json", the value of Message
 * must: be a syntactically valid JSON object. It must contain at least a
 * top level JSON key of "default" with a value that is a string. For any
 * other top level key that matches one of our transport protocols (e.g.
 * "http"), then the corresponding value (if it is a string) will be used
 * for the message published for that protocol <p>Constraints: Keys in
 * the JSON object that correspond to supported transport protocols must
 * have simple JSON string values. The values will be parsed (unescaped)
 * before they are used in outgoing messages. Typically, outbound
 * notifications are JSON encoded (meaning, the characters will be
 * reescaped for sending). JSON strings are UTF-8. Values have a minimum
 * length of 0 (the empty string, "", is allowed). Values have a maximum
 * length bounded by the overall message size (so, including multiple
 * protocols may limit message sizes). Non-string values will cause the
 * key to be ignored. Keys that do not correspond to supported transport
 * protocols will be ignored. Duplicate keys are not allowed. Failure to
 * parse or validate any key or value in the message will cause the
 * Publish call to return an error (no partial delivery).
 */
@property (nonatomic, retain) NSString *messageStructure;


/**
 * Default constructor for a new PublishRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new PublishRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The topic you want to publish to.
 * @param theMessage The message you want to send to the topic.
 * <p>Constraints: Messages must be UTF-8 encoded strings at most 8 KB in
 * size (8192 bytes, not 8192 characters).
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andMessage:(NSString *)theMessage;

/**
 * Constructs a new PublishRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The topic you want to publish to.
 * @param theMessage The message you want to send to the topic.
 * <p>Constraints: Messages must be UTF-8 encoded strings at most 8 KB in
 * size (8192 bytes, not 8192 characters).
 * @param theSubject Optional parameter to be used as the "Subject" line
 * of when the message is delivered to e-mail endpoints. This field will
 * also be included, if present, in the standard JSON messages delivered
 * to other endpoints. <p>Constraints: Subjects must be ASCII text that
 * begins with a letter, number or punctuation mark; must not include
 * line breaks or control characters; and must be less than 100
 * characters long.
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andMessage:(NSString *)theMessage andSubject:(NSString *)theSubject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
