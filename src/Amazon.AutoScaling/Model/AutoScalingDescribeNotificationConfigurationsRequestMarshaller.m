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

#import "AutoScalingDescribeNotificationConfigurationsRequestMarshaller.h"

@implementation AutoScalingDescribeNotificationConfigurationsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeNotificationConfigurationsRequest *)describeNotificationConfigurationsRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeNotificationConfigurations"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeNotificationConfigurationsRequest delegate]];
    [request setCredentials:[describeNotificationConfigurationsRequest credentials]];
    [request setEndpoint:[describeNotificationConfigurationsRequest requestEndpoint]];
    [request setRequestTag:[describeNotificationConfigurationsRequest requestTag]];


    if (describeNotificationConfigurationsRequest != nil) {
        int autoScalingGroupNamesListIndex = 1;
        for (NSString *autoScalingGroupNamesListValue in describeNotificationConfigurationsRequest.autoScalingGroupNames) {
            if (autoScalingGroupNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", autoScalingGroupNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AutoScalingGroupNames", autoScalingGroupNamesListIndex]];
            }

            autoScalingGroupNamesListIndex++;
        }
    }
    if (describeNotificationConfigurationsRequest != nil) {
        if (describeNotificationConfigurationsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeNotificationConfigurationsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describeNotificationConfigurationsRequest != nil) {
        if (describeNotificationConfigurationsRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeNotificationConfigurationsRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }


    return [request autorelease];
}

@end

