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
#import "SQSSetQueueAttributesResponse.h"
#import "SQSSetQueueAttributesResponseUnmarshaller.h"
#import "SQSSetQueueAttributesRequest.h"
#import "SQSSetQueueAttributesRequestMarshaller.h"
#import "SQSChangeMessageVisibilityBatchResponse.h"
#import "SQSChangeMessageVisibilityBatchResponseUnmarshaller.h"
#import "SQSChangeMessageVisibilityBatchRequest.h"
#import "SQSChangeMessageVisibilityBatchRequestMarshaller.h"
#import "SQSChangeMessageVisibilityResponse.h"
#import "SQSChangeMessageVisibilityResponseUnmarshaller.h"
#import "SQSChangeMessageVisibilityRequest.h"
#import "SQSChangeMessageVisibilityRequestMarshaller.h"
#import "SQSGetQueueUrlResponse.h"
#import "SQSGetQueueUrlResponseUnmarshaller.h"
#import "SQSGetQueueUrlRequest.h"
#import "SQSGetQueueUrlRequestMarshaller.h"
#import "SQSRemovePermissionResponse.h"
#import "SQSRemovePermissionResponseUnmarshaller.h"
#import "SQSRemovePermissionRequest.h"
#import "SQSRemovePermissionRequestMarshaller.h"
#import "SQSGetQueueAttributesResponse.h"
#import "SQSGetQueueAttributesResponseUnmarshaller.h"
#import "SQSGetQueueAttributesRequest.h"
#import "SQSGetQueueAttributesRequestMarshaller.h"
#import "SQSSendMessageBatchResponse.h"
#import "SQSSendMessageBatchResponseUnmarshaller.h"
#import "SQSSendMessageBatchRequest.h"
#import "SQSSendMessageBatchRequestMarshaller.h"
#import "SQSDeleteQueueResponse.h"
#import "SQSDeleteQueueResponseUnmarshaller.h"
#import "SQSDeleteQueueRequest.h"
#import "SQSDeleteQueueRequestMarshaller.h"
#import "SQSSendMessageResponse.h"
#import "SQSSendMessageResponseUnmarshaller.h"
#import "SQSSendMessageRequest.h"
#import "SQSSendMessageRequestMarshaller.h"
#import "SQSReceiveMessageResponse.h"
#import "SQSReceiveMessageResponseUnmarshaller.h"
#import "SQSReceiveMessageRequest.h"
#import "SQSReceiveMessageRequestMarshaller.h"
#import "SQSListQueuesResponse.h"
#import "SQSListQueuesResponseUnmarshaller.h"
#import "SQSListQueuesRequest.h"
#import "SQSListQueuesRequestMarshaller.h"
#import "SQSDeleteMessageBatchResponse.h"
#import "SQSDeleteMessageBatchResponseUnmarshaller.h"
#import "SQSDeleteMessageBatchRequest.h"
#import "SQSDeleteMessageBatchRequestMarshaller.h"
#import "SQSCreateQueueResponse.h"
#import "SQSCreateQueueResponseUnmarshaller.h"
#import "SQSCreateQueueRequest.h"
#import "SQSCreateQueueRequestMarshaller.h"
#import "SQSAddPermissionResponse.h"
#import "SQSAddPermissionResponseUnmarshaller.h"
#import "SQSAddPermissionRequest.h"
#import "SQSAddPermissionRequestMarshaller.h"
#import "SQSDeleteMessageResponse.h"
#import "SQSDeleteMessageResponseUnmarshaller.h"
#import "SQSDeleteMessageRequest.h"
#import "SQSDeleteMessageRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"

/** \defgroup SQS Amazon SQS */

/** <summary>
 * Interface for accessing AmazonSQS.
 *
 *  Amazon SQS
 * </summary>
 *
 */
@interface AmazonSQSClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Sets the value of one or more queue attributes. Valid attributes that can be set are [VisibilityTimeout, Policy,
 * MaximumMessageSize, MessageRetentionPeriod, ReceiveMessageWaitTimeSeconds].
 * </p>
 *
 * @param setQueueAttributesRequest Container for the necessary parameters to execute the SetQueueAttributes service method
 *           on AmazonSQS.
 *
 * @exception SQSInvalidAttributeNameException For more information see <SQSInvalidAttributeNameException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSSetQueueAttributesRequest
 * @see SQSSetQueueAttributesResponse
 */
-(SQSSetQueueAttributesResponse *)setQueueAttributes:(SQSSetQueueAttributesRequest *)setQueueAttributesRequest;


/**
 * <p>
 * This is a batch version of ChangeMessageVisibility. It takes multiple receipt handles and performs the operation on each
 * of the them. The result of the operation on each message is reported individually in the response.
 * </p>
 *
 * @param changeMessageVisibilityBatchRequest Container for the necessary parameters to execute the
 *           ChangeMessageVisibilityBatch service method on AmazonSQS.
 *
 * @return The response from the ChangeMessageVisibilityBatch service method, as returned by AmazonSQS.
 *
 * @exception SQSBatchEntryIdsNotDistinctException For more information see <SQSBatchEntryIdsNotDistinctException>
 * @exception SQSTooManyEntriesInBatchRequestException For more information see <SQSTooManyEntriesInBatchRequestException>
 * @exception SQSInvalidBatchEntryIdException For more information see <SQSInvalidBatchEntryIdException>
 * @exception SQSEmptyBatchRequestException For more information see <SQSEmptyBatchRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSChangeMessageVisibilityBatchRequest
 * @see SQSChangeMessageVisibilityBatchResponse
 */
-(SQSChangeMessageVisibilityBatchResponse *)changeMessageVisibilityBatch:(SQSChangeMessageVisibilityBatchRequest *)changeMessageVisibilityBatchRequest;


/**
 * <p>
 * The ChangeMessageVisibility action changes the visibility timeout of a specified message in a queue to a new value. The
 * maximum allowed timeout value you can set the value to is 12 hours. This means you can't extend the timeout of a message
 * in an existing queue to more than a total visibility timeout of 12 hours. (For more information visibility timeout, see
 * <a href="http://docs.amazonwebservices.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html"> Visibility
 * Timeout </a> in the Amazon SQS Developer Guide.)
 * </p>
 * <p>
 * For example, let's say you have a message and its default message visibility timeout is 30 minutes. You could call
 * ChangeMessageVisiblity with a value of two hours and the effective timeout would be two hours and 30 minutes. When that
 * time comes near you could again extend the time out by calling ChangeMessageVisiblity, but this time the maximum allowed
 * timeout would be 9 hours and 30 minutes.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>If you attempt to set the VisibilityTimeout to an amount more than the maximum time left, Amazon SQS
 * returns an error. It will not automatically recalculate and increase the timeout to the maximum time remaining.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>Unlike with a queue, when you change the visibility timeout for a specific message, that timeout value
 * is applied immediately but is not saved in memory for that message. If you don't delete a message after it is received,
 * the visibility timeout for the message the next time it is received reverts to the original timeout value, not the value
 * you set with the ChangeMessageVisibility action.
 * </p>
 *
 * @param changeMessageVisibilityRequest Container for the necessary parameters to execute the ChangeMessageVisibility
 *           service method on AmazonSQS.
 *
 * @exception SQSReceiptHandleIsInvalidException For more information see <SQSReceiptHandleIsInvalidException>
 * @exception SQSMessageNotInflightException For more information see <SQSMessageNotInflightException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSChangeMessageVisibilityRequest
 * @see SQSChangeMessageVisibilityResponse
 */
-(SQSChangeMessageVisibilityResponse *)changeMessageVisibility:(SQSChangeMessageVisibilityRequest *)changeMessageVisibilityRequest;


/**
 * <p>
 * The GetQueueUrl action returns the URL of an existing queue.
 * </p>
 *
 * @param getQueueUrlRequest Container for the necessary parameters to execute the GetQueueUrl service method on AmazonSQS.
 *
 * @return The response from the GetQueueUrl service method, as returned by AmazonSQS.
 *
 * @exception SQSQueueDoesNotExistException For more information see <SQSQueueDoesNotExistException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSGetQueueUrlRequest
 * @see SQSGetQueueUrlResponse
 */
-(SQSGetQueueUrlResponse *)getQueueUrl:(SQSGetQueueUrlRequest *)getQueueUrlRequest;


/**
 * <p>
 * The RemovePermission action revokes any permissions in the queue policy that matches the specified Label parameter. Only
 * the owner of the queue can remove permissions.
 * </p>
 *
 * @param removePermissionRequest Container for the necessary parameters to execute the RemovePermission service method on
 *           AmazonSQS.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSRemovePermissionRequest
 * @see SQSRemovePermissionResponse
 */
-(SQSRemovePermissionResponse *)removePermission:(SQSRemovePermissionRequest *)removePermissionRequest;


/**
 * <p>
 * Gets attributes for the specified queue. The following attributes are supported:
 * <ul>
 * <li> All - returns all values.</li>
 * <li> ApproximateNumberOfMessages - returns the approximate number of visible messages in a queue. For more information,
 * see Resources Required to Process Messages in the Amazon SQS Developer Guide.</li>
 * <li> ApproximateNumberOfMessagesNotVisible - returns the approximate number of messages that are not timed-out and not
 * deleted. For more information, see Resources Required to Process Messages in the Amazon SQS Developer Guide.</li>
 * <li> VisibilityTimeout - returns the visibility timeout for the queue. For more information about visibility timeout,
 * see Visibility Timeout in the Amazon SQS Developer Guide.</li>
 * <li> CreatedTimestamp - returns the time when the queue was created (epoch time in seconds).</li>
 * <li> LastModifiedTimestamp - returns the time when the queue was last changed (epoch time in seconds).</li>
 * <li> Policy - returns the queue's policy.</li>
 * <li> MaximumMessageSize - returns the limit of how many bytes a message can contain before Amazon SQS rejects it.</li>
 * <li> MessageRetentionPeriod - returns the number of seconds Amazon SQS retains a message.</li>
 * <li> QueueArn - returns the queue's Amazon resource name (ARN).</li>
 * <li> ApproximateNumberOfMessagesDelayed - returns the approximate number of messages that are pending to be added to
 * the queue.</li>
 * <li> DelaySeconds - returns the default delay on the queue in seconds.</li>
 * <li> ReceiveMessageWaitTimeSeconds - returns the time for which a ReceiveMessage call will wait for a message to
 * arrive.</li>
 *
 * </ul>
 *
 * </p>
 *
 * @param getQueueAttributesRequest Container for the necessary parameters to execute the GetQueueAttributes service method
 *           on AmazonSQS.
 *
 * @return The response from the GetQueueAttributes service method, as returned by AmazonSQS.
 *
 * @exception SQSInvalidAttributeNameException For more information see <SQSInvalidAttributeNameException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSGetQueueAttributesRequest
 * @see SQSGetQueueAttributesResponse
 */
-(SQSGetQueueAttributesResponse *)getQueueAttributes:(SQSGetQueueAttributesRequest *)getQueueAttributesRequest;


/**
 * <p>
 * This is a batch version of SendMessage. It takes multiple messages and adds each of them to the queue. The result of
 * each add operation is reported individually in the response.
 * </p>
 *
 * @param sendMessageBatchRequest Container for the necessary parameters to execute the SendMessageBatch service method on
 *           AmazonSQS.
 *
 * @return The response from the SendMessageBatch service method, as returned by AmazonSQS.
 *
 * @exception SQSBatchEntryIdsNotDistinctException For more information see <SQSBatchEntryIdsNotDistinctException>
 * @exception SQSTooManyEntriesInBatchRequestException For more information see <SQSTooManyEntriesInBatchRequestException>
 * @exception SQSBatchRequestTooLongException For more information see <SQSBatchRequestTooLongException>
 * @exception SQSInvalidBatchEntryIdException For more information see <SQSInvalidBatchEntryIdException>
 * @exception SQSEmptyBatchRequestException For more information see <SQSEmptyBatchRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSSendMessageBatchRequest
 * @see SQSSendMessageBatchResponse
 */
-(SQSSendMessageBatchResponse *)sendMessageBatch:(SQSSendMessageBatchRequest *)sendMessageBatchRequest;


/**
 * <p>
 * This action unconditionally deletes the queue specified by the queue URL. Use this operation WITH CARE! The queue is
 * deleted even if it is NOT empty.
 * </p>
 * <p>
 * Once a queue has been deleted, the queue name is unavailable for use with new queues for 60 seconds.
 * </p>
 *
 * @param deleteQueueRequest Container for the necessary parameters to execute the DeleteQueue service method on AmazonSQS.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSDeleteQueueRequest
 * @see SQSDeleteQueueResponse
 */
-(SQSDeleteQueueResponse *)deleteQueue:(SQSDeleteQueueRequest *)deleteQueueRequest;


/**
 * <p>
 * The SendMessage action delivers a message to the specified queue.
 * </p>
 *
 * @param sendMessageRequest Container for the necessary parameters to execute the SendMessage service method on AmazonSQS.
 *
 * @return The response from the SendMessage service method, as returned by AmazonSQS.
 *
 * @exception SQSInvalidMessageContentsException For more information see <SQSInvalidMessageContentsException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSSendMessageRequest
 * @see SQSSendMessageResponse
 */
-(SQSSendMessageResponse *)sendMessage:(SQSSendMessageRequest *)sendMessageRequest;


/**
 * <p>
 * Retrieves one or more messages from the specified queue, including the message body and message ID of each message.
 * Messages returned by this action stay in the queue until you delete them. However, once a message is returned to a
 * ReceiveMessage request, it is not returned on subsequent ReceiveMessage requests for the duration of the
 * VisibilityTimeout . If you do not specify a VisibilityTimeout in the request, the overall visibility timeout for the
 * queue is used for the returned messages.
 * </p>
 * <p>
 * If a message is available in the queue, the call will return immediately. Otherwise, it will wait up to WaitTimeSeconds
 * for a message to arrive. If you do not specify WaitTimeSeconds in the request, the queue attribute
 * ReceiveMessageWaitTimeSeconds is used to determine how long to wait.
 * </p>
 * <p>
 * You could ask for additional information about each message through the attributes. Attributes that can be requested are
 * [SenderId, ApproximateFirstReceiveTimestamp, ApproximateReceiveCount, SentTimestamp] .
 * </p>
 *
 * @param receiveMessageRequest Container for the necessary parameters to execute the ReceiveMessage service method on
 *           AmazonSQS.
 *
 * @return The response from the ReceiveMessage service method, as returned by AmazonSQS.
 *
 * @exception SQSOverLimitException For more information see <SQSOverLimitException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSReceiveMessageRequest
 * @see SQSReceiveMessageResponse
 */
-(SQSReceiveMessageResponse *)receiveMessage:(SQSReceiveMessageRequest *)receiveMessageRequest;


/**
 * <p>
 * Returns a list of your queues.
 * </p>
 *
 * @param listQueuesRequest Container for the necessary parameters to execute the ListQueues service method on AmazonSQS.
 *
 * @return The response from the ListQueues service method, as returned by AmazonSQS.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSListQueuesRequest
 * @see SQSListQueuesResponse
 */
-(SQSListQueuesResponse *)listQueues:(SQSListQueuesRequest *)listQueuesRequest;


/**
 * <p>
 * This is a batch version of DeleteMessage. It takes multiple receipt handles and deletes each one of the messages. The
 * result of the delete operation on each message is reported individually in the response.
 * </p>
 *
 * @param deleteMessageBatchRequest Container for the necessary parameters to execute the DeleteMessageBatch service method
 *           on AmazonSQS.
 *
 * @return The response from the DeleteMessageBatch service method, as returned by AmazonSQS.
 *
 * @exception SQSBatchEntryIdsNotDistinctException For more information see <SQSBatchEntryIdsNotDistinctException>
 * @exception SQSTooManyEntriesInBatchRequestException For more information see <SQSTooManyEntriesInBatchRequestException>
 * @exception SQSInvalidBatchEntryIdException For more information see <SQSInvalidBatchEntryIdException>
 * @exception SQSEmptyBatchRequestException For more information see <SQSEmptyBatchRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSDeleteMessageBatchRequest
 * @see SQSDeleteMessageBatchResponse
 */
-(SQSDeleteMessageBatchResponse *)deleteMessageBatch:(SQSDeleteMessageBatchRequest *)deleteMessageBatchRequest;


/**
 * <p>
 * The CreateQueue action creates a new queue, or returns the URL of an existing one. When you request CreateQueue , you
 * provide a name for the queue. To successfully create a new queue, you must provide a name that is unique within the
 * scope of your own queues.
 * </p>
 * <p>
 * You may pass one or more attributes in the request. If you do not provide a value for any attribute, the queue will have
 * the default value for that attribute. Permitted attributes are the same that can be set using SetQueueAttributes.
 * </p>
 * <p>
 * If you provide the name of an existing queue, a new queue isn't created. If the values of attributes provided with the
 * request match up with those on the existing queue, the queue URL is returned. Otherwise, a QueueNameExists error is
 * returned.
 * </p>
 *
 * @param createQueueRequest Container for the necessary parameters to execute the CreateQueue service method on AmazonSQS.
 *
 * @return The response from the CreateQueue service method, as returned by AmazonSQS.
 *
 * @exception SQSQueueNameExistsException For more information see <SQSQueueNameExistsException>
 * @exception SQSQueueDeletedRecentlyException For more information see <SQSQueueDeletedRecentlyException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSCreateQueueRequest
 * @see SQSCreateQueueResponse
 */
-(SQSCreateQueueResponse *)createQueue:(SQSCreateQueueRequest *)createQueueRequest;


/**
 * <p>
 * The AddPermission action adds a permission to a queue for a specific <a
 * href="http://docs.amazonwebservices.com/AWSSimpleQueueService/latest/APIReference/Glossary.html#d0e3892"> principal </a>
 * . This allows for sharing access to the queue.
 * </p>
 * <p>
 * When you create a queue, you have full control access rights for the queue. Only you (as owner of the queue) can grant
 * or deny permissions to the queue. For more information about these permissions, see <a
 * href="http://docs.amazonwebservices.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/?acp-overview.html"> Shared
 * Queues </a> in the Amazon SQS Developer Guide.
 * </p>
 * <p>
 * AddPermission writes an SQS-generated policy. If you want to write your own policy, use SetQueueAttributes to upload
 * your policy. For more information about writing your own policy, see <a
 * href="http://docs.amazonwebservices.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/?AccessPolicyLanguage.html">
 * Appendix: The Access Policy Language </a> in the Amazon SQS Developer Guide.
 * </p>
 *
 * @param addPermissionRequest Container for the necessary parameters to execute the AddPermission service method on
 *           AmazonSQS.
 *
 * @exception SQSOverLimitException For more information see <SQSOverLimitException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSAddPermissionRequest
 * @see SQSAddPermissionResponse
 */
-(SQSAddPermissionResponse *)addPermission:(SQSAddPermissionRequest *)addPermissionRequest;


/**
 * <p>
 * The DeleteMessage action unconditionally removes the specified message from the specified queue. Even if the message is
 * locked by another reader due to the visibility timeout setting, it is still deleted from the queue.
 * </p>
 *
 * @param deleteMessageRequest Container for the necessary parameters to execute the DeleteMessage service method on
 *           AmazonSQS.
 *
 * @exception SQSReceiptHandleIsInvalidException For more information see <SQSReceiptHandleIsInvalidException>
 * @exception SQSInvalidIdFormatException For more information see <SQSInvalidIdFormatException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSQS indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SQSDeleteMessageRequest
 * @see SQSDeleteMessageResponse
 */
-(SQSDeleteMessageResponse *)deleteMessage:(SQSDeleteMessageRequest *)deleteMessageRequest;



@end

