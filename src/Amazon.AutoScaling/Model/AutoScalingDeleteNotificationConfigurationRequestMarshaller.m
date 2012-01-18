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

#import "AutoScalingDeleteNotificationConfigurationRequestMarshaller.h"

@implementation AutoScalingDeleteNotificationConfigurationRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDeleteNotificationConfigurationRequest *)deleteNotificationConfigurationRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DeleteNotificationConfiguration"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[deleteNotificationConfigurationRequest delegate]];
    [request setCredentials:[deleteNotificationConfigurationRequest credentials]];
    [request setEndpoint:[deleteNotificationConfigurationRequest requestEndpoint]];
    [request setRequestTag:[deleteNotificationConfigurationRequest requestTag]];

    if (deleteNotificationConfigurationRequest != nil) {
        if (deleteNotificationConfigurationRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteNotificationConfigurationRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (deleteNotificationConfigurationRequest != nil) {
        if (deleteNotificationConfigurationRequest.topicARN != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteNotificationConfigurationRequest.topicARN] forKey:[NSString stringWithFormat:@"%@", @"TopicARN"]];
        }
    }


    return [request autorelease];
}

@end

