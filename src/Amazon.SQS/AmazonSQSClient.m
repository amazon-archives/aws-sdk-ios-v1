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

    return (SQSListQueuesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSListQueuesResponseUnmarshaller class]];
}

-(SQSSetQueueAttributesResponse *)setQueueAttributes:(SQSSetQueueAttributesRequest *)setQueueAttributesRequest
{
    AmazonServiceRequest *request = [SQSSetQueueAttributesRequestMarshaller createRequest:setQueueAttributesRequest];

    return (SQSSetQueueAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSSetQueueAttributesResponseUnmarshaller class]];
}

-(SQSChangeMessageVisibilityResponse *)changeMessageVisibility:(SQSChangeMessageVisibilityRequest *)changeMessageVisibilityRequest
{
    AmazonServiceRequest *request = [SQSChangeMessageVisibilityRequestMarshaller createRequest:changeMessageVisibilityRequest];

    return (SQSChangeMessageVisibilityResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSChangeMessageVisibilityResponseUnmarshaller class]];
}

-(SQSCreateQueueResponse *)createQueue:(SQSCreateQueueRequest *)createQueueRequest
{
    AmazonServiceRequest *request = [SQSCreateQueueRequestMarshaller createRequest:createQueueRequest];

    return (SQSCreateQueueResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSCreateQueueResponseUnmarshaller class]];
}

-(SQSRemovePermissionResponse *)removePermission:(SQSRemovePermissionRequest *)removePermissionRequest
{
    AmazonServiceRequest *request = [SQSRemovePermissionRequestMarshaller createRequest:removePermissionRequest];

    return (SQSRemovePermissionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSRemovePermissionResponseUnmarshaller class]];
}

-(SQSGetQueueAttributesResponse *)getQueueAttributes:(SQSGetQueueAttributesRequest *)getQueueAttributesRequest
{
    AmazonServiceRequest *request = [SQSGetQueueAttributesRequestMarshaller createRequest:getQueueAttributesRequest];

    return (SQSGetQueueAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSGetQueueAttributesResponseUnmarshaller class]];
}

-(SQSAddPermissionResponse *)addPermission:(SQSAddPermissionRequest *)addPermissionRequest
{
    AmazonServiceRequest *request = [SQSAddPermissionRequestMarshaller createRequest:addPermissionRequest];

    return (SQSAddPermissionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSAddPermissionResponseUnmarshaller class]];
}

-(SQSDeleteQueueResponse *)deleteQueue:(SQSDeleteQueueRequest *)deleteQueueRequest
{
    AmazonServiceRequest *request = [SQSDeleteQueueRequestMarshaller createRequest:deleteQueueRequest];

    return (SQSDeleteQueueResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSDeleteQueueResponseUnmarshaller class]];
}

-(SQSDeleteMessageResponse *)deleteMessage:(SQSDeleteMessageRequest *)deleteMessageRequest
{
    AmazonServiceRequest *request = [SQSDeleteMessageRequestMarshaller createRequest:deleteMessageRequest];

    return (SQSDeleteMessageResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSDeleteMessageResponseUnmarshaller class]];
}

-(SQSSendMessageResponse *)sendMessage:(SQSSendMessageRequest *)sendMessageRequest
{
    AmazonServiceRequest *request = [SQSSendMessageRequestMarshaller createRequest:sendMessageRequest];

    return (SQSSendMessageResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSSendMessageResponseUnmarshaller class]];
}

-(SQSReceiveMessageResponse *)receiveMessage:(SQSReceiveMessageRequest *)receiveMessageRequest
{
    AmazonServiceRequest *request = [SQSReceiveMessageRequestMarshaller createRequest:receiveMessageRequest];

    return (SQSReceiveMessageResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SQSReceiveMessageResponseUnmarshaller class]];
}



@end

