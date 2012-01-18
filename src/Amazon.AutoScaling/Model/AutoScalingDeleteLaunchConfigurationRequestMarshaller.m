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

#import "AutoScalingDeleteLaunchConfigurationRequestMarshaller.h"

@implementation AutoScalingDeleteLaunchConfigurationRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDeleteLaunchConfigurationRequest *)deleteLaunchConfigurationRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DeleteLaunchConfiguration"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[deleteLaunchConfigurationRequest delegate]];
    [request setCredentials:[deleteLaunchConfigurationRequest credentials]];
    [request setEndpoint:[deleteLaunchConfigurationRequest requestEndpoint]];
    [request setRequestTag:[deleteLaunchConfigurationRequest requestTag]];

    if (deleteLaunchConfigurationRequest != nil) {
        if (deleteLaunchConfigurationRequest.launchConfigurationName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteLaunchConfigurationRequest.launchConfigurationName] forKey:[NSString stringWithFormat:@"%@", @"LaunchConfigurationName"]];
        }
    }


    return [request autorelease];
}

@end

