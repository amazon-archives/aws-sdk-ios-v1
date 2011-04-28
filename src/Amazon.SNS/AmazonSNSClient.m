/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AmazonSNSClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonSNSClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = @"https://sns.us-east-1.amazonaws.com";
    }
    return self;
}

-(SNSConfirmSubscriptionResponse *)confirmSubscription:(SNSConfirmSubscriptionRequest *)confirmSubscriptionRequest
{
    AmazonServiceRequest *request = [SNSConfirmSubscriptionRequestMarshaller createRequest:confirmSubscriptionRequest];

    return (SNSConfirmSubscriptionResponse *)[self invoke:request unmarshallerDelegate:[SNSConfirmSubscriptionResponseUnmarshaller class]];
}

-(SNSGetTopicAttributesResponse *)getTopicAttributes:(SNSGetTopicAttributesRequest *)getTopicAttributesRequest
{
    AmazonServiceRequest *request = [SNSGetTopicAttributesRequestMarshaller createRequest:getTopicAttributesRequest];

    return (SNSGetTopicAttributesResponse *)[self invoke:request unmarshallerDelegate:[SNSGetTopicAttributesResponseUnmarshaller class]];
}

-(SNSSubscribeResponse *)subscribe:(SNSSubscribeRequest *)subscribeRequest
{
    AmazonServiceRequest *request = [SNSSubscribeRequestMarshaller createRequest:subscribeRequest];

    return (SNSSubscribeResponse *)[self invoke:request unmarshallerDelegate:[SNSSubscribeResponseUnmarshaller class]];
}

-(SNSSetTopicAttributesResponse *)setTopicAttributes:(SNSSetTopicAttributesRequest *)setTopicAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetTopicAttributesRequestMarshaller createRequest:setTopicAttributesRequest];

    return (SNSSetTopicAttributesResponse *)[self invoke:request unmarshallerDelegate:[SNSSetTopicAttributesResponseUnmarshaller class]];
}

-(SNSDeleteTopicResponse *)deleteTopic:(SNSDeleteTopicRequest *)deleteTopicRequest
{
    AmazonServiceRequest *request = [SNSDeleteTopicRequestMarshaller createRequest:deleteTopicRequest];

    return (SNSDeleteTopicResponse *)[self invoke:request unmarshallerDelegate:[SNSDeleteTopicResponseUnmarshaller class]];
}

-(SNSRemovePermissionResponse *)removePermission:(SNSRemovePermissionRequest *)removePermissionRequest
{
    AmazonServiceRequest *request = [SNSRemovePermissionRequestMarshaller createRequest:removePermissionRequest];

    return (SNSRemovePermissionResponse *)[self invoke:request unmarshallerDelegate:[SNSRemovePermissionResponseUnmarshaller class]];
}

-(SNSListSubscriptionsResponse *)listSubscriptions:(SNSListSubscriptionsRequest *)listSubscriptionsRequest
{
    AmazonServiceRequest *request = [SNSListSubscriptionsRequestMarshaller createRequest:listSubscriptionsRequest];

    return (SNSListSubscriptionsResponse *)[self invoke:request unmarshallerDelegate:[SNSListSubscriptionsResponseUnmarshaller class]];
}

-(SNSAddPermissionResponse *)addPermission:(SNSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [SNSAddPermissionRequestMarshaller createRequest:addPermissionRequest];

    return (SNSAddPermissionResponse *)[self invoke:request unmarshallerDelegate:[SNSAddPermissionResponseUnmarshaller class]];
}

-(SNSCreateTopicResponse *)createTopic:(SNSCreateTopicRequest *)createTopicRequest
{
    AmazonServiceRequest *request = [SNSCreateTopicRequestMarshaller createRequest:createTopicRequest];

    return (SNSCreateTopicResponse *)[self invoke:request unmarshallerDelegate:[SNSCreateTopicResponseUnmarshaller class]];
}

-(SNSListTopicsResponse *)listTopics:(SNSListTopicsRequest *)listTopicsRequest
{
    AmazonServiceRequest *request = [SNSListTopicsRequestMarshaller createRequest:listTopicsRequest];

    return (SNSListTopicsResponse *)[self invoke:request unmarshallerDelegate:[SNSListTopicsResponseUnmarshaller class]];
}

-(SNSUnsubscribeResponse *)unsubscribe:(SNSUnsubscribeRequest *)unsubscribeRequest
{
    AmazonServiceRequest *request = [SNSUnsubscribeRequestMarshaller createRequest:unsubscribeRequest];

    return (SNSUnsubscribeResponse *)[self invoke:request unmarshallerDelegate:[SNSUnsubscribeResponseUnmarshaller class]];
}

-(SNSListSubscriptionsByTopicResponse *)listSubscriptionsByTopic:(SNSListSubscriptionsByTopicRequest *)listSubscriptionsByTopicRequest
{
    AmazonServiceRequest *request = [SNSListSubscriptionsByTopicRequestMarshaller createRequest:listSubscriptionsByTopicRequest];

    return (SNSListSubscriptionsByTopicResponse *)[self invoke:request unmarshallerDelegate:[SNSListSubscriptionsByTopicResponseUnmarshaller class]];
}

-(SNSPublishResponse *)publish:(SNSPublishRequest *)publishRequest
{
    AmazonServiceRequest *request = [SNSPublishRequestMarshaller createRequest:publishRequest];

    return (SNSPublishResponse *)[self invoke:request unmarshallerDelegate:[SNSPublishResponseUnmarshaller class]];
}



@end

