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

#import "AutoScalingEnableMetricsCollectionRequestMarshaller.h"

@implementation AutoScalingEnableMetricsCollectionRequestMarshaller

+(AmazonServiceRequest *)createRequest:(AutoScalingEnableMetricsCollectionRequest *)enableMetricsCollectionRequest
{
    AmazonServiceRequest *request = [[AutoScalingRequest alloc] init];

    [request setParameterValue:@"EnableMetricsCollection"           forKey:@"Action"];
    [request setParameterValue:@"2011-01-01"   forKey:@"Version"];

    [request setDelegate:[enableMetricsCollectionRequest delegate]];
    [request setCredentials:[enableMetricsCollectionRequest credentials]];
    [request setEndpoint:[enableMetricsCollectionRequest requestEndpoint]];
    [request setRequestTag:[enableMetricsCollectionRequest requestTag]];

    if (enableMetricsCollectionRequest != nil) {
        if (enableMetricsCollectionRequest.autoScalingGroupName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", enableMetricsCollectionRequest.autoScalingGroupName] forKey:[NSString stringWithFormat:@"%@", @"AutoScalingGroupName"]];
        }
    }

    if (enableMetricsCollectionRequest != nil) {
        int metricsListIndex = 1;
        for (NSString *metricsListValue in enableMetricsCollectionRequest.metrics) {
            if (metricsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", metricsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Metrics", metricsListIndex]];
            }

            metricsListIndex++;
        }
    }
    if (enableMetricsCollectionRequest != nil) {
        if (enableMetricsCollectionRequest.granularity != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", enableMetricsCollectionRequest.granularity] forKey:[NSString stringWithFormat:@"%@", @"Granularity"]];
        }
    }


    return [request autorelease];
}

@end

