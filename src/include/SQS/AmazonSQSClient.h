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
#import "SQSListQueuesResponse.h"
#import "SQSListQueuesResponseUnmarshaller.h"
#import "SQSListQueuesRequest.h"
#import "SQSListQueuesRequestMarshaller.h"
#import "SQSSetQueueAttributesResponse.h"
#import "SQSSetQueueAttributesResponseUnmarshaller.h"
#import "SQSSetQueueAttributesRequest.h"
#import "SQSSetQueueAttributesRequestMarshaller.h"
#import "SQSChangeMessageVisibilityResponse.h"
#import "SQSChangeMessageVisibilityResponseUnmarshaller.h"
#import "SQSChangeMessageVisibilityRequest.h"
#import "SQSChangeMessageVisibilityRequestMarshaller.h"
#import "SQSCreateQueueResponse.h"
#import "SQSCreateQueueResponseUnmarshaller.h"
#import "SQSCreateQueueRequest.h"
#import "SQSCreateQueueRequestMarshaller.h"
#import "SQSRemovePermissionResponse.h"
#import "SQSRemovePermissionResponseUnmarshaller.h"
#import "SQSRemovePermissionRequest.h"
#import "SQSRemovePermissionRequestMarshaller.h"
#import "SQSGetQueueAttributesResponse.h"
#import "SQSGetQueueAttributesResponseUnmarshaller.h"
#import "SQSGetQueueAttributesRequest.h"
#import "SQSGetQueueAttributesRequestMarshaller.h"
#import "SQSAddPermissionResponse.h"
#import "SQSAddPermissionResponseUnmarshaller.h"
#import "SQSAddPermissionRequest.h"
#import "SQSAddPermissionRequestMarshaller.h"
#import "SQSDeleteQueueResponse.h"
#import "SQSDeleteQueueResponseUnmarshaller.h"
#import "SQSDeleteQueueRequest.h"
#import "SQSDeleteQueueRequestMarshaller.h"
#import "SQSDeleteMessageResponse.h"
#import "SQSDeleteMessageResponseUnmarshaller.h"
#import "SQSDeleteMessageRequest.h"
#import "SQSDeleteMessageRequestMarshaller.h"
#import "SQSSendMessageResponse.h"
#import "SQSSendMessageResponseUnmarshaller.h"
#import "SQSSendMessageRequest.h"
#import "SQSSendMessageRequestMarshaller.h"
#import "SQSReceiveMessageResponse.h"
#import "SQSReceiveMessageResponseUnmarshaller.h"
#import "SQSReceiveMessageRequest.h"
#import "SQSReceiveMessageRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"


/** <summary>
 * Interface for accessing AmazonSQS.
 *  
 *  <p>
 * Amazon Simple Queue Service (Amazon SQS) offers a reliable, highly
 * scalable, hosted queue for storing messages as they travel between
 * computers. By using Amazon SQS, developers can simply move data
 * between distributed components of their applications that perform
 * different tasks, without losing messages or requiring each component
 * to be always available. Amazon SQS makes it easy to build an automated
 * workflow, working in close conjunction with the Amazon Elastic Compute
 * Cloud (Amazon EC2) and the other AWS infrastructure web services.
 * </p>
 * <p>
 * Amazon SQS works by exposing Amazon's web-scale messaging
 * infrastructure as a web service. Any computer on the Internet can add
 * or read messages without any installed software or special firewall
 * configurations. Components of applications using Amazon SQS can run
 * independently, and do not need to be on the same network, developed
 * with the same technologies, or running at the same time.
 * </p>
 * <p>
 * Visit <a href="http://aws.amazon.com/sqs/">
 * http://aws.amazon.com/sqs/ </a> for more information.
 * </p>
 * </summary>
 */
@interface AmazonSQSClient : AmazonWebServiceClient
{
}


/**
 * <p>
 * The <code>ListQueues</code> action returns a list of your queues.
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
-(SQSListQueuesResponse*)listQueues:(SQSListQueuesRequest*)listQueuesRequest; 


/**
 * <p>
 * Sets an attribute of a queue. Currently, you can set only the
 * <code>VisibilityTimeout</code> attribute for a queue.
 * </p>
 *
 * @param setQueueAttributesRequest Container for the necessary
 *           parameters to execute the SetQueueAttributes service method on
 *           AmazonSQS.
 * 
 * @throws InvalidAttributeNameException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSSetQueueAttributesResponse*)setQueueAttributes:(SQSSetQueueAttributesRequest*)setQueueAttributesRequest; 


/**
 * <p>
 * The <code>ChangeMessageVisibility</code> action changes the
 * visibility timeout of a specified message in a queue to a new value.
 * The maximum allowed timeout value you can set the value to is 12
 * hours. This means you can't extend the timeout of a message in an
 * existing queue to more than a total visibility timeout of 12 hours.
 * (For more information visibility timeout, see Visibility Timeout in
 * the Amazon SQS Developer Guide.)
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
 * <b>IMPORTANT:</b> If you attempt to set the VisibilityTimeout to an
 * amount more than the maximum time left, Amazon SQS returns an error.
 * It will not automatically recalculate and increase the timeout to the
 * maximum time remaining.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> Unlike with a queue, when you change the visibility
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
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSChangeMessageVisibilityResponse*)changeMessageVisibility:(SQSChangeMessageVisibilityRequest*)changeMessageVisibilityRequest; 


/**
 * <p>
 * The <code>CreateQueue</code> action creates a new queue, or returns
 * the URL of an existing one. When you request <code>CreateQueue</code>
 * , you provide a name for the queue. To successfully create a new
 * queue, you must provide a name that is unique within the scope of your
 * own queues. If you provide the name of an existing queue, a new queue
 * isn't created and an error isn't returned. Instead, the request
 * succeeds and the queue URL for the existing queue is returned.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> If you provide a value for DefaultVisibilityTimeout
 * that is different from the value for the existing queue, you receive
 * an error.
 * </p>
 *
 * @param createQueueRequest Container for the necessary parameters to
 *           execute the CreateQueue service method on AmazonSQS.
 * 
 * @return The response from the CreateQueue service method, as returned
 *         by AmazonSQS.
 * 
 * @throws QueueNameExistsException
 * @throws QueueDeletedRecentlyException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSCreateQueueResponse*)createQueue:(SQSCreateQueueRequest*)createQueueRequest; 


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
-(SQSRemovePermissionResponse*)removePermission:(SQSRemovePermissionRequest*)removePermissionRequest; 


/**
 * <p>
 * Gets one or all attributes of a queue. Queues currently have two
 * attributes you can get: <code>ApproximateNumberOfMessages</code> and
 * <code>VisibilityTimeout</code> .
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
 * @throws InvalidAttributeNameException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSGetQueueAttributesResponse*)getQueueAttributes:(SQSGetQueueAttributesRequest*)getQueueAttributesRequest; 


/**
 * <p>
 * The <code>AddPermission</code> action adds a permission to a queue
 * for a specific principal. This allows for sharing access to the queue.
 * </p>
 * <p>
 * When you create a queue, you have full control access rights for the
 * queue. Only you (as owner of the queue) can grant or deny permissions
 * to the queue. For more information about these permissions, see Shared
 * Queues in the Amazon SQS Developer Guide.
 * </p>
 *
 * @param addPermissionRequest Container for the necessary parameters to
 *           execute the AddPermission service method on AmazonSQS.
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
-(SQSAddPermissionResponse*)addPermission:(SQSAddPermissionRequest*)addPermissionRequest; 


/**
 * <p>
 * This action unconditionally deletes the queue specified by the queue
 * URL. Use this operation WITH CARE! The queue is deleted even if it is
 * NOT empty.
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
-(SQSDeleteQueueResponse*)deleteQueue:(SQSDeleteQueueRequest*)deleteQueueRequest; 


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
 * @throws ReceiptHandleIsInvalidException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSDeleteMessageResponse*)deleteMessage:(SQSDeleteMessageRequest*)deleteMessageRequest; 


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
 * @throws InvalidMessageContentsException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonSQS indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(SQSSendMessageResponse*)sendMessage:(SQSSendMessageRequest*)sendMessageRequest; 


/**
 * <p>
 * Retrieves one or more messages from the specified queue, including
 * the message body and message ID of each message. Messages returned by
 * this action stay in the queue until you delete them. However, once a
 * message is returned to a <code>ReceiveMessage</code> request, it is
 * not returned on subsequent <code>ReceiveMessage</code> requests for
 * the duration of the <code>VisibilityTimeout</code> . If you do not
 * specify a <code>VisibilityTimeout</code> in the request, the overall
 * visibility timeout for the queue is used for the returned messages.
 * </p>
 *
 * @param receiveMessageRequest Container for the necessary parameters to
 *           execute the ReceiveMessage service method on AmazonSQS.
 * 
 * @return The response from the ReceiveMessage service method, as
 *         returned by AmazonSQS.
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
-(SQSReceiveMessageResponse*)receiveMessage:(SQSReceiveMessageRequest*)receiveMessageRequest; 



/** Ensure that all respsonse objects have been loaded by the runtime. */
+(void)initializeResponseObjects;

@end
	
		