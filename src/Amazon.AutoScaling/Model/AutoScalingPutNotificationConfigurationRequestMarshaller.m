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

#import "AutoScalingPutNotificationConfigurationRequestMarshaller.h"

@implementation AutoScalingPutNotificationConfigurationRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingPutNotificationConfigurationRequest *)putNotificationConfigurationRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"PutNotificationConfiguration"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[putNotificationConfigurationRequest delegate]];
    [request setCredentials:[putNotificationConfigurationRequest credentials]];
    [request setEndpoint:[putNotificationConfigurationRequest requestEndpoint]];
    [request setRequestTag:[putNotificationConfigurationRequest requestTag]];

    if (putNotificationConfigurationRequest != nil) {
        if (putNotificationConfigurationRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putNotificationConfigurationRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (putNotificationConfigurationRequest != nil) {
        if (putNotificationConfigurationRequest.topicARN != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putNotificationConfigurationRequest.topicARN] forKey:[NSString stringWithFormat:@"%@", @"TopicARN"]];
        }
    }

    if (putNotificationConfigurationRequest != nil) {
        int notificationTypesListIndex = 1;
        for (NSString *notificationTypesListValue in putNotificationConfigurationRequest.notificationTypes) {
            if (notificationTypesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", notificationTypesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"NotificationTypes", notificationTypesListIndex]];
            }

            notificationTypesListIndex++;
        }
    }


    return [request autorelease];
}

@end

