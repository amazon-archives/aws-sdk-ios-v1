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

#import "EC2GetConsoleOutputRequestMarshaller.h"

@implementation EC2GetConsoleOutputRequestMarshaller

+(AmazonServiceRequest *)createRequest:(EC2GetConsoleOutputRequest *)getConsoleOutputRequest
{
    AmazonServiceRequest *request = [[EC2Request alloc] init];

    [request setParameterValue:@"GetConsoleOutput"           forKey:@"Action"];
    [request setParameterValue:@"2012-08-15"   forKey:@"Version"];

    [request setDelegate:[getConsoleOutputRequest delegate]];
    [request setCredentials:[getConsoleOutputRequest credentials]];
    [request setEndpoint:[getConsoleOutputRequest requestEndpoint]];
    [request setRequestTag:[getConsoleOutputRequest requestTag]];

    if (getConsoleOutputRequest != nil) {
        if (getConsoleOutputRequest.instanceId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getConsoleOutputRequest.instanceId] forKey:[NSString stringWithFormat:@"%@", @"InstanceId"]];
        }
    }


    return [request autorelease];
}

@end

