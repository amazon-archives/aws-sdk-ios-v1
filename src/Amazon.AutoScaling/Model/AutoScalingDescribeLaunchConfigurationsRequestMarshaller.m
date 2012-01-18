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

#import "AutoScalingDescribeLaunchConfigurationsRequestMarshaller.h"

@implementation AutoScalingDescribeLaunchConfigurationsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeLaunchConfigurationsRequest *)describeLaunchConfigurationsRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeLaunchConfigurations"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeLaunchConfigurationsRequest delegate]];
    [request setCredentials:[describeLaunchConfigurationsRequest credentials]];
    [request setEndpoint:[describeLaunchConfigurationsRequest requestEndpoint]];
    [request setRequestTag:[describeLaunchConfigurationsRequest requestTag]];


    if (describeLaunchConfigurationsRequest != nil) {
        int launchConfigurationNamesListIndex = 1;
        for (NSString *launchConfigurationNamesListValue in describeLaunchConfigurationsRequest.launchConfigurationNames) {
            if (launchConfigurationNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", launchConfigurationNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"LaunchConfigurationNames", launchConfigurationNamesListIndex]];
            }

            launchConfigurationNamesListIndex++;
        }
    }
    if (describeLaunchConfigurationsRequest != nil) {
        if (describeLaunchConfigurationsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeLaunchConfigurationsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describeLaunchConfigurationsRequest != nil) {
        if (describeLaunchConfigurationsRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeLaunchConfigurationsRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }


    return [request autorelease];
}

@end

