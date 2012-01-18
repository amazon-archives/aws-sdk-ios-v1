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

#import "AutoScalingDisableMetricsCollectionRequestMarshaller.h"

@implementation AutoScalingDisableMetricsCollectionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingDisableMetricsCollectionRequest *)disableMetricsCollectionRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"DisableMetricsCollection"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[disableMetricsCollectionRequest delegate]];
    [request setCredentials:[disableMetricsCollectionRequest credentials]];
    [request setEndpoint:[disableMetricsCollectionRequest requestEndpoint]];
    [request setRequestTag:[disableMetricsCollectionRequest requestTag]];

    if (disableMetricsCollectionRequest != nil) {
        if (disableMetricsCollectionRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", disableMetricsCollectionRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }

    if (disableMetricsCollectionRequest != nil) {
        int metricsListIndex = 1;
        for (NSString *metricsListValue in disableMetricsCollectionRequest.metrics) {
            if (metricsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", metricsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Metrics", metricsListIndex]];
            }

            metricsListIndex++;
        }
    }


    return [request autorelease];
}

@end

