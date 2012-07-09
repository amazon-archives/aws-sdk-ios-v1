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

#import "SESSetIdentityNotificationTopicRequestMarshaller.h"

@implementation SESSetIdentityNotificationTopicRequestMarshaller

+(AmazonServiceRequest *)createRequest:(SESSetIdentityNotificationTopicRequest *)setIdentityNotificationTopicRequest
{
    AmazonServiceRequest *request = [[SESRequest alloc] init];

    [request setParameterValue:@"SetIdentityNotificationTopic"           forKey:@"Action"];
    [request setParameterValue:@"2010-12-01"   forKey:@"Version"];

    [request setDelegate:[setIdentityNotificationTopicRequest delegate]];
    [request setCredentials:[setIdentityNotificationTopicRequest credentials]];
    [request setEndpoint:[setIdentityNotificationTopicRequest requestEndpoint]];
    [request setRequestTag:[setIdentityNotificationTopicRequest requestTag]];

    if (setIdentityNotificationTopicRequest != nil) {
        if (setIdentityNotificationTopicRequest.identity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setIdentityNotificationTopicRequest.identity] forKey:[NSString stringWithFormat:@"%@", @"Identity"]];
        }
    }
    if (setIdentityNotificationTopicRequest != nil) {
        if (setIdentityNotificationTopicRequest.notificationType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setIdentityNotificationTopicRequest.notificationType] forKey:[NSString stringWithFormat:@"%@", @"NotificationType"]];
        }
    }
    if (setIdentityNotificationTopicRequest != nil) {
        if (setIdentityNotificationTopicRequest.snsTopic != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setIdentityNotificationTopicRequest.snsTopic] forKey:[NSString stringWithFormat:@"%@", @"SnsTopic"]];
        }
    }


    return [request autorelease];
}

@end

