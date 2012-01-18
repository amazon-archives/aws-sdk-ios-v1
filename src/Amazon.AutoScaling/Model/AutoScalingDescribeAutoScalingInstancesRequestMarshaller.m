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

#import "AutoScalingDescribeAutoScalingInstancesRequestMarshaller.h"

@implementation AutoScalingDescribeAutoScalingInstancesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDescribeAutoScalingInstancesRequest *)describeAutoScalingInstancesRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DescribeAutoScalingInstances"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[describeAutoScalingInstancesRequest delegate]];
    [request setCredentials:[describeAutoScalingInstancesRequest credentials]];
    [request setEndpoint:[describeAutoScalingInstancesRequest requestEndpoint]];
    [request setRequestTag:[describeAutoScalingInstancesRequest requestTag]];


    if (describeAutoScalingInstancesRequest != nil) {
        int instanceIdsListIndex = 1;
        for (NSString *instanceIdsListValue in describeAutoScalingInstancesRequest.instanceIds) {
            if (instanceIdsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", instanceIdsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"InstanceIds", instanceIdsListIndex]];
            }

            instanceIdsListIndex++;
        }
    }
    if (describeAutoScalingInstancesRequest != nil) {
        if (describeAutoScalingInstancesRequest.maxRecords != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAutoScalingInstancesRequest.maxRecords] forKey:[NSString stringWithFormat:@"%@", @"MaxRecords"]];
        }
    }
    if (describeAutoScalingInstancesRequest != nil) {
        if (describeAutoScalingInstancesRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAutoScalingInstancesRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

