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

#import "AutoScalingSuspendProcessesRequestMarshaller.h"

@implementation AutoScalingSuspendProcessesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingSuspendProcessesRequest *)suspendProcessesRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"SuspendProcesses"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[suspendProcessesRequest delegate]];
    [request setCredentials:[suspendProcessesRequest credentials]];
    [request setEndpoint:[suspendProcessesRequest requestEndpoint]];
    [request setRequestTag:[suspendProcessesRequest requestTag]];

    if (suspendProcessesRequest != nil) {
        if (suspendProcessesRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", suspendProcessesRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }

    if (suspendProcessesRequest != nil) {
        int scalingProcessesListIndex = 1;
        for (NSString *scalingProcessesListValue in suspendProcessesRequest.scalingProcesses) {
            if (scalingProcessesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", scalingProcessesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"ScalingProcesses", scalingProcessesListIndex]];
            }

            scalingProcessesListIndex++;
        }
    }


    return [request autorelease];
}

@end

