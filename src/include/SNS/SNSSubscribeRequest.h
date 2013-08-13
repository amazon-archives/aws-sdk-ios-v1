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
 * Subscribe Request
 */

@interface SNSSubscribeRequest:AmazonServiceRequestConfig

{
    NSString *topicArn;
    NSString *protocol;
    NSString *endpoint;
}



/**
 * The ARN of the topic you want to subscribe to.
 */
@property (nonatomic, retain) NSString *topicArn;

/**
 * The protocol you want to use. Supported protocols include: <ul>
 * <li><code>http</code> -- delivery of JSON-encoded message via HTTP
 * POST</li> <li><code>https</code> -- delivery of JSON-encoded message
 * via HTTPS POST</li> <li><code>email</code> -- delivery of message via
 * SMTP</li> <li><code>email-json</code> -- delivery of JSON-encoded
 * message via SMTP</li> <li><code>sms</code> -- delivery of message via
 * SMS</li> <li><code>sqs</code> -- delivery of JSON-encoded message to
 * an Amazon SQS queue</li> <li><code>application</code> -- delivery of
 * JSON-encoded message to an EndpointArn for a mobile app and
 * device.</li> </ul>
 */
@property (nonatomic, retain) NSString *protocol;

/**
 * The endpoint that you want to receive notifications. Endpoints vary by
 * protocol: <ul> <li>For the <code>http</code> protocol, the endpoint is
 * an URL beginning with "http://"</li> <li>For the <code>https</code>
 * protocol, the endpoint is a URL beginning with "https://"</li> <li>For
 * the <code>email</code> protocol, the endpoint is an email address</li>
 * <li>For the <code>email-json</code> protocol, the endpoint is an email
 * address</li> <li>For the <code>sms</code> protocol, the endpoint is a
 * phone number of an SMS-enabled device</li> <li>For the
 * <code>sqs</code> protocol, the endpoint is the ARN of an Amazon SQS
 * queue</li> <li>For the <code>application</code> protocol, the endpoint
 * is the EndpointArn of a mobile app and device.</li> </ul>
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
 * @param theTopicArn The ARN of the topic you want to subscribe to.
 * @param theProtocol The protocol you want to use. Supported protocols
 * include: <ul> <li><code>http</code> -- delivery of JSON-encoded
 * message via HTTP POST</li> <li><code>https</code> -- delivery of
 * JSON-encoded message via HTTPS POST</li> <li><code>email</code> --
 * delivery of message via SMTP</li> <li><code>email-json</code> --
 * delivery of JSON-encoded message via SMTP</li> <li><code>sms</code> --
 * delivery of message via SMS</li> <li><code>sqs</code> -- delivery of
 * JSON-encoded message to an Amazon SQS queue</li>
 * <li><code>application</code> -- delivery of JSON-encoded message to an
 * EndpointArn for a mobile app and device.</li> </ul>
 * @param theEndpoint The endpoint that you want to receive
 * notifications. Endpoints vary by protocol: <ul> <li>For the
 * <code>http</code> protocol, the endpoint is an URL beginning with
 * "http://"</li> <li>For the <code>https</code> protocol, the endpoint
 * is a URL beginning with "https://"</li> <li>For the <code>email</code>
 * protocol, the endpoint is an email address</li> <li>For the
 * <code>email-json</code> protocol, the endpoint is an email
 * address</li> <li>For the <code>sms</code> protocol, the endpoint is a
 * phone number of an SMS-enabled device</li> <li>For the
 * <code>sqs</code> protocol, the endpoint is the ARN of an Amazon SQS
 * queue</li> <li>For the <code>application</code> protocol, the endpoint
 * is the EndpointArn of a mobile app and device.</li> </ul>
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
