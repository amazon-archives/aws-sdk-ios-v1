/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

-(id)initWithAccessKey:(NSString*)theAccessKey withSecretKey:(NSString*)theSecretKey {
    if ( self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey] ) {
        self.endpoint = @"https://sns.us-east-1.amazonaws.com";
        [AmazonSNSClient initializeResponseObjects];
    }
    return self;
}

-(SNSConfirmSubscriptionResponse*)confirmSubscription:(SNSConfirmSubscriptionRequest*)confirmSubscriptionRequest {                 
        AmazonServiceRequest* request = [SNSConfirmSubscriptionRequestMarshaller createRequest:confirmSubscriptionRequest];
        return (SNSConfirmSubscriptionResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSConfirmSubscriptionResponseUnmarshaller class]];
        }

-(SNSGetTopicAttributesResponse*)getTopicAttributes:(SNSGetTopicAttributesRequest*)getTopicAttributesRequest {                 
        AmazonServiceRequest* request = [SNSGetTopicAttributesRequestMarshaller createRequest:getTopicAttributesRequest];
        return (SNSGetTopicAttributesResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSGetTopicAttributesResponseUnmarshaller class]];
        }

-(SNSSubscribeResponse*)subscribe:(SNSSubscribeRequest*)subscribeRequest {                 
        AmazonServiceRequest* request = [SNSSubscribeRequestMarshaller createRequest:subscribeRequest];
        return (SNSSubscribeResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSSubscribeResponseUnmarshaller class]];
        }

-(SNSSetTopicAttributesResponse*)setTopicAttributes:(SNSSetTopicAttributesRequest*)setTopicAttributesRequest {                 
        AmazonServiceRequest* request = [SNSSetTopicAttributesRequestMarshaller createRequest:setTopicAttributesRequest];
        return (SNSSetTopicAttributesResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSSetTopicAttributesResponseUnmarshaller class]];
        }

-(SNSDeleteTopicResponse*)deleteTopic:(SNSDeleteTopicRequest*)deleteTopicRequest {                 
        AmazonServiceRequest* request = [SNSDeleteTopicRequestMarshaller createRequest:deleteTopicRequest];
        return (SNSDeleteTopicResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSDeleteTopicResponseUnmarshaller class]];
        }

-(SNSRemovePermissionResponse*)removePermission:(SNSRemovePermissionRequest*)removePermissionRequest {                 
        AmazonServiceRequest* request = [SNSRemovePermissionRequestMarshaller createRequest:removePermissionRequest];
        return (SNSRemovePermissionResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSRemovePermissionResponseUnmarshaller class]];
        }

-(SNSListSubscriptionsResponse*)listSubscriptions:(SNSListSubscriptionsRequest*)listSubscriptionsRequest {                 
        AmazonServiceRequest* request = [SNSListSubscriptionsRequestMarshaller createRequest:listSubscriptionsRequest];
        return (SNSListSubscriptionsResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSListSubscriptionsResponseUnmarshaller class]];
        }

-(SNSAddPermissionResponse*)addPermission:(SNSAddPermissionRequest*)addPermissionRequest {                 
        AmazonServiceRequest* request = [SNSAddPermissionRequestMarshaller createRequest:addPermissionRequest];
        return (SNSAddPermissionResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSAddPermissionResponseUnmarshaller class]];
        }

-(SNSCreateTopicResponse*)createTopic:(SNSCreateTopicRequest*)createTopicRequest {                 
        AmazonServiceRequest* request = [SNSCreateTopicRequestMarshaller createRequest:createTopicRequest];
        return (SNSCreateTopicResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSCreateTopicResponseUnmarshaller class]];
        }

-(SNSListTopicsResponse*)listTopics:(SNSListTopicsRequest*)listTopicsRequest {                 
        AmazonServiceRequest* request = [SNSListTopicsRequestMarshaller createRequest:listTopicsRequest];
        return (SNSListTopicsResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSListTopicsResponseUnmarshaller class]];
        }

-(SNSUnsubscribeResponse*)unsubscribe:(SNSUnsubscribeRequest*)unsubscribeRequest {                 
        AmazonServiceRequest* request = [SNSUnsubscribeRequestMarshaller createRequest:unsubscribeRequest];
        return (SNSUnsubscribeResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSUnsubscribeResponseUnmarshaller class]];
        }

-(SNSListSubscriptionsByTopicResponse*)listSubscriptionsByTopic:(SNSListSubscriptionsByTopicRequest*)listSubscriptionsByTopicRequest {                 
        AmazonServiceRequest* request = [SNSListSubscriptionsByTopicRequestMarshaller createRequest:listSubscriptionsByTopicRequest];
        return (SNSListSubscriptionsByTopicResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSListSubscriptionsByTopicResponseUnmarshaller class]];
        }

-(SNSPublishResponse*)publish:(SNSPublishRequest*)publishRequest {                 
        AmazonServiceRequest* request = [SNSPublishRequestMarshaller createRequest:publishRequest];
        return (SNSPublishResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SNSPublishResponseUnmarshaller class]];
        }


+(void)initializeResponseObjects 
{
        [SNSConfirmSubscriptionResponse class];
    [SNSGetTopicAttributesResponse class];
    [SNSSubscribeResponse class];
    [SNSSetTopicAttributesResponse class];
    [SNSDeleteTopicResponse class];
    [SNSRemovePermissionResponse class];
    [SNSListSubscriptionsResponse class];
    [SNSAddPermissionResponse class];
    [SNSCreateTopicResponse class];
    [SNSListTopicsResponse class];
    [SNSUnsubscribeResponse class];
    [SNSListSubscriptionsByTopicResponse class];
    [SNSPublishResponse class];

}


@end
	
	