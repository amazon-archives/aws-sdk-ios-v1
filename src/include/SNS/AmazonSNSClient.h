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
#import "SNSConfirmSubscriptionResponse.h"
#import "SNSConfirmSubscriptionResponseUnmarshaller.h"
#import "SNSConfirmSubscriptionRequest.h"
#import "SNSConfirmSubscriptionRequestMarshaller.h"
#import "SNSGetTopicAttributesResponse.h"
#import "SNSGetTopicAttributesResponseUnmarshaller.h"
#import "SNSGetTopicAttributesRequest.h"
#import "SNSGetTopicAttributesRequestMarshaller.h"
#import "SNSSubscribeResponse.h"
#import "SNSSubscribeResponseUnmarshaller.h"
#import "SNSSubscribeRequest.h"
#import "SNSSubscribeRequestMarshaller.h"
#import "SNSSetTopicAttributesResponse.h"
#import "SNSSetTopicAttributesResponseUnmarshaller.h"
#import "SNSSetTopicAttributesRequest.h"
#import "SNSSetTopicAttributesRequestMarshaller.h"
#import "SNSDeleteTopicResponse.h"
#import "SNSDeleteTopicResponseUnmarshaller.h"
#import "SNSDeleteTopicRequest.h"
#import "SNSDeleteTopicRequestMarshaller.h"
#import "SNSRemovePermissionResponse.h"
#import "SNSRemovePermissionResponseUnmarshaller.h"
#import "SNSRemovePermissionRequest.h"
#import "SNSRemovePermissionRequestMarshaller.h"
#import "SNSListSubscriptionsResponse.h"
#import "SNSListSubscriptionsResponseUnmarshaller.h"
#import "SNSListSubscriptionsRequest.h"
#import "SNSListSubscriptionsRequestMarshaller.h"
#import "SNSSetSubscriptionAttributesResponse.h"
#import "SNSSetSubscriptionAttributesResponseUnmarshaller.h"
#import "SNSSetSubscriptionAttributesRequest.h"
#import "SNSSetSubscriptionAttributesRequestMarshaller.h"
#import "SNSAddPermissionResponse.h"
#import "SNSAddPermissionResponseUnmarshaller.h"
#import "SNSAddPermissionRequest.h"
#import "SNSAddPermissionRequestMarshaller.h"
#import "SNSCreateTopicResponse.h"
#import "SNSCreateTopicResponseUnmarshaller.h"
#import "SNSCreateTopicRequest.h"
#import "SNSCreateTopicRequestMarshaller.h"
#import "SNSGetSubscriptionAttributesResponse.h"
#import "SNSGetSubscriptionAttributesResponseUnmarshaller.h"
#import "SNSGetSubscriptionAttributesRequest.h"
#import "SNSGetSubscriptionAttributesRequestMarshaller.h"
#import "SNSListTopicsResponse.h"
#import "SNSListTopicsResponseUnmarshaller.h"
#import "SNSListTopicsRequest.h"
#import "SNSListTopicsRequestMarshaller.h"
#import "SNSUnsubscribeResponse.h"
#import "SNSUnsubscribeResponseUnmarshaller.h"
#import "SNSUnsubscribeRequest.h"
#import "SNSUnsubscribeRequestMarshaller.h"
#import "SNSListSubscriptionsByTopicResponse.h"
#import "SNSListSubscriptionsByTopicResponseUnmarshaller.h"
#import "SNSListSubscriptionsByTopicRequest.h"
#import "SNSListSubscriptionsByTopicRequestMarshaller.h"
#import "SNSPublishResponse.h"
#import "SNSPublishResponseUnmarshaller.h"
#import "SNSPublishRequest.h"
#import "SNSPublishRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"

/** \defgroup SNS Amazon SNS */

/** <summary>
 * Interface for accessing AmazonSNS.
 *
 *  Amazon SNS
 * </summary>
 *
 */
@interface AmazonSNSClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * The ConfirmSubscription action verifies an endpoint owner's intent to receive messages by validating the token sent to
 * the endpoint by an earlier Subscribe action. If the token is valid, the action creates a new subscription and returns
 * its Amazon Resource Name (ARN). This call requires an AWS signature only when the AuthenticateOnUnsubscribe flag is set
 * to "true".
 * </p>
 *
 * @param confirmSubscriptionRequest Container for the necessary parameters to execute the ConfirmSubscription service
 *           method on AmazonSNS.
 *
 * @return The response from the ConfirmSubscription service method, as returned by AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSSubscriptionLimitExceededException For more information see <SNSSubscriptionLimitExceededException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSConfirmSubscriptionRequest
 * @see SNSConfirmSubscriptionResponse
 */
-(SNSConfirmSubscriptionResponse *)confirmSubscription:(SNSConfirmSubscriptionRequest *)confirmSubscriptionRequest;


/**
 * <p>
 * The GetTopicAttribtues action returns all of the properties of a topic customers have created. Topic properties returned
 * might differ based on the authorization of the user.
 * </p>
 *
 * @param getTopicAttributesRequest Container for the necessary parameters to execute the GetTopicAttributes service method
 *           on AmazonSNS.
 *
 * @return The response from the GetTopicAttributes service method, as returned by AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSGetTopicAttributesRequest
 * @see SNSGetTopicAttributesResponse
 */
-(SNSGetTopicAttributesResponse *)getTopicAttributes:(SNSGetTopicAttributesRequest *)getTopicAttributesRequest;


/**
 * <p>
 * The Subscribe action prepares to subscribe an endpoint by sending the endpoint a confirmation message. To actually
 * create a subscription, the endpoint owner must call the ConfirmSubscription action with the token from the confirmation
 * message. Confirmation tokens are valid for three days.
 * </p>
 *
 * @param subscribeRequest Container for the necessary parameters to execute the Subscribe service method on AmazonSNS.
 *
 * @return The response from the Subscribe service method, as returned by AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSSubscriptionLimitExceededException For more information see <SNSSubscriptionLimitExceededException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSSubscribeRequest
 * @see SNSSubscribeResponse
 */
-(SNSSubscribeResponse *)subscribe:(SNSSubscribeRequest *)subscribeRequest;


/**
 * <p>
 * The SetTopicAttributes action allows a topic owner to set an attribute of the topic to a new value.
 * </p>
 *
 * @param setTopicAttributesRequest Container for the necessary parameters to execute the SetTopicAttributes service method
 *           on AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSSetTopicAttributesRequest
 * @see SNSSetTopicAttributesResponse
 */
-(SNSSetTopicAttributesResponse *)setTopicAttributes:(SNSSetTopicAttributesRequest *)setTopicAttributesRequest;


/**
 * <p>
 * The DeleteTopic action deletes a topic and all its subscriptions. Deleting a topic might prevent some messages
 * previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that
 * does not exist will not result in an error.
 * </p>
 *
 * @param deleteTopicRequest Container for the necessary parameters to execute the DeleteTopic service method on AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSDeleteTopicRequest
 * @see SNSDeleteTopicResponse
 */
-(SNSDeleteTopicResponse *)deleteTopic:(SNSDeleteTopicRequest *)deleteTopicRequest;


/**
 * <p>
 * The RemovePermission action removes a statement from a topic's access control policy.
 * </p>
 *
 * @param removePermissionRequest Container for the necessary parameters to execute the RemovePermission service method on
 *           AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSRemovePermissionRequest
 * @see SNSRemovePermissionResponse
 */
-(SNSRemovePermissionResponse *)removePermission:(SNSRemovePermissionRequest *)removePermissionRequest;


/**
 * <p>
 * The ListSubscriptions action returns a list of the requester's subscriptions. Each call returns a limited list of
 * subscriptions, up to 100. If there are more subscriptions, a NextToken is also returned. Use the NextToken parameter in
 * a new ListSubscriptions call to get further results.
 * </p>
 *
 * @param listSubscriptionsRequest Container for the necessary parameters to execute the ListSubscriptions service method
 *           on AmazonSNS.
 *
 * @return The response from the ListSubscriptions service method, as returned by AmazonSNS.
 *
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSListSubscriptionsRequest
 * @see SNSListSubscriptionsResponse
 */
-(SNSListSubscriptionsResponse *)listSubscriptions:(SNSListSubscriptionsRequest *)listSubscriptionsRequest;


/**
 * <p>
 * The SetSubscriptionAttributes action allows a subscription owner to set an attribute of the topic to a new value.
 * </p>
 *
 * @param setSubscriptionAttributesRequest Container for the necessary parameters to execute the SetSubscriptionAttributes
 *           service method on AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSSetSubscriptionAttributesRequest
 * @see SNSSetSubscriptionAttributesResponse
 */
-(SNSSetSubscriptionAttributesResponse *)setSubscriptionAttributes:(SNSSetSubscriptionAttributesRequest *)setSubscriptionAttributesRequest;


/**
 * <p>
 * The AddPermission action adds a statement to a topic's access control policy, granting access for the specified AWS
 * accounts to the specified actions.
 * </p>
 *
 * @param addPermissionRequest Container for the necessary parameters to execute the AddPermission service method on
 *           AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSAddPermissionRequest
 * @see SNSAddPermissionResponse
 */
-(SNSAddPermissionResponse *)addPermission:(SNSAddPermissionRequest *)addPermissionRequest;


/**
 * <p>
 * The CreateTopic action creates a topic to which notifications can be published. Users can create at most 25 topics. This
 * action is idempotent, so if the requester already owns a topic with the specified name, that topic's ARN will be
 * returned without creating a new topic.
 * </p>
 *
 * @param createTopicRequest Container for the necessary parameters to execute the CreateTopic service method on AmazonSNS.
 *
 * @return The response from the CreateTopic service method, as returned by AmazonSNS.
 *
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 * @exception SNSTopicLimitExceededException For more information see <SNSTopicLimitExceededException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSCreateTopicRequest
 * @see SNSCreateTopicResponse
 */
-(SNSCreateTopicResponse *)createTopic:(SNSCreateTopicRequest *)createTopicRequest;


/**
 * <p>
 * The GetSubscriptionAttribtues action returns all of the properties of a subscription.
 * </p>
 *
 * @param getSubscriptionAttributesRequest Container for the necessary parameters to execute the GetSubscriptionAttributes
 *           service method on AmazonSNS.
 *
 * @return The response from the GetSubscriptionAttributes service method, as returned by AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSGetSubscriptionAttributesRequest
 * @see SNSGetSubscriptionAttributesResponse
 */
-(SNSGetSubscriptionAttributesResponse *)getSubscriptionAttributes:(SNSGetSubscriptionAttributesRequest *)getSubscriptionAttributesRequest;


/**
 * <p>
 * The ListTopics action returns a list of the requester's topics. Each call returns a limited list of topics, up to 100.
 * If there are more topics, a NextToken is also returned. Use the NextToken parameter in a new ListTopics call to get
 * further results.
 * </p>
 *
 * @param listTopicsRequest Container for the necessary parameters to execute the ListTopics service method on AmazonSNS.
 *
 * @return The response from the ListTopics service method, as returned by AmazonSNS.
 *
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSListTopicsRequest
 * @see SNSListTopicsResponse
 */
-(SNSListTopicsResponse *)listTopics:(SNSListTopicsRequest *)listTopicsRequest;


/**
 * <p>
 * The Unsubscribe action deletes a subscription. If the subscription requires authentication for deletion, only the owner
 * of the subscription or the its topic's owner can unsubscribe, and an AWS signature is required. If the Unsubscribe call
 * does not require authentication and the requester is not the subscription owner, a final cancellation message is
 * delivered to the endpoint, so that the endpoint owner can easily resubscribe to the topic if the Unsubscribe request was
 * unintended.
 * </p>
 *
 * @param unsubscribeRequest Container for the necessary parameters to execute the Unsubscribe service method on AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSUnsubscribeRequest
 * @see SNSUnsubscribeResponse
 */
-(SNSUnsubscribeResponse *)unsubscribe:(SNSUnsubscribeRequest *)unsubscribeRequest;


/**
 * <p>
 * The ListSubscriptionsByTopic action returns a list of the subscriptions to a specific topic. Each call returns a limited
 * list of subscriptions, up to 100. If there are more subscriptions, a NextToken is also returned. Use the NextToken
 * parameter in a new ListSubscriptionsByTopic call to get further results.
 * </p>
 *
 * @param listSubscriptionsByTopicRequest Container for the necessary parameters to execute the ListSubscriptionsByTopic
 *           service method on AmazonSNS.
 *
 * @return The response from the ListSubscriptionsByTopic service method, as returned by AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSListSubscriptionsByTopicRequest
 * @see SNSListSubscriptionsByTopicResponse
 */
-(SNSListSubscriptionsByTopicResponse *)listSubscriptionsByTopic:(SNSListSubscriptionsByTopicRequest *)listSubscriptionsByTopicRequest;


/**
 * <p>
 * The Publish action sends a message to all of a topic's subscribed endpoints. When a messageId is returned, the message
 * has been saved and Amazon SNS will attempt to deliver it to the topic's subscribers shortly. The format of the outgoing
 * message to each subscribed endpoint depends on the notification protocol selected.
 * </p>
 *
 * @param publishRequest Container for the necessary parameters to execute the Publish service method on AmazonSNS.
 *
 * @return The response from the Publish service method, as returned by AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSAuthorizationErrorException For more information see <SNSAuthorizationErrorException>
 * @exception SNSInternalErrorException For more information see <SNSInternalErrorException>
 * @exception SNSInvalidParameterException For more information see <SNSInvalidParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSNS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SNSPublishRequest
 * @see SNSPublishResponse
 */
-(SNSPublishResponse *)publish:(SNSPublishRequest *)publishRequest;



@end

