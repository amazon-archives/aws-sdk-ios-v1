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

#import "AmazonSQSClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonSQSClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = @"https://queue.amazonaws.com";
    }
    return self;
}

-(SQSListQueuesResponse *)listQueues:(SQSListQueuesRequest *)listQueuesRequest
{
    AmazonServiceRequest *request = [SQSListQueuesRequestMarshaller createRequest:listQueuesRequest];

    return (SQSListQueuesResponse *)[self invoke:request unmarshallerDelegate:[SQSListQueuesResponseUnmarshaller class]];
}

-(SQSSetQueueAttributesResponse *)setQueueAttributes:(SQSSetQueueAttributesRequest *)setQueueAttributesRequest
{
    AmazonServiceRequest *request = [SQSSetQueueAttributesRequestMarshaller createRequest:setQueueAttributesRequest];

    return (SQSSetQueueAttributesResponse *)[self invoke:request unmarshallerDelegate:[SQSSetQueueAttributesResponseUnmarshaller class]];
}

-(SQSChangeMessageVisibilityResponse *)changeMessageVisibility:(SQSChangeMessageVisibilityRequest *)changeMessageVisibilityRequest
{
    AmazonServiceRequest *request = [SQSChangeMessageVisibilityRequestMarshaller createRequest:changeMessageVisibilityRequest];

    return (SQSChangeMessageVisibilityResponse *)[self invoke:request unmarshallerDelegate:[SQSChangeMessageVisibilityResponseUnmarshaller class]];
}

-(SQSCreateQueueResponse *)createQueue:(SQSCreateQueueRequest *)createQueueRequest
{
    AmazonServiceRequest *request = [SQSCreateQueueRequestMarshaller createRequest:createQueueRequest];

    return (SQSCreateQueueResponse *)[self invoke:request unmarshallerDelegate:[SQSCreateQueueResponseUnmarshaller class]];
}

-(SQSRemovePermissionResponse *)removePermission:(SQSRemovePermissionRequest *)removePermissionRequest
{
    AmazonServiceRequest *request = [SQSRemovePermissionRequestMarshaller createRequest:removePermissionRequest];

    return (SQSRemovePermissionResponse *)[self invoke:request unmarshallerDelegate:[SQSRemovePermissionResponseUnmarshaller class]];
}

-(SQSGetQueueAttributesResponse *)getQueueAttributes:(SQSGetQueueAttributesRequest *)getQueueAttributesRequest
{
    AmazonServiceRequest *request = [SQSGetQueueAttributesRequestMarshaller createRequest:getQueueAttributesRequest];

    return (SQSGetQueueAttributesResponse *)[self invoke:request unmarshallerDelegate:[SQSGetQueueAttributesResponseUnmarshaller class]];
}

-(SQSAddPermissionResponse *)addPermission:(SQSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [SQSAddPermissionRequestMarshaller createRequest:addPermissionRequest];

    return (SQSAddPermissionResponse *)[self invoke:request unmarshallerDelegate:[SQSAddPermissionResponseUnmarshaller class]];
}

-(SQSDeleteQueueResponse *)deleteQueue:(SQSDeleteQueueRequest *)deleteQueueRequest
{
    AmazonServiceRequest *request = [SQSDeleteQueueRequestMarshaller createRequest:deleteQueueRequest];

    return (SQSDeleteQueueResponse *)[self invoke:request unmarshallerDelegate:[SQSDeleteQueueResponseUnmarshaller class]];
}

-(SQSDeleteMessageResponse *)deleteMessage:(SQSDeleteMessageRequest *)deleteMessageRequest
{
    AmazonServiceRequest *request = [SQSDeleteMessageRequestMarshaller createRequest:deleteMessageRequest];

    return (SQSDeleteMessageResponse *)[self invoke:request unmarshallerDelegate:[SQSDeleteMessageResponseUnmarshaller class]];
}

-(SQSSendMessageResponse *)sendMessage:(SQSSendMessageRequest *)sendMessageRequest
{
    AmazonServiceRequest *request = [SQSSendMessageRequestMarshaller createRequest:sendMessageRequest];

    return (SQSSendMessageResponse *)[self invoke:request unmarshallerDelegate:[SQSSendMessageResponseUnmarshaller class]];
}

-(SQSReceiveMessageResponse *)receiveMessage:(SQSReceiveMessageRequest *)receiveMessageRequest
{
    AmazonServiceRequest *request = [SQSReceiveMessageRequestMarshaller createRequest:receiveMessageRequest];

    return (SQSReceiveMessageResponse *)[self invoke:request unmarshallerDelegate:[SQSReceiveMessageResponseUnmarshaller class]];
}



@end

