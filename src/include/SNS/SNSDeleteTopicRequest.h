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
 * Delete Topic Request
 */

@interface SNSDeleteTopicRequest:AmazonServiceRequestConfig

{
    NSString *topicArn;
}



/**
 * The ARN of the topic you want to delete. <examples> <queryrequest>
 * http://sns.us-east-1.amazonaws.com/
 * ?TopicArn=arn%3Aaws%3Asns%3Aus-east-1%3A123456789012%3AMy-Topic
 * &Action=DeleteTopic &SignatureVersion=2 &SignatureMethod=HmacSHA256
 * &Timestamp=2010-03-31T12%3A00%3A00.000Z &AWSAccessKeyId=(AWS Access
 * Key ID)
 * &Signature=DjHBa%2BbYCKQAzctOPnLP7MbHnrHT3%2FK3kFEZjwcf9%2FU%3D
 * </queryrequest> <queryresponse> <DeleteTopicResponse
 * xmlns="http://sns.amazonaws.com/doc/2010-03-31/"> <ResponseMetadata>
 * <RequestId>fba800b9-3765-11df-8cf3-c58c53254dfb</RequestId>
 * </ResponseMetadata> </DeleteTopicResponse> </queryresponse>
 * </examples>
 */
@property (nonatomic, retain) NSString *topicArn;


/**
 * Default constructor for a new DeleteTopicRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeleteTopicRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theTopicArn The ARN of the topic you want to delete. <examples>
 * <queryrequest> http://sns.us-east-1.amazonaws.com/
 * ?TopicArn=arn%3Aaws%3Asns%3Aus-east-1%3A123456789012%3AMy-Topic
 * &Action=DeleteTopic &SignatureVersion=2 &SignatureMethod=HmacSHA256
 * &Timestamp=2010-03-31T12%3A00%3A00.000Z &AWSAccessKeyId=(AWS Access
 * Key ID)
 * &Signature=DjHBa%2BbYCKQAzctOPnLP7MbHnrHT3%2FK3kFEZjwcf9%2FU%3D
 * </queryrequest> <queryresponse> <DeleteTopicResponse
 * xmlns="http://sns.amazonaws.com/doc/2010-03-31/"> <ResponseMetadata>
 * <RequestId>fba800b9-3765-11df-8cf3-c58c53254dfb</RequestId>
 * </ResponseMetadata> </DeleteTopicResponse> </queryresponse>
 * </examples>
 */
-(id)initWithTopicArn:(NSString *)theTopicArn;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
