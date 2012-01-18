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

#import "CloudWatchSetAlarmStateRequestMarshaller.h"

@implementation CloudWatchSetAlarmStateRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchSetAlarmStateRequest *)setAlarmStateRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"SetAlarmState"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[setAlarmStateRequest delegate]];
    [request setCredentials:[setAlarmStateRequest credentials]];
    [request setEndpoint:[setAlarmStateRequest requestEndpoint]];
    [request setRequestTag:[setAlarmStateRequest requestTag]];

    if (setAlarmStateRequest != nil) {
        if (setAlarmStateRequest.alarmName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setAlarmStateRequest.alarmName] forKey:[NSString stringWithFormat:@"%@", @"AlarmName"]];
        }
    }
    if (setAlarmStateRequest != nil) {
        if (setAlarmStateRequest.stateValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setAlarmStateRequest.stateValue] forKey:[NSString stringWithFormat:@"%@", @"StateValue"]];
        }
    }
    if (setAlarmStateRequest != nil) {
        if (setAlarmStateRequest.stateReason != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setAlarmStateRequest.stateReason] forKey:[NSString stringWithFormat:@"%@", @"StateReason"]];
        }
    }
    if (setAlarmStateRequest != nil) {
        if (setAlarmStateRequest.stateReasonData != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setAlarmStateRequest.stateReasonData] forKey:[NSString stringWithFormat:@"%@", @"StateReasonData"]];
        }
    }


    return [request autorelease];
}

@end

