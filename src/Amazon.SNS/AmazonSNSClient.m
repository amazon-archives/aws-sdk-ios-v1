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

    return (SNSConfirmSubscriptionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSConfirmSubscriptionResponseUnmarshaller class]];
}

-(SNSGetTopicAttributesResponse *)getTopicAttributes:(SNSGetTopicAttributesRequest *)getTopicAttributesRequest
{
    AmazonServiceRequest *request = [SNSGetTopicAttributesRequestMarshaller createRequest:getTopicAttributesRequest];

    return (SNSGetTopicAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSGetTopicAttributesResponseUnmarshaller class]];
}

-(SNSSubscribeResponse *)subscribe:(SNSSubscribeRequest *)subscribeRequest
{
    AmazonServiceRequest *request = [SNSSubscribeRequestMarshaller createRequest:subscribeRequest];

    return (SNSSubscribeResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSSubscribeResponseUnmarshaller class]];
}

-(SNSSetTopicAttributesResponse *)setTopicAttributes:(SNSSetTopicAttributesRequest *)setTopicAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetTopicAttributesRequestMarshaller createRequest:setTopicAttributesRequest];

    return (SNSSetTopicAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSSetTopicAttributesResponseUnmarshaller class]];
}

-(SNSDeleteTopicResponse *)deleteTopic:(SNSDeleteTopicRequest *)deleteTopicRequest
{
    AmazonServiceRequest *request = [SNSDeleteTopicRequestMarshaller createRequest:deleteTopicRequest];

    return (SNSDeleteTopicResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSDeleteTopicResponseUnmarshaller class]];
}

-(SNSRemovePermissionResponse *)removePermission:(SNSRemovePermissionRequest *)removePermissionRequest
{
    AmazonServiceRequest *request = [SNSRemovePermissionRequestMarshaller createRequest:removePermissionRequest];

    return (SNSRemovePermissionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSRemovePermissionResponseUnmarshaller class]];
}

-(SNSListSubscriptionsResponse *)listSubscriptions:(SNSListSubscriptionsRequest *)listSubscriptionsRequest
{
    AmazonServiceRequest *request = [SNSListSubscriptionsRequestMarshaller createRequest:listSubscriptionsRequest];

    return (SNSListSubscriptionsResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSListSubscriptionsResponseUnmarshaller class]];
}

-(SNSAddPermissionResponse *)addPermission:(SNSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [SNSAddPermissionRequestMarshaller createRequest:addPermissionRequest];

    return (SNSAddPermissionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSAddPermissionResponseUnmarshaller class]];
}

-(SNSCreateTopicResponse *)createTopic:(SNSCreateTopicRequest *)createTopicRequest
{
    AmazonServiceRequest *request = [SNSCreateTopicRequestMarshaller createRequest:createTopicRequest];

    return (SNSCreateTopicResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSCreateTopicResponseUnmarshaller class]];
}

-(SNSListTopicsResponse *)listTopics:(SNSListTopicsRequest *)listTopicsRequest
{
    AmazonServiceRequest *request = [SNSListTopicsRequestMarshaller createRequest:listTopicsRequest];

    return (SNSListTopicsResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSListTopicsResponseUnmarshaller class]];
}

-(SNSUnsubscribeResponse *)unsubscribe:(SNSUnsubscribeRequest *)unsubscribeRequest
{
    AmazonServiceRequest *request = [SNSUnsubscribeRequestMarshaller createRequest:unsubscribeRequest];

    return (SNSUnsubscribeResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSUnsubscribeResponseUnmarshaller class]];
}

-(SNSListSubscriptionsByTopicResponse *)listSubscriptionsByTopic:(SNSListSubscriptionsByTopicRequest *)listSubscriptionsByTopicRequest
{
    AmazonServiceRequest *request = [SNSListSubscriptionsByTopicRequestMarshaller createRequest:listSubscriptionsByTopicRequest];

    return (SNSListSubscriptionsByTopicResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSListSubscriptionsByTopicResponseUnmarshaller class]];
}

-(SNSPublishResponse *)publish:(SNSPublishRequest *)publishRequest
{
    AmazonServiceRequest *request = [SNSPublishRequestMarshaller createRequest:publishRequest];

    return (SNSPublishResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SNSPublishResponseUnmarshaller class]];
}



@end

