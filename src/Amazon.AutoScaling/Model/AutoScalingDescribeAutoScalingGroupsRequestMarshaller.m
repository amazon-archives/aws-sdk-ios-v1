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

#import "AutoScalingDescribeAutoScalingGroupsRequestMarshaller.h"

@implementation AutoScalingDescribeAutoScalingGroupsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeAutoScalingGroupsRequest *)describeAutoScalingGroupsRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeAutoScalingGroups"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeAutoScalingGroupsRequest delegate]];
    [request setCredentials:[describeAutoScalingGroupsRequest credentials]];
    [request setEndpoint:[describeAutoScalingGroupsRequest requestEndpoint]];
    [request setRequestTag:[describeAutoScalingGroupsRequest requestTag]];


    if (describeAutoScalingGroupsRequest != nil) {
        int autoScalingGroupNamesListIndex = 1;
        for (NSString *autoScalingGroupNamesListValue in describeAutoScalingGroupsRequest.autoScalingGroupNames) {
            if (autoScalingGroupNamesListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", autoScalingGroupNamesListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AutoScalingGroupNames", autoScalingGroupNamesListIndex]];
            }

            autoScalingGroupNamesListIndex++;
        }
    }
    if (describeAutoScalingGroupsRequest != nil) {
        if (describeAutoScalingGroupsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAutoScalingGroupsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }
    if (describeAutoScalingGroupsRequest != nil) {
        if (describeAutoScalingGroupsRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAutoScalingGroupsRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }


    return [request autorelease];
}

@end

