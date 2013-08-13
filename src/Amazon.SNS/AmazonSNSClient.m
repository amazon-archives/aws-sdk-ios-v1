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

#import "AmazonSNSClient.h"
#import "AmazonEndpoints.h"
#import "AmazonServiceRequest.h"
#import "SNSConfirmSubscriptionResponseUnmarshaller.h"
#import "SNSConfirmSubscriptionRequestMarshaller.h"
#import "SNSCreatePlatformApplicationResponseUnmarshaller.h"
#import "SNSCreatePlatformApplicationRequestMarshaller.h"
#import "SNSGetTopicAttributesResponseUnmarshaller.h"
#import "SNSGetTopicAttributesRequestMarshaller.h"
#import "SNSSubscribeResponseUnmarshaller.h"
#import "SNSSubscribeRequestMarshaller.h"
#import "SNSDeleteEndpointResponseUnmarshaller.h"
#import "SNSDeleteEndpointRequestMarshaller.h"
#import "SNSSetTopicAttributesResponseUnmarshaller.h"
#import "SNSSetTopicAttributesRequestMarshaller.h"
#import "SNSRemovePermissionResponseUnmarshaller.h"
#import "SNSRemovePermissionRequestMarshaller.h"
#import "SNSGetEndpointAttributesResponseUnmarshaller.h"
#import "SNSGetEndpointAttributesRequestMarshaller.h"
#import "SNSListSubscriptionsResponseUnmarshaller.h"
#import "SNSListSubscriptionsRequestMarshaller.h"
#import "SNSCreatePlatformEndpointResponseUnmarshaller.h"
#import "SNSCreatePlatformEndpointRequestMarshaller.h"
#import "SNSSetSubscriptionAttributesResponseUnmarshaller.h"
#import "SNSSetSubscriptionAttributesRequestMarshaller.h"
#import "SNSCreateTopicResponseUnmarshaller.h"
#import "SNSCreateTopicRequestMarshaller.h"
#import "SNSGetSubscriptionAttributesResponseUnmarshaller.h"
#import "SNSGetSubscriptionAttributesRequestMarshaller.h"
#import "SNSListTopicsResponseUnmarshaller.h"
#import "SNSListTopicsRequestMarshaller.h"
#import "SNSDeletePlatformApplicationResponseUnmarshaller.h"
#import "SNSDeletePlatformApplicationRequestMarshaller.h"
#import "SNSListPlatformApplicationsResponseUnmarshaller.h"
#import "SNSListPlatformApplicationsRequestMarshaller.h"
#import "SNSSetEndpointAttributesResponseUnmarshaller.h"
#import "SNSSetEndpointAttributesRequestMarshaller.h"
#import "SNSUnsubscribeResponseUnmarshaller.h"
#import "SNSUnsubscribeRequestMarshaller.h"
#import "SNSDeleteTopicResponseUnmarshaller.h"
#import "SNSDeleteTopicRequestMarshaller.h"
#import "SNSGetPlatformApplicationAttributesResponseUnmarshaller.h"
#import "SNSGetPlatformApplicationAttributesRequestMarshaller.h"
#import "SNSSetPlatformApplicationAttributesResponseUnmarshaller.h"
#import "SNSSetPlatformApplicationAttributesRequestMarshaller.h"
#import "SNSAddPermissionResponseUnmarshaller.h"
#import "SNSAddPermissionRequestMarshaller.h"
#import "SNSListEndpointsByPlatformApplicationResponseUnmarshaller.h"
#import "SNSListEndpointsByPlatformApplicationRequestMarshaller.h"
#import "SNSListSubscriptionsByTopicResponseUnmarshaller.h"
#import "SNSListSubscriptionsByTopicRequestMarshaller.h"
#import "SNSPublishResponseUnmarshaller.h"
#import "SNSPublishRequestMarshaller.h"


@implementation AmazonSNSClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = AMAZON_SNS_US_EAST_1_ENDPOINT_SECURE;
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = AMAZON_SNS_US_EAST_1_ENDPOINT_SECURE;
    }
    return self;
}

-(id)initWithCredentialsProvider:(id<AmazonCredentialsProvider> )theProvider
{
    if (self = [super initWithCredentialsProvider:theProvider]) {
        self.endpoint = AMAZON_SNS_US_EAST_1_ENDPOINT_SECURE;
    }
    return self;
}

-(SNSConfirmSubscriptionResponse *)confirmSubscription:(SNSConfirmSubscriptionRequest *)confirmSubscriptionRequest
{
    AmazonServiceRequest *request = [SNSConfirmSubscriptionRequestMarshaller createRequest:confirmSubscriptionRequest];

    return (SNSConfirmSubscriptionResponse *)[self invoke:request rawRequest:confirmSubscriptionRequest unmarshallerDelegate:[SNSConfirmSubscriptionResponseUnmarshaller class]];
}

-(SNSCreatePlatformApplicationResponse *)createPlatformApplication:(SNSCreatePlatformApplicationRequest *)createPlatformApplicationRequest
{
    AmazonServiceRequest *request = [SNSCreatePlatformApplicationRequestMarshaller createRequest:createPlatformApplicationRequest];

    return (SNSCreatePlatformApplicationResponse *)[self invoke:request rawRequest:createPlatformApplicationRequest unmarshallerDelegate:[SNSCreatePlatformApplicationResponseUnmarshaller class]];
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

-(SNSDeleteEndpointResponse *)deleteEndpoint:(SNSDeleteEndpointRequest *)deleteEndpointRequest
{
    AmazonServiceRequest *request = [SNSDeleteEndpointRequestMarshaller createRequest:deleteEndpointRequest];

    return (SNSDeleteEndpointResponse *)[self invoke:request rawRequest:deleteEndpointRequest unmarshallerDelegate:[SNSDeleteEndpointResponseUnmarshaller class]];
}

-(SNSSetTopicAttributesResponse *)setTopicAttributes:(SNSSetTopicAttributesRequest *)setTopicAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetTopicAttributesRequestMarshaller createRequest:setTopicAttributesRequest];

    return (SNSSetTopicAttributesResponse *)[self invoke:request rawRequest:setTopicAttributesRequest unmarshallerDelegate:[SNSSetTopicAttributesResponseUnmarshaller class]];
}

-(SNSRemovePermissionResponse *)removePermission:(SNSRemovePermissionRequest *)removePermissionRequest
{
    AmazonServiceRequest *request = [SNSRemovePermissionRequestMarshaller createRequest:removePermissionRequest];

    return (SNSRemovePermissionResponse *)[self invoke:request rawRequest:removePermissionRequest unmarshallerDelegate:[SNSRemovePermissionResponseUnmarshaller class]];
}

-(SNSGetEndpointAttributesResponse *)getEndpointAttributes:(SNSGetEndpointAttributesRequest *)getEndpointAttributesRequest
{
    AmazonServiceRequest *request = [SNSGetEndpointAttributesRequestMarshaller createRequest:getEndpointAttributesRequest];

    return (SNSGetEndpointAttributesResponse *)[self invoke:request rawRequest:getEndpointAttributesRequest unmarshallerDelegate:[SNSGetEndpointAttributesResponseUnmarshaller class]];
}

-(SNSListSubscriptionsResponse *)listSubscriptions:(SNSListSubscriptionsRequest *)listSubscriptionsRequest
{
    AmazonServiceRequest *request = [SNSListSubscriptionsRequestMarshaller createRequest:listSubscriptionsRequest];

    return (SNSListSubscriptionsResponse *)[self invoke:request rawRequest:listSubscriptionsRequest unmarshallerDelegate:[SNSListSubscriptionsResponseUnmarshaller class]];
}

-(SNSCreatePlatformEndpointResponse *)createPlatformEndpoint:(SNSCreatePlatformEndpointRequest *)createPlatformEndpointRequest
{
    AmazonServiceRequest *request = [SNSCreatePlatformEndpointRequestMarshaller createRequest:createPlatformEndpointRequest];

    return (SNSCreatePlatformEndpointResponse *)[self invoke:request rawRequest:createPlatformEndpointRequest unmarshallerDelegate:[SNSCreatePlatformEndpointResponseUnmarshaller class]];
}

-(SNSSetSubscriptionAttributesResponse *)setSubscriptionAttributes:(SNSSetSubscriptionAttributesRequest *)setSubscriptionAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetSubscriptionAttributesRequestMarshaller createRequest:setSubscriptionAttributesRequest];

    return (SNSSetSubscriptionAttributesResponse *)[self invoke:request rawRequest:setSubscriptionAttributesRequest unmarshallerDelegate:[SNSSetSubscriptionAttributesResponseUnmarshaller class]];
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

-(SNSDeletePlatformApplicationResponse *)deletePlatformApplication:(SNSDeletePlatformApplicationRequest *)deletePlatformApplicationRequest
{
    AmazonServiceRequest *request = [SNSDeletePlatformApplicationRequestMarshaller createRequest:deletePlatformApplicationRequest];

    return (SNSDeletePlatformApplicationResponse *)[self invoke:request rawRequest:deletePlatformApplicationRequest unmarshallerDelegate:[SNSDeletePlatformApplicationResponseUnmarshaller class]];
}

-(SNSListPlatformApplicationsResponse *)listPlatformApplications:(SNSListPlatformApplicationsRequest *)listPlatformApplicationsRequest
{
    AmazonServiceRequest *request = [SNSListPlatformApplicationsRequestMarshaller createRequest:listPlatformApplicationsRequest];

    return (SNSListPlatformApplicationsResponse *)[self invoke:request rawRequest:listPlatformApplicationsRequest unmarshallerDelegate:[SNSListPlatformApplicationsResponseUnmarshaller class]];
}

-(SNSSetEndpointAttributesResponse *)setEndpointAttributes:(SNSSetEndpointAttributesRequest *)setEndpointAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetEndpointAttributesRequestMarshaller createRequest:setEndpointAttributesRequest];

    return (SNSSetEndpointAttributesResponse *)[self invoke:request rawRequest:setEndpointAttributesRequest unmarshallerDelegate:[SNSSetEndpointAttributesResponseUnmarshaller class]];
}

-(SNSUnsubscribeResponse *)unsubscribe:(SNSUnsubscribeRequest *)unsubscribeRequest
{
    AmazonServiceRequest *request = [SNSUnsubscribeRequestMarshaller createRequest:unsubscribeRequest];

    return (SNSUnsubscribeResponse *)[self invoke:request rawRequest:unsubscribeRequest unmarshallerDelegate:[SNSUnsubscribeResponseUnmarshaller class]];
}

-(SNSDeleteTopicResponse *)deleteTopic:(SNSDeleteTopicRequest *)deleteTopicRequest
{
    AmazonServiceRequest *request = [SNSDeleteTopicRequestMarshaller createRequest:deleteTopicRequest];

    return (SNSDeleteTopicResponse *)[self invoke:request rawRequest:deleteTopicRequest unmarshallerDelegate:[SNSDeleteTopicResponseUnmarshaller class]];
}

-(SNSGetPlatformApplicationAttributesResponse *)getPlatformApplicationAttributes:(SNSGetPlatformApplicationAttributesRequest *)getPlatformApplicationAttributesRequest
{
    AmazonServiceRequest *request = [SNSGetPlatformApplicationAttributesRequestMarshaller createRequest:getPlatformApplicationAttributesRequest];

    return (SNSGetPlatformApplicationAttributesResponse *)[self invoke:request rawRequest:getPlatformApplicationAttributesRequest unmarshallerDelegate:[SNSGetPlatformApplicationAttributesResponseUnmarshaller class]];
}

-(SNSSetPlatformApplicationAttributesResponse *)setPlatformApplicationAttributes:(SNSSetPlatformApplicationAttributesRequest *)setPlatformApplicationAttributesRequest
{
    AmazonServiceRequest *request = [SNSSetPlatformApplicationAttributesRequestMarshaller createRequest:setPlatformApplicationAttributesRequest];

    return (SNSSetPlatformApplicationAttributesResponse *)[self invoke:request rawRequest:setPlatformApplicationAttributesRequest unmarshallerDelegate:[SNSSetPlatformApplicationAttributesResponseUnmarshaller class]];
}

-(SNSAddPermissionResponse *)addPermission:(SNSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [SNSAddPermissionRequestMarshaller createRequest:addPermissionRequest];

    return (SNSAddPermissionResponse *)[self invoke:request rawRequest:addPermissionRequest unmarshallerDelegate:[SNSAddPermissionResponseUnmarshaller class]];
}

-(SNSListEndpointsByPlatformApplicationResponse *)listEndpointsByPlatformApplication:(SNSListEndpointsByPlatformApplicationRequest *)listEndpointsByPlatformApplicationRequest
{
    AmazonServiceRequest *request = [SNSListEndpointsByPlatformApplicationRequestMarshaller createRequest:listEndpointsByPlatformApplicationRequest];

    return (SNSListEndpointsByPlatformApplicationResponse *)[self invoke:request rawRequest:listEndpointsByPlatformApplicationRequest unmarshallerDelegate:[SNSListEndpointsByPlatformApplicationResponseUnmarshaller class]];
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

