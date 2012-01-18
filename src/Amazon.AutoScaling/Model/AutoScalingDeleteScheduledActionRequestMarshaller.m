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

#import "AutoScalingDeleteScheduledActionRequestMarshaller.h"

@implementation AutoScalingDeleteScheduledActionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDeleteScheduledActionRequest *)deleteScheduledActionRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DeleteScheduledAction"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[deleteScheduledActionRequest delegate]];
    [request setCredentials:[deleteScheduledActionRequest credentials]];
    [request setEndpoint:[deleteScheduledActionRequest requestEndpoint]];
    [request setRequestTag:[deleteScheduledActionRequest requestTag]];

    if (deleteScheduledActionRequest != nil) {
        if (deleteScheduledActionRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteScheduledActionRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (deleteScheduledActionRequest != nil) {
        if (deleteScheduledActionRequest.scheduledActionName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", deleteScheduledActionRequest.scheduledActionName] forKey:[NSString stringWithFormat:@"%@", @"ScheduledActionName"]];
        }
    }


    return [request autorelease];
}

@end

