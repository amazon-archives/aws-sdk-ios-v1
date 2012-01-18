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

#import "CloudWatchDescribeAlarmsRequestMarshaller.h"

@implementation CloudWatchDescribeAlarmsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchDescribeAlarmsRequest *)describeAlarmsRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"DescribeAlarms"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[describeAlarmsRequest delegate]];
    [request setCredentials:[describeAlarmsRequest credentials]];
    [request setEndpoint:[describeAlarmsRequest requestEndpoint]];
    [request setRequestTag:[describeAlarmsRequest requestTag]];


    if (describeAlarmsRequest != nil) {
        int alarmNamesListIndex = 1;
        for (NSString *alarmNamesListValue in describeAlarmsRequest.alarmNames) {
            if (alarmNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", alarmNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AlarmNames", alarmNamesListIndex]];
            }

            alarmNamesListIndex++;
        }
    }
    if (describeAlarmsRequest != nil) {
        if (describeAlarmsRequest.alarmNamePrefix != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsRequest.alarmNamePrefix] forKey:[NSString stringWithFormat:@"%@", @"AlarmNamePrefix"]];
        }
    }
    if (describeAlarmsRequest != nil) {
        if (describeAlarmsRequest.stateValue != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsRequest.stateValue] forKey:[NSString stringWithFormat:@"%@", @"StateValue"]];
        }
    }
    if (describeAlarmsRequest != nil) {
        if (describeAlarmsRequest.actionPrefix != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsRequest.actionPrefix] forKey:[NSString stringWithFormat:@"%@", @"ActionPrefix"]];
        }
    }
    if (describeAlarmsRequest != nil) {
        if (describeAlarmsRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }
    if (describeAlarmsRequest != nil) {
        if (describeAlarmsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

