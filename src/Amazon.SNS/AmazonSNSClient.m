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

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = @"https://sns.us-east-1.amazonaws.com";
    }
    return self;
}

-(SNSConfirmSubscriptionResponse *)confirmSubscription:(SNSConfirmSubscriptionRequest *)confirmSubscriptionRequest
{
    AmazonServiceRequest *request = [SNSConfirmSubscriptionRequestMarshaller createRequest:confirmSubscriptionRequest];

    return (SNSConfirmSubscriptionResponse *)[self invoke:request rawRequest:confirmSubscriptionRequest unmarshallerDelegate:[SNSConfirmSubscriptionResponseUnmarshaller class]];
}

-(SNSGetTopicAttributesResponse *)getTopicAttributes:(SNSGetTopicAttributesRequest *)getTopicAttributesRequest
{
    AmazonServiceRequest *request = [SNSGetTopicAttributesRequestMarshaller createRequest:getTopicAttributesRequest];

    return (SNSGetTopicAttributesResponse *)[self invoke:request rawRequest:getTopicAttributesRequest unmarshallerDelegate:[SNSGetTopicAttributesResponseUnmarshaller class]];
}

-(SNSSubscribeResponse *)subscribe:(SNSSubscribeRequest *)subscribeRequest
{
    AmazonServiceRequest *request = [SNSSubscribeRequestMarshaller createRequest:subscribeRequest];

    return (SNSSubscribeResponse *)[self invoke:request rawRequest:subscribeRequest unmarshallerDelegate:[SNSSubscribeResponseUnmarshaller class]];
}

-(SNSSetTopicAttributesResponse *)setTopicAttributes:(SNSSetTopicAttributesRequest *)setTopicAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetTopicAttributesRequestMarshaller createRequest:setTopicAttributesRequest];

    return (SNSSetTopicAttributesResponse *)[self invoke:request rawRequest:setTopicAttributesRequest unmarshallerDelegate:[SNSSetTopicAttributesResponseUnmarshaller class]];
}

-(SNSDeleteTopicResponse *)deleteTopic:(SNSDeleteTopicRequest *)deleteTopicRequest
{
    AmazonServiceRequest *request = [SNSDeleteTopicRequestMarshaller createRequest:deleteTopicRequest];

    return (SNSDeleteTopicResponse *)[self invoke:request rawRequest:deleteTopicRequest unmarshallerDelegate:[SNSDeleteTopicResponseUnmarshaller class]];
}

-(SNSRemovePermissionResponse *)removePermission:(SNSRemovePermissionRequest *)removePermissionRequest
{
    AmazonServiceRequest *request = [SNSRemovePermissionRequestMarshaller createRequest:removePermissionRequest];

    return (SNSRemovePermissionResponse *)[self invoke:request rawRequest:removePermissionRequest unmarshallerDelegate:[SNSRemovePermissionResponseUnmarshaller class]];
}

-(SNSListSubscriptionsResponse *)listSubscriptions:(SNSListSubscriptionsRequest *)listSubscriptionsRequest
{
    AmazonServiceRequest *request = [SNSListSubscriptionsRequestMarshaller createRequest:listSubscriptionsRequest];

    return (SNSListSubscriptionsResponse *)[self invoke:request rawRequest:listSubscriptionsRequest unmarshallerDelegate:[SNSListSubscriptionsResponseUnmarshaller class]];
}

-(SNSSetSubscriptionAttributesResponse *)setSubscriptionAttributes:(SNSSetSubscriptionAttributesRequest *)setSubscriptionAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetSubscriptionAttributesRequestMarshaller createRequest:setSubscriptionAttributesRequest];

    return (SNSSetSubscriptionAttributesResponse *)[self invoke:request rawRequest:setSubscriptionAttributesRequest unmarshallerDelegate:[SNSSetSubscriptionAttributesResponseUnmarshaller class]];
}

-(SNSAddPermissionResponse *)addPermission:(SNSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [SNSAddPermissionRequestMarshaller createRequest:addPermissionRequest];

    return (SNSAddPermissionResponse *)[self invoke:request rawRequest:addPermissionRequest unmarshallerDelegate:[SNSAddPermissionResponseUnmarshaller class]];
}

-(SNSCreateTopicResponse *)createTopic:(SNSCreateTopicRequest *)createTopicRequest
{
    AmazonServiceRequest *request = [SNSCreateTopicRequestMarshaller createRequest:createTopicRequest];

    return (SNSCreateTopicResponse *)[self invoke:request rawRequest:createTopicRequest unmarshallerDelegate:[SNSCreateTopicResponseUnmarshaller class]];
}

-(SNSGetSubscriptionAttributesResponse *)getSubscriptionAttributes:(SNSGetSubscriptionAttributesRequest *)getSubscriptionAttributesRequest
{
    AmazonServiceRequest *request = [SNSGetSubscriptionAttributesRequestMarshaller createRequest:getSubscriptionAttributesRequest];

    return (SNSGetSubscriptionAttributesResponse *)[self invoke:request rawRequest:getSubscriptionAttributesRequest unmarshallerDelegate:[SNSGetSubscriptionAttributesResponseUnmarshaller class]];
}

-(SNSListTopicsResponse *)listTopics:(SNSListTopicsRequest *)listTopicsRequest
{
    AmazonServiceRequest *request = [SNSListTopicsRequestMarshaller createRequest:listTopicsRequest];

    return (SNSListTopicsResponse *)[self invoke:request rawRequest:listTopicsRequest unmarshallerDelegate:[SNSListTopicsResponseUnmarshaller class]];
}

-(SNSUnsubscribeResponse *)unsubscribe:(SNSUnsubscribeRequest *)unsubscribeRequest
{
    AmazonServiceRequest *request = [SNSUnsubscribeRequestMarshaller createRequest:unsubscribeRequest];

    return (SNSUnsubscribeResponse *)[self invoke:request rawRequest:unsubscribeRequest unmarshallerDelegate:[SNSUnsubscribeResponseUnmarshaller class]];
}

-(SNSListSubscriptionsByTopicResponse *)listSubscriptionsByTopic:(SNSListSubscriptionsByTopicRequest *)listSubscriptionsByTopicRequest
{
    AmazonServiceRequest *request = [SNSListSubscriptionsByTopicRequestMarshaller createRequest:listSubscriptionsByTopicRequest];

    return (SNSListSubscriptionsByTopicResponse *)[self invoke:request rawRequest:listSubscriptionsByTopicRequest unmarshallerDelegate:[SNSListSubscriptionsByTopicResponseUnmarshaller class]];
}

-(SNSPublishResponse *)publish:(SNSPublishRequest *)publishRequest
{
    AmazonServiceRequest *request = [SNSPublishRequestMarshaller createRequest:publishRequest];

    return (SNSPublishResponse *)[self invoke:request rawRequest:publishRequest unmarshallerDelegate:[SNSPublishResponseUnmarshaller class]];
}



@end

