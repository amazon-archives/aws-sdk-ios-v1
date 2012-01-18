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

#import "CloudWatchEnableAlarmActionsRequestMarshaller.h"

@implementation CloudWatchEnableAlarmActionsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchEnableAlarmActionsRequest *)enableAlarmActionsRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"EnableAlarmActions"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[enableAlarmActionsRequest delegate]];
    [request setCredentials:[enableAlarmActionsRequest credentials]];
    [request setEndpoint:[enableAlarmActionsRequest requestEndpoint]];
    [request setRequestTag:[enableAlarmActionsRequest requestTag]];


    if (enableAlarmActionsRequest != nil) {
        int alarmNamesListIndex = 1;
        for (NSString *alarmNamesListValue in enableAlarmActionsRequest.alarmNames) {
            if (alarmNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", alarmNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AlarmNames", alarmNamesListIndex]];
            }

            alarmNamesListIndex++;
        }
    }


    return [request autorelease];
}

@end

