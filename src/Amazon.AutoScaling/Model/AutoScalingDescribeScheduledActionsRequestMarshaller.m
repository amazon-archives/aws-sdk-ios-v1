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

#import "AutoScalingDescribeScheduledActionsRequestMarshaller.h"

@implementation AutoScalingDescribeScheduledActionsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeScheduledActionsRequest *)describeScheduledActionsRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeScheduledActions"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeScheduledActionsRequest delegate]];
    [request setCredentials:[describeScheduledActionsRequest credentials]];
    [request setEndpoint:[describeScheduledActionsRequest requestEndpoint]];
    [request setRequestTag:[describeScheduledActionsRequest requestTag]];

    if (describeScheduledActionsRequest != nil) {
        if (describeScheduledActionsRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeScheduledActionsRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }

    if (describeScheduledActionsRequest != nil) {
        int scheduledActionNamesListIndex = 1;
        for (NSString *scheduledActionNamesListValue in describeScheduledActionsRequest.scheduledActionNames) {
            if (scheduledActionNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", scheduledActionNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"ScheduledActionNames", scheduledActionNamesListIndex]];
            }

            scheduledActionNamesListIndex++;
        }
    }
    if (describeScheduledActionsRequest != nil) {
        if (describeScheduledActionsRequest.startTime != nil) {
            [request setParameterValue:[describeScheduledActionsRequest.startTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"StartTime"]];
        }
    }
    if (describeScheduledActionsRequest != nil) {
        if (describeScheduledActionsRequest.endTime != nil) {
            [request setParameterValue:[describeScheduledActionsRequest.endTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"EndTime"]];
        }
    }
    if (describeScheduledActionsRequest != nil) {
        if (describeScheduledActionsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeScheduledActionsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describeScheduledActionsRequest != nil) {
        if (describeScheduledActionsRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeScheduledActionsRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }


    return [request autorelease];
}

@end

