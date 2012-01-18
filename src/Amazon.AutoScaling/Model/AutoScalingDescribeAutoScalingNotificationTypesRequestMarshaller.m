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

#import "AutoScalingDescribeAutoScalingNotificationTypesRequestMarshaller.h"

@implementation AutoScalingDescribeAutoScalingNotificationTypesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeAutoScalingNotificationTypesRequest *)describeAutoScalingNotificationTypesRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeAutoScalingNotificationTypes"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeAutoScalingNotificationTypesRequest delegate]];
    [request setCredentials:[describeAutoScalingNotificationTypesRequest credentials]];
    [request setEndpoint:[describeAutoScalingNotificationTypesRequest requestEndpoint]];
    [request setRequestTag:[describeAutoScalingNotificationTypesRequest requestTag]];



    return [request autorelease];
}

@end

