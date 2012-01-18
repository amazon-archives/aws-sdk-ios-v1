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
 * \ingroup SQS
 */
@interface AmazonSQSClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Sets an attribute of a queue. The set of attributes that can be set
 * are - DelaySeconds, MessageRetentionPeriod, MaximumMessageSize,
 * VisibilityTimeout and Policy.
 * </p>
 *
 * @param setQueueAttributesRequest Container for the necessary
 *           parameters to execute the SetQueueAttributes service method on
 *           AmazonSQS.
 *
 * @throws SQSInvalidAttributeNameException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSSetQueueAttributesResponse *)setQueueAttributes:(SQSSetQueueAttributesRequest *)setQueueAttributesRequest;


/**
 * <p>
 * This is a batch version of ChangeMessageVisibility. It takes multiple
 * receipt handles and performs the operation on each of the them. The
 * result of the operation on each message is reported individually in
 * the response.
 * </p>
 *
 * @param changeMessageVisibilityBatchRequest Container for the necessary
 *           parameters to execute the ChangeMessageVisibilityBatch service method
 *           on AmazonSQS.
 *
 * @return The response from the ChangeMessageVisibilityBatch service
 *         method, as returned by AmazonSQS.
 *
 * @throws SQSBatchEntryIdsNotDistinctException
 * @throws SQSTooManyEntriesInBatchRequestException
 * @throws SQSInvalidBatchEntryIdException
 * @throws SQSEmptyBatchRequestException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSChangeMessageVisibilityBatchResponse *)changeMessageVisibilityBatch:(SQSChangeMessageVisibilityBatchRequest *)changeMessageVisibilityBatchRequest;


/**
 * <p>
 * The <code>ChangeMessageVisibility</code> action changes the visibility
 * timeout of a specified message in a queue to a new value. The maximum
 * allowed timeout value you can set the value to is 12 hours. This means
 * you can't extend the timeout of a message in an existing queue to more
 * than a total visibility timeout of 12 hours. (For more information
 * visibility timeout, see <a
 * ices.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/AboutVT.html">
 * Visibility Timeout </a> in the Amazon SQS Developer Guide.)
 * </p>
 * <p>
 * For example, let's say you have a message and its default message
 * visibility timeout is 30 minutes. You could call
 * <code>ChangeMessageVisiblity</code> with a value of two hours and the
 * effective timeout would be two hours and 30 minutes. When that time
 * comes near you could again extend the time out by calling
 * ChangeMessageVisiblity, but this time the maximum allowed timeout
 * would be 9 hours and 30 minutes.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>If you attempt to set the VisibilityTimeout to an
 * amount more than the maximum time left, Amazon SQS returns an error.
 * It will not automatically recalculate and increase the timeout to the
 * maximum time remaining.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>Unlike with a queue, when you change the visibility
 * timeout for a specific message, that timeout value is applied
 * immediately but is not saved in memory for that message. If you don't
 * delete a message after it is received, the visibility timeout for the
 * message the next time it is received reverts to the original timeout
 * value, not the value you set with the ChangeMessageVisibility action.
 * </p>
 *
 * @param changeMessageVisibilityRequest Container for the necessary
 *           parameters to execute the ChangeMessageVisibility service method on
 *           AmazonSQS.
 *
 * @throws SQSReceiptHandleIsInvalidException
 * @throws SQSMessageNotInflightException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSChangeMessageVisibilityResponse *)changeMessageVisibility:(SQSChangeMessageVisibilityRequest *)changeMessageVisibilityRequest;


/**
 * <p>
 * The <code>GetQueueUrl</code> action returns the URL of an existing
 * queue.
 * </p>
 *
 * @param getQueueUrlRequest Container for the necessary parameters to
 *           execute the GetQueueUrl service method on AmazonSQS.
 *
 * @return The response from the GetQueueUrl service method, as returned
 *         by AmazonSQS.
 *
 * @throws SQSQueueDoesNotExistException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSGetQueueUrlResponse *)getQueueUrl:(SQSGetQueueUrlRequest *)getQueueUrlRequest;


/**
 * <p>
 * The <code>RemovePermission</code> action revokes any permissions in
 * the queue policy that matches the specified <code>Label</code>
 * parameter. Only the owner of the queue can remove permissions.
 * </p>
 *
 * @param removePermissionRequest Container for the necessary parameters
 *           to execute the RemovePermission service method on AmazonSQS.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSRemovePermissionResponse *)removePermission:(SQSRemovePermissionRequest *)removePermissionRequest;


/**
 * <p>
 * Gets attributes for the specified queue. The following attributes are
 * supported:
 * <ul>
 * <li> <code>All</code> - returns all values.</li>
 * <li> <code>ApproximateNumberOfMessages</code> - returns the
 * approximate number of visible messages in a queue. For more
 * information, see Resources Required to Process Messages in the Amazon
 * SQS Developer Guide.</li>
 * <li> <code>ApproximateNumberOfMessagesNotVisible</code> - returns the
 * approximate number of messages that are not timed-out and not deleted.
 * For more information, see Resources Required to Process Messages in
 * the Amazon SQS Developer Guide.</li>
 * <li> <code>VisibilityTimeout</code> - returns the visibility timeout
 * for the queue. For more information about visibility timeout, see
 * Visibility Timeout in the Amazon SQS Developer Guide.</li>
 * <li> <code>CreatedTimestamp</code> - returns the time when the queue
 * was created (epoch time in seconds).</li>
 * <li> <code>LastModifiedTimestamp</code> - returns the time when the
 * queue was last changed (epoch time in seconds).</li>
 * <li> <code>Policy</code> - returns the queue's policy.</li>
 * <li> <code>MaximumMessageSize</code> - returns the limit of how many
 * bytes a message can contain before Amazon SQS rejects it.</li>
 * <li> <code>MessageRetentionPeriod</code> - returns the number of
 * seconds Amazon SQS retains a message.</li>
 * <li> <code>QueueArn</code> - returns the queue's Amazon resource name
 * (ARN).</li>
 * <li> <code>ApproximateNumberOfMessagesDelayed</code> - returns the
 * approximate number of messages that are pending to be added to the
 * queue.</li>
 * <li> <code>DelaySeconds</code> - returns the default delay on the
 * queue in seconds.</li>
 *
 * </ul>
 *
 * </p>
 *
 * @param getQueueAttributesRequest Container for the necessary
 *           parameters to execute the GetQueueAttributes service method on
 *           AmazonSQS.
 *
 * @return The response from the GetQueueAttributes service method, as
 *         returned by AmazonSQS.
 *
 * @throws SQSInvalidAttributeNameException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSGetQueueAttributesResponse *)getQueueAttributes:(SQSGetQueueAttributesRequest *)getQueueAttributesRequest;


/**
 * <p>
 * This is a batch version of SendMessage. It takes multiple messages and
 * adds each of them to the queue. The result of each add operation is
 * reported individually in the response.
 * </p>
 *
 * @param sendMessageBatchRequest Container for the necessary parameters
 *           to execute the SendMessageBatch service method on AmazonSQS.
 *
 * @return The response from the SendMessageBatch service method, as
 *         returned by AmazonSQS.
 *
 * @throws SQSBatchEntryIdsNotDistinctException
 * @throws SQSTooManyEntriesInBatchRequestException
 * @throws SQSBatchRequestTooLongException
 * @throws SQSInvalidBatchEntryIdException
 * @throws SQSEmptyBatchRequestException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSSendMessageBatchResponse *)sendMessageBatch:(SQSSendMessageBatchRequest *)sendMessageBatchRequest;


/**
 * <p>
 * This action unconditionally deletes the queue specified by the queue
 * URL. Use this operation WITH CARE! The queue is deleted even if it is
 * NOT empty.
 * </p>
 * <p>
 * Once a queue has been deleted, the queue name is unavailable for use
 * with new queues for 60 seconds.
 * </p>
 *
 * @param deleteQueueRequest Container for the necessary parameters to
 *           execute the DeleteQueue service method on AmazonSQS.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSDeleteQueueResponse *)deleteQueue:(SQSDeleteQueueRequest *)deleteQueueRequest;


/**
 * <p>
 * The <code>SendMessage</code> action delivers a message to the
 * specified queue.
 * </p>
 *
 * @param sendMessageRequest Container for the necessary parameters to
 *           execute the SendMessage service method on AmazonSQS.
 *
 * @return The response from the SendMessage service method, as returned
 *         by AmazonSQS.
 *
 * @throws SQSInvalidMessageContentsException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSSendMessageResponse *)sendMessage:(SQSSendMessageRequest *)sendMessageRequest;


/**
 * <p>
 * Retrieves one or more messages from the specified queue, including the
 * message body and message ID of each message. Messages returned by this
 * action stay in the queue until you delete them. However, once a
 * message is returned to a
 * <code>ReceiveMessage</code> request, it is not
 * returned on subsequent <code>ReceiveMessage</code> requests for the
 * duration of the <code>VisibilityTimeout</code> . If you do not specify
 * a <code>VisibilityTimeout</code> in the request, the overall
 * visibility timeout for the queue is used for the returned messages.
 * </p>
 *
 * @param receiveMessageRequest Container for the necessary parameters to
 *           execute the ReceiveMessage service method on AmazonSQS.
 *
 * @return The response from the ReceiveMessage service method, as
 *         returned by AmazonSQS.
 *
 * @throws SQSOverLimitException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSReceiveMessageResponse *)receiveMessage:(SQSReceiveMessageRequest *)receiveMessageRequest;


/**
 * <p>
 * Returns a list of your queues.
 * </p>
 *
 * @param listQueuesRequest Container for the necessary parameters to
 *           execute the ListQueues service method on AmazonSQS.
 *
 * @return The response from the ListQueues service method, as returned
 *         by AmazonSQS.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSListQueuesResponse *)listQueues:(SQSListQueuesRequest *)listQueuesRequest;


/**
 * <p>
 * This is a batch version of DeleteMessage. It takes multiple receipt
 * handles and deletes each one of the messages. The result of the delete
 * operation on each message is reported individually in the response.
 * </p>
 *
 * @param deleteMessageBatchRequest Container for the necessary
 *           parameters to execute the DeleteMessageBatch service method on
 *           AmazonSQS.
 *
 * @return The response from the DeleteMessageBatch service method, as
 *         returned by AmazonSQS.
 *
 * @throws SQSBatchEntryIdsNotDistinctException
 * @throws SQSTooManyEntriesInBatchRequestException
 * @throws SQSInvalidBatchEntryIdException
 * @throws SQSEmptyBatchRequestException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSDeleteMessageBatchResponse *)deleteMessageBatch:(SQSDeleteMessageBatchRequest *)deleteMessageBatchRequest;


/**
 * <p>
 * The <code>CreateQueue</code> action creates a new queue, or returns
 * the URL of an existing one. When you request <code>CreateQueue</code>
 * , you provide a name for the queue. To successfully create a new
 * queue, you must provide a name that is unique within the scope of your
 * own queues.
 * </p>
 * <p>
 * You may pass one or more attributes in the request. If you do not
 * provide a value for any attribute, the queue will have the default
 * value for that attribute. Permitted attributes are the same that can
 * be set using SetQueueAttributes.
 * </p>
 * <p>
 * If you provide the name of an existing queue, a new queue isn't
 * created. If the values of attributes provided with the request match
 * up with those on the existing queue, the queue URL is returned.
 * Otherwise, a <code>QueueNameExists</code> error is returned.
 * </p>
 *
 * @param createQueueRequest Container for the necessary parameters to
 *           execute the CreateQueue service method on AmazonSQS.
 *
 * @return The response from the CreateQueue service method, as returned
 *         by AmazonSQS.
 *
 * @throws SQSQueueNameExistsException
 * @throws SQSQueueDeletedRecentlyException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSCreateQueueResponse *)createQueue:(SQSCreateQueueRequest *)createQueueRequest;


/**
 * <p>
 * The AddPermission action adds a permission to a queue for a specific
 * <a
 * .com/AWSSimpleQueueService/latest/APIReference/Glossary.html#d0e3892">
 * principal </a> . This allows for sharing access to the queue.
 * </p>
 * <p>
 * When you create a queue, you have full control access rights for the
 * queue. Only you (as owner of the queue) can grant or deny permissions
 * to the queue. For more information about these permissions, see <a
 * om/AWSSimpleQueueService/latest/SQSDeveloperGuide/?acp-overview.html">
 * Shared Queues </a> in the Amazon SQS Developer Guide.
 * </p>
 * <p>
 * <code>AddPermission</code> writes an SQS-generated policy. If you
 * want to write your own policy, use SetQueueAttributes to upload your
 * policy. For more information about writing your own policy, see <a
 * mpleQueueService/latest/SQSDeveloperGuide/?AccessPolicyLanguage.html">
 * Appendix: The Access Policy Language </a> in the Amazon SQS Developer
 * Guide.
 * </p>
 *
 * @param addPermissionRequest Container for the necessary parameters to
 *           execute the AddPermission service method on AmazonSQS.
 *
 * @throws SQSOverLimitException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSAddPermissionResponse *)addPermission:(SQSAddPermissionRequest *)addPermissionRequest;


/**
 * <p>
 * The <code>DeleteMessage</code> action unconditionally removes the
 * specified message from the specified queue. Even if the message is
 * locked by another reader due to the visibility timeout setting, it is
 * still deleted from the queue.
 * </p>
 *
 * @param deleteMessageRequest Container for the necessary parameters to
 *           execute the DeleteMessage service method on AmazonSQS.
 *
 * @throws SQSReceiptHandleIsInvalidException
 * @throws SQSInvalidIdFormatException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSDeleteMessageResponse *)deleteMessage:(SQSDeleteMessageRequest *)deleteMessageRequest;



@end

