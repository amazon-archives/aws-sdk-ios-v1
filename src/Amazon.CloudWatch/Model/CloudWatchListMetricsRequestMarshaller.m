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

#import "CloudWatchListMetricsRequestMarshaller.h"

@implementation CloudWatchListMetricsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchListMetricsRequest *)listMetricsRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"ListMetrics"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[listMetricsRequest delegate]];
    [request setCredentials:[listMetricsRequest credentials]];
    [request setEndpoint:[listMetricsRequest requestEndpoint]];
    [request setRequestTag:[listMetricsRequest requestTag]];

    if (listMetricsRequest != nil) {
        if (listMetricsRequest.namespace != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listMetricsRequest.namespace] forKey:[NSString stringWithFormat:@"%@", @"Namespace"]];
        }
    }
    if (listMetricsRequest != nil) {
        if (listMetricsRequest.metricName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listMetricsRequest.metricName] forKey:[NSString stringWithFormat:@"%@", @"MetricName"]];
        }
    }

    if (listMetricsRequest != nil) {
        int dimensionsListIndex = 1;
        for (CloudWatchDimensionFilter *dimensionsListValue in listMetricsRequest.dimensions) {
            if (dimensionsListValue != nil) {
                if (dimensionsListValue.name != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", dimensionsListValue.name] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Dimensions", dimensionsListIndex, @"Name"]];
                }
            }
            if (dimensionsListValue != nil) {
                if (dimensionsListValue.value != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", dimensionsListValue.value] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"Dimensions", dimensionsListIndex, @"Value"]];
                }
            }

            dimensionsListIndex++;
        }
    }
    if (listMetricsRequest != nil) {
        if (listMetricsRequest.nextToken != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", listMetricsRequest.nextToken] forKey:[NSString stringWithFormat:@"%@", @"NextToken"]];
        }
    }


    return [request autorelease];
}

@end

