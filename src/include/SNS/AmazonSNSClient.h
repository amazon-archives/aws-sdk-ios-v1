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
#import "SNSConfirmSubscriptionResponse.h"
#import "SNSConfirmSubscriptionRequest.h"
#import "SNSCreatePlatformApplicationResponse.h"
#import "SNSCreatePlatformApplicationRequest.h"
#import "SNSGetTopicAttributesResponse.h"
#import "SNSGetTopicAttributesRequest.h"
#import "SNSSubscribeResponse.h"
#import "SNSSubscribeRequest.h"
#import "SNSDeleteEndpointResponse.h"
#import "SNSDeleteEndpointRequest.h"
#import "SNSSetTopicAttributesResponse.h"
#import "SNSSetTopicAttributesRequest.h"
#import "SNSRemovePermissionResponse.h"
#import "SNSRemovePermissionRequest.h"
#import "SNSGetEndpointAttributesResponse.h"
#import "SNSGetEndpointAttributesRequest.h"
#import "SNSListSubscriptionsResponse.h"
#import "SNSListSubscriptionsRequest.h"
#import "SNSCreatePlatformEndpointResponse.h"
#import "SNSCreatePlatformEndpointRequest.h"
#import "SNSSetSubscriptionAttributesResponse.h"
#import "SNSSetSubscriptionAttributesRequest.h"
#import "SNSCreateTopicResponse.h"
#import "SNSCreateTopicRequest.h"
#import "SNSGetSubscriptionAttributesResponse.h"
#import "SNSGetSubscriptionAttributesRequest.h"
#import "SNSListTopicsResponse.h"
#import "SNSListTopicsRequest.h"
#import "SNSDeletePlatformApplicationResponse.h"
#import "SNSDeletePlatformApplicationRequest.h"
#import "SNSListPlatformApplicationsResponse.h"
#import "SNSListPlatformApplicationsRequest.h"
#import "SNSSetEndpointAttributesResponse.h"
#import "SNSSetEndpointAttributesRequest.h"
#import "SNSUnsubscribeResponse.h"
#import "SNSUnsubscribeRequest.h"
#import "SNSDeleteTopicResponse.h"
#import "SNSDeleteTopicRequest.h"
#import "SNSGetPlatformApplicationAttributesResponse.h"
#import "SNSGetPlatformApplicationAttributesRequest.h"
#import "SNSSetPlatformApplicationAttributesResponse.h"
#import "SNSSetPlatformApplicationAttributesRequest.h"
#import "SNSAddPermissionResponse.h"
#import "SNSAddPermissionRequest.h"
#import "SNSListEndpointsByPlatformApplicationResponse.h"
#import "SNSListEndpointsByPlatformApplicationRequest.h"
#import "SNSListSubscriptionsByTopicResponse.h"
#import "SNSListSubscriptionsByTopicRequest.h"
#import "SNSPublishResponse.h"
#import "SNSPublishRequest.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonWebServiceClient.h>
#else
#import "../AmazonWebServiceClient.h"
#endif

/** \defgroup SNS Amazon SNS */

/** <summary>
 * Interface for accessing AmazonSNS.
 *
 *  Amazon SNS
 * </summary>
 *
 * See our blog to learn more about Managing Credentials in Mobile Applications.
 * @see http://mobile.awsblog.com/post/Tx31X75XISXHRH8/Managing-Credentials-in-Mobile-Applications
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
 * The CreatePlatformApplication action creates a platform application object for one of the supported push notification
 * services, such as APNS and GCM, to which devices and mobile apps may register. You must specify PlatformPrincipal and
 * PlatformCredential attributes when using the CreatePlatformApplication action. The PlatformPrincipal is received from
 * the notification service. For APNS/APNS_SANDBOX, PlatformPrincipal is "SSL certificate". For GCM, PlatformPrincipal is
 * not applicable. For ADM, PlatformPrincipal is "client id". The PlatformCredential is also received from the
 * notification service. For APNS/APNS_SANDBOX, PlatformCredential is "private key". For GCM, PlatformCredential is "API
 * key". For ADM, PlatformCredential is "client secret". The PlatformApplicationArn that is returned when using
 * CreatePlatformApplication is then used as an attribute for the CreatePlatformEndpoint action. For more information, see
 * <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param createPlatformApplicationRequest Container for the necessary parameters to execute the CreatePlatformApplication
 *           service method on AmazonSNS.
 *
 * @return The response from the CreatePlatformApplication service method, as returned by AmazonSNS.
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
 * @see SNSCreatePlatformApplicationRequest
 * @see SNSCreatePlatformApplicationResponse
 */
-(SNSCreatePlatformApplicationResponse *)createPlatformApplication:(SNSCreatePlatformApplicationRequest *)createPlatformApplicationRequest;


/**
 * <p>
 * The GetTopicAttributes action returns all of the properties of a topic. Topic properties returned might differ based on
 * the authorization of the user.
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
 * The DeleteEndpoint action, which is idempotent, deletes the endpoint from SNS. For more information, see <a
 * href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param deleteEndpointRequest Container for the necessary parameters to execute the DeleteEndpoint service method on
 *           AmazonSNS.
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
 * @see SNSDeleteEndpointRequest
 * @see SNSDeleteEndpointResponse
 */
-(SNSDeleteEndpointResponse *)deleteEndpoint:(SNSDeleteEndpointRequest *)deleteEndpointRequest;


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
 * The GetEndpointAttributes retrieves the endpoint attributes for a device on one of the supported push notification
 * services, such as GCM and APNS. For more information, see <a
 * href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param getEndpointAttributesRequest Container for the necessary parameters to execute the GetEndpointAttributes service
 *           method on AmazonSNS.
 *
 * @return The response from the GetEndpointAttributes service method, as returned by AmazonSNS.
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
 * @see SNSGetEndpointAttributesRequest
 * @see SNSGetEndpointAttributesResponse
 */
-(SNSGetEndpointAttributesResponse *)getEndpointAttributes:(SNSGetEndpointAttributesRequest *)getEndpointAttributesRequest;


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
 * The CreatePlatformEndpoint creates an endpoint for a device and mobile app on one of the supported push notification
 * services, such as GCM and APNS. CreatePlatformEndpoint requires the PlatformApplicationArn that is returned from
 * CreatePlatformApplication . The EndpointArn that is returned when using CreatePlatformEndpoint can then be used by the
 * Publish action to send a message to a mobile app or by the Subscribe action for subscription to a topic. For more
 * information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push
 * Notifications </a> .
 * </p>
 *
 * @param createPlatformEndpointRequest Container for the necessary parameters to execute the CreatePlatformEndpoint
 *           service method on AmazonSNS.
 *
 * @return The response from the CreatePlatformEndpoint service method, as returned by AmazonSNS.
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
 * @see SNSCreatePlatformEndpointRequest
 * @see SNSCreatePlatformEndpointResponse
 */
-(SNSCreatePlatformEndpointResponse *)createPlatformEndpoint:(SNSCreatePlatformEndpointRequest *)createPlatformEndpointRequest;


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
 * The CreateTopic action creates a topic to which notifications can be published. Users can create at most 100 topics. For
 * more information, see <a href="http://aws.amazon.com/sns/"> http://aws.amazon.com/sns </a> . This action is idempotent,
 * so if the requester already owns a topic with the specified name, that topic's ARN is returned without creating a new
 * topic.
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
 * The DeletePlatformApplication action deletes a platform application object for one of the supported push notification
 * services, such as APNS and GCM. For more information, see <a
 * href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param deletePlatformApplicationRequest Container for the necessary parameters to execute the DeletePlatformApplication
 *           service method on AmazonSNS.
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
 * @see SNSDeletePlatformApplicationRequest
 * @see SNSDeletePlatformApplicationResponse
 */
-(SNSDeletePlatformApplicationResponse *)deletePlatformApplication:(SNSDeletePlatformApplicationRequest *)deletePlatformApplicationRequest;


/**
 * <p>
 * The ListPlatformApplications action lists the platform application objects for the supported push notification services,
 * such as APNS and GCM. The results for ListPlatformApplications are paginated and return a limited list of applications,
 * up to 100. If additional records are available after the first page results, then a NextToken string will be returned.
 * To receive the next page, you call ListPlatformApplications using the NextToken string received from the previous call.
 * When there are no more records to return, NextToken will be null. For more information, see <a
 * href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param listPlatformApplicationsRequest Container for the necessary parameters to execute the ListPlatformApplications
 *           service method on AmazonSNS.
 *
 * @return The response from the ListPlatformApplications service method, as returned by AmazonSNS.
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
 * @see SNSListPlatformApplicationsRequest
 * @see SNSListPlatformApplicationsResponse
 */
-(SNSListPlatformApplicationsResponse *)listPlatformApplications:(SNSListPlatformApplicationsRequest *)listPlatformApplicationsRequest;


/**
 * <p>
 * The SetEndpointAttributes action sets the attributes for an endpoint for a device on one of the supported push
 * notification services, such as GCM and APNS. For more information, see <a
 * href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param setEndpointAttributesRequest Container for the necessary parameters to execute the SetEndpointAttributes service
 *           method on AmazonSNS.
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
 * @see SNSSetEndpointAttributesRequest
 * @see SNSSetEndpointAttributesResponse
 */
-(SNSSetEndpointAttributesResponse *)setEndpointAttributes:(SNSSetEndpointAttributesRequest *)setEndpointAttributesRequest;


/**
 * <p>
 * The Unsubscribe action deletes a subscription. If the subscription requires authentication for deletion, only the owner
 * of the subscription or the topic's owner can unsubscribe, and an AWS signature is required. If the Unsubscribe call does
 * not require authentication and the requester is not the subscription owner, a final cancellation message is delivered to
 * the endpoint, so that the endpoint owner can easily resubscribe to the topic if the Unsubscribe request was unintended.
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
 * The DeleteTopic action deletes a topic and all its subscriptions. Deleting a topic might prevent some messages
 * previously sent to the topic from being delivered to subscribers. This action is idempotent, so deleting a topic that
 * does not exist does not result in an error.
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
 * The GetPlatformApplicationAttributes action retrieves the attributes of the platform application object for the
 * supported push notification services, such as APNS and GCM. For more information, see <a
 * href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param getPlatformApplicationAttributesRequest Container for the necessary parameters to execute the
 *           GetPlatformApplicationAttributes service method on AmazonSNS.
 *
 * @return The response from the GetPlatformApplicationAttributes service method, as returned by AmazonSNS.
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
 * @see SNSGetPlatformApplicationAttributesRequest
 * @see SNSGetPlatformApplicationAttributesResponse
 */
-(SNSGetPlatformApplicationAttributesResponse *)getPlatformApplicationAttributes:(SNSGetPlatformApplicationAttributesRequest *)getPlatformApplicationAttributesRequest;


/**
 * <p>
 * The SetPlatformApplicationAttributes action sets the attributes of the platform application object for the supported
 * push notification services, such as APNS and GCM. For more information, see <a
 * href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile Push Notifications </a> .
 * </p>
 *
 * @param setPlatformApplicationAttributesRequest Container for the necessary parameters to execute the
 *           SetPlatformApplicationAttributes service method on AmazonSNS.
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
 * @see SNSSetPlatformApplicationAttributesRequest
 * @see SNSSetPlatformApplicationAttributesResponse
 */
-(SNSSetPlatformApplicationAttributesResponse *)setPlatformApplicationAttributes:(SNSSetPlatformApplicationAttributesRequest *)setPlatformApplicationAttributesRequest;


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
 * The ListEndpointsByPlatformApplication action lists the endpoints and endpoint attributes for devices in a supported
 * push notification service, such as GCM and APNS. The results for ListEndpointsByPlatformApplication are paginated and
 * return a limited list of endpoints, up to 100. If additional records are available after the first page results, then a
 * NextToken string will be returned. To receive the next page, you call ListEndpointsByPlatformApplication again using the
 * NextToken string received from the previous call. When there are no more records to return, NextToken will be null. For
 * more information, see <a href="http://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html"> Using Amazon SNS Mobile
 * Push Notifications </a> .
 * </p>
 *
 * @param listEndpointsByPlatformApplicationRequest Container for the necessary parameters to execute the
 *           ListEndpointsByPlatformApplication service method on AmazonSNS.
 *
 * @return The response from the ListEndpointsByPlatformApplication service method, as returned by AmazonSNS.
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
 * @see SNSListEndpointsByPlatformApplicationRequest
 * @see SNSListEndpointsByPlatformApplicationResponse
 */
-(SNSListEndpointsByPlatformApplicationResponse *)listEndpointsByPlatformApplication:(SNSListEndpointsByPlatformApplicationRequest *)listEndpointsByPlatformApplicationRequest;


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
 * <p>
 * To use the Publish action for sending a message to a mobile endpoint, such as an app on a Kindle device or mobile phone,
 * you must specify the EndpointArn. The EndpointArn is returned when making a call with the CreatePlatformEndpoint action.
 * The second example below shows a request and response for publishing to a mobile endpoint.
 * </p>
 *
 * @param publishRequest Container for the necessary parameters to execute the Publish service method on AmazonSNS.
 *
 * @return The response from the Publish service method, as returned by AmazonSNS.
 *
 * @exception SNSNotFoundException For more information see <SNSNotFoundException>
 * @exception SNSPlatformApplicationDisabledException For more information see <SNSPlatformApplicationDisabledException>
 * @exception SNSEndpointDisabledException For more information see <SNSEndpointDisabledException>
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

