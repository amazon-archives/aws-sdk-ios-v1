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
 * Subscribe Request
 */

@interface SNSSubscribeRequest:AmazonServiceRequestConfig

{
    NSString *topicArn;
    NSString *protocol;
    NSString *endpoint;
}



/**
 * The ARN of topic you want to subscribe to.
 */
@property (nonatomic, retain) NSString *topicArn;

/**
 * The protocol you want to use. Supported protocols include: <ul>
 * <li>http -- delivery of JSON-encoded message via HTTP POST</li>
 * <li>https -- delivery of JSON-encoded message via HTTPS POST</li>
 * <li>email -- delivery of message via SMTP</li> <li>email-json --
 * delivery of JSON-encoded message via SMTP</li> <li>sqs -- delivery of
 * JSON-encoded message to an Amazon SQS queue</li> </ul>
 */
@property (nonatomic, retain) NSString *protocol;

/**
 * The endpoint that you want to receive notifications. Endpoints vary by
 * protocol: <ul> <li>For the http protocol, the endpoint is an URL
 * beginning with "http://"</li> <li>For the https protocol, the endpoint
 * is a URL beginning with "https://"</li> <li>For the email protocol,
 * the endpoint is an e-mail address</li> <li>For the email-json
 * protocol, the endpoint is an e-mail address</li> <li>For the sqs
 * protocol, the endpoint is the ARN of an Amazon SQS queue</li> </ul>
 */
@property (nonatomic, retain) NSString *endpoint;


/**
 * Default constructor for a new SubscribeRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new SubscribeRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The ARN of topic you want to subscribe to.
 * @param theProtocol The protocol you want to use. Supported protocols
 * include: <ul> <li>http -- delivery of JSON-encoded message via HTTP
 * POST</li> <li>https -- delivery of JSON-encoded message via HTTPS
 * POST</li> <li>email -- delivery of message via SMTP</li>
 * <li>email-json -- delivery of JSON-encoded message via SMTP</li>
 * <li>sqs -- delivery of JSON-encoded message to an Amazon SQS
 * queue</li> </ul>
 * @param theEndpoint The endpoint that you want to receive
 * notifications. Endpoints vary by protocol: <ul> <li>For the http
 * protocol, the endpoint is an URL beginning with "http://"</li> <li>For
 * the https protocol, the endpoint is a URL beginning with
 * "https://"</li> <li>For the email protocol, the endpoint is an e-mail
 * address</li> <li>For the email-json protocol, the endpoint is an
 * e-mail address</li> <li>For the sqs protocol, the endpoint is the ARN
 * of an Amazon SQS queue</li> </ul>
 */
-(id)initWithTopicArn:(NSString *)theTopicArn andProtocol:(NSString *)theProtocol andEndpoint:(NSString *)theEndpoint;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
