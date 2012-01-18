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

#import "AutoScalingPutScheduledUpdateGroupActionRequestMarshaller.h"

@implementation AutoScalingPutScheduledUpdateGroupActionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingPutScheduledUpdateGroupActionRequest *)putScheduledUpdateGroupActionRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"PutScheduledUpdateGroupAction"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[putScheduledUpdateGroupActionRequest delegate]];
    [request setCredentials:[putScheduledUpdateGroupActionRequest credentials]];
    [request setEndpoint:[putScheduledUpdateGroupActionRequest requestEndpoint]];
    [request setRequestTag:[putScheduledUpdateGroupActionRequest requestTag]];

    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScheduledUpdateGroupActionRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.scheduledActionName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScheduledUpdateGroupActionRequest.scheduledActionName] forKey:[NSString stringWithFormat:@"%@", @"ScheduledActionName"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.time != nil) {
            [request setParameterValue:[putScheduledUpdateGroupActionRequest.time stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"Time"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.startTime != nil) {
            [request setParameterValue:[putScheduledUpdateGroupActionRequest.startTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"StartTime"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.endTime != nil) {
            [request setParameterValue:[putScheduledUpdateGroupActionRequest.endTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"EndTime"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.recurrence != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScheduledUpdateGroupActionRequest.recurrence] forKey:[NSString stringWithFormat:@"%@", @"Recurrence"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.minSize != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScheduledUpdateGroupActionRequest.minSize] forKey:[NSString stringWithFormat:@"%@", @"MinSize"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.maxSize != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScheduledUpdateGroupActionRequest.maxSize] forKey:[NSString stringWithFormat:@"%@", @"MaxSize"]];
        }
    }
    if (putScheduledUpdateGroupActionRequest != nil) {
        if (putScheduledUpdateGroupActionRequest.desiredCapacity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putScheduledUpdateGroupActionRequest.desiredCapacity] forKey:[NSString stringWithFormat:@"%@", @"DesiredCapacity"]];
        }
    }


    return [request autorelease];
}

@end

