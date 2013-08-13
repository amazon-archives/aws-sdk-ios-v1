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


#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Publish Request
 */

@interface SNSPublishRequest:AmazonServiceRequestConfig

{
    NSString *topicArn;
    NSString *targetArn;
    NSString *message;
    NSString *subject;
    NSString *messageStructure;
}



/**
 * The topic you want to publish to.
 */
@property (nonatomic, retain) NSString *topicArn;

/**
 * Either TopicArn or EndpointArn, but not both.
 */
@property (nonatomic, retain) NSString *targetArn;

/**
 * The message you want to send to the topic. <p>If you want to send the
 * same message to all transport protocols, include the text of the
 * message as a String value. <p>If you want to send different messages
 * for each transport protocol, set the value of the
 * <code>MessageStructure</code> parameter to <code>json</code> and use a
 * JSON object for the <code>Message</code> parameter. See the Examples
 * section for the format of the JSON object. <p>Constraints: Messages
 * must be UTF-8 encoded strings at most 256 KB in size (262144 bytes,
 * not 262144 characters). <p>JSON-specific constraints: <ul> <li>Keys in
 * the JSON object that correspond to supported transport protocols must
 * have simple JSON string values. </li> <li>The values will be parsed
 * (unescaped) before they are used in outgoing messages.</li>
 * <li>Outbound notifications are JSON encoded (meaning that the
 * characters will be reescaped for sending).</li> <li>Values have a
 * minimum length of 0 (the empty string, "", is allowed).</li>
 * <li>Values have a maximum length bounded by the overall message size
 * (so, including multiple protocols may limit message sizes).</li>
 * <li>Non-string values will cause the key to be ignored.</li> <li>Keys
 * that do not correspond to supported transport protocols are
 * ignored.</li> <li>Duplicate keys are not allowed.</li> <li>Failure to
 * parse or validate any key or value in the message will cause the
 * <code>Publish</code> call to return an error (no partial
 * delivery).</li> </ul>
 */
@property (nonatomic, retain) NSString *message;

/**
 * Optional parameter to be used as the "Subject" line when the message
 * is delivered to email endpoints. This field will also be included, if
 * present, in the standard JSON messages delivered to other endpoints.
 * <p>Constraints: Subjects must be ASCII text that begins with a letter,
 * number, or punctuation mark; must not include line breaks or control
 * characters; and must be less than 100 characters long.
 */
@property (nonatomic, retain) NSString *subject;

/**
 * Set <code>MessageStructure</code> to <code>json</code> if you want to
 * send a different message for each protocol. For example, using one
 * publish action, you can send a short message to your SMS subscribers
 * and a longer message to your email subscribers. If you set
 * <code>MessageStructure</code> to <code>json</code>, the value of the
 * <code>Message</code> parameter must: <ul> <li>be a syntactically valid
 * JSON object; and</li> <li>contain at least a top-level JSON key of
 * "default" with a value that is a string.</li> </ul> <p> You can define
 * other top-level keys that define the message you want to send to a
 * specific transport protocol (e.g., "http"). <p>For information about
 * sending different messages for each protocol using the AWS Management
 * Console, go to <a
 * sns/latest/gsg/Publish.html#sns-message-formatting-by-protocol">Create
 * Different Messages for Each Protocol</a> in the <i>Amazon Simple
 * Notification Service Getting Started Guide</i>. <p>Valid value:
 * <code>json</code>
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
 * @param theMessage The message you want to send to the topic. <p>If you
 * want to send the same message to all transport protocols, include the
 * text of the message as a String value. <p>If you want to send
 * different messages for each transport protocol, set the value of the
 * <code>MessageStructure</code> parameter to <code>json</code> and use a
 * JSON object for the <code>Message</code> parameter. See the Examples
 * section for the format of the JSON object. <p>Constraints: Messages
 * must be UTF-8 encoded strings at most 256 KB in size (262144 bytes,
 * not 262144 characters). <p>JSON-specific constraints: <ul> <li>Keys in
 * the JSON object that correspond to supported transport protocols must
 * have simple JSON string values. </li> <li>The values will be parsed
 * (unescaped) before they are used in outgoing messages.</li>
 * <li>Outbound notifications are JSON encoded (meaning that the
 * characters will be reescaped for sending).</li> <li>Values have a
 * minimum length of 0 (the empty string, "", is allowed).</li>
 * <li>Values have a maximum length bounded by the overall message size
 * (so, including multiple protocols may limit message sizes).</li>
 * <li>Non-string values will cause the key to be ignored.</li> <li>Keys
 * that do not correspond to supported transport protocols are
 * ignored.</li> <li>Duplicate keys are not allowed.</li> <li>Failure to
 * parse or validate any key or value in the message will cause the
 * <code>Publish</code> call to return an error (no partial
 * delivery).</li> </ul>
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andMessage:(NSString *)theMessage;

/**
 * Constructs a new PublishRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The topic you want to publish to.
 * @param theMessage The message you want to send to the topic. <p>If you
 * want to send the same message to all transport protocols, include the
 * text of the message as a String value. <p>If you want to send
 * different messages for each transport protocol, set the value of the
 * <code>MessageStructure</code> parameter to <code>json</code> and use a
 * JSON object for the <code>Message</code> parameter. See the Examples
 * section for the format of the JSON object. <p>Constraints: Messages
 * must be UTF-8 encoded strings at most 256 KB in size (262144 bytes,
 * not 262144 characters). <p>JSON-specific constraints: <ul> <li>Keys in
 * the JSON object that correspond to supported transport protocols must
 * have simple JSON string values. </li> <li>The values will be parsed
 * (unescaped) before they are used in outgoing messages.</li>
 * <li>Outbound notifications are JSON encoded (meaning that the
 * characters will be reescaped for sending).</li> <li>Values have a
 * minimum length of 0 (the empty string, "", is allowed).</li>
 * <li>Values have a maximum length bounded by the overall message size
 * (so, including multiple protocols may limit message sizes).</li>
 * <li>Non-string values will cause the key to be ignored.</li> <li>Keys
 * that do not correspond to supported transport protocols are
 * ignored.</li> <li>Duplicate keys are not allowed.</li> <li>Failure to
 * parse or validate any key or value in the message will cause the
 * <code>Publish</code> call to return an error (no partial
 * delivery).</li> </ul>
 * @param theSubject Optional parameter to be used as the "Subject" line
 * when the message is delivered to email endpoints. This field will also
 * be included, if present, in the standard JSON messages delivered to
 * other endpoints. <p>Constraints: Subjects must be ASCII text that
 * begins with a letter, number, or punctuation mark; must not include
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
