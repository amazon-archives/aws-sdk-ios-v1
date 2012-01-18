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

#import "CloudWatchDescribeAlarmHistoryRequestMarshaller.h"

@implementation CloudWatchDescribeAlarmHistoryRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchDescribeAlarmHistoryRequest *)describeAlarmHistoryRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"DescribeAlarmHistory"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[describeAlarmHistoryRequest delegate]];
    [request setCredentials:[describeAlarmHistoryRequest credentials]];
    [request setEndpoint:[describeAlarmHistoryRequest requestEndpoint]];
    [request setRequestTag:[describeAlarmHistoryRequest requestTag]];

    if (describeAlarmHistoryRequest != nil) {
        if (describeAlarmHistoryRequest.alarmName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmHistoryRequest.alarmName] forKey:[NSString stringWithFormat:@"%@", @"AlarmName"]];
        }
    }
    if (describeAlarmHistoryRequest != nil) {
        if (describeAlarmHistoryRequest.historyItemType != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmHistoryRequest.historyItemType] forKey:[NSString stringWithFormat:@"%@", @"HistoryItemType"]];
        }
    }
    if (describeAlarmHistoryRequest != nil) {
        if (describeAlarmHistoryRequest.startDate != nil) {
            [request setParameterValue:[describeAlarmHistoryRequest.startDate stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"StartDate"]];
        }
    }
    if (describeAlarmHistoryRequest != nil) {
        if (describeAlarmHistoryRequest.endDate != nil) {
            [request setParameterValue:[describeAlarmHistoryRequest.endDate stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"EndDate"]];
        }
    }
    if (describeAlarmHistoryRequest != nil) {
        if (describeAlarmHistoryRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmHistoryRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }
    if (describeAlarmHistoryRequest != nil) {
        if (describeAlarmHistoryRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmHistoryRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

