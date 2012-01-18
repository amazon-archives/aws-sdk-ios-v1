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

#import "CloudWatchDescribeAlarmsForMetricRequestMarshaller.h"

@implementation CloudWatchDescribeAlarmsForMetricRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchDescribeAlarmsForMetricRequest *)describeAlarmsForMetricRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"DescribeAlarmsForMetric"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[describeAlarmsForMetricRequest delegate]];
    [request setCredentials:[describeAlarmsForMetricRequest credentials]];
    [request setEndpoint:[describeAlarmsForMetricRequest requestEndpoint]];
    [request setRequestTag:[describeAlarmsForMetricRequest requestTag]];

    if (describeAlarmsForMetricRequest != nil) {
        if (describeAlarmsForMetricRequest.metricName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsForMetricRequest.metricName] forKey:[NSString stringWithFormat:@"%@", @"MetricName"]];
        }
    }
    if (describeAlarmsForMetricRequest != nil) {
        if (describeAlarmsForMetricRequest.namespace != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsForMetricRequest.namespace] forKey:[NSString stringWithFormat:@"%@", @"Namespace"]];
        }
    }
    if (describeAlarmsForMetricRequest != nil) {
        if (describeAlarmsForMetricRequest.statistic != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsForMetricRequest.statistic] forKey:[NSString stringWithFormat:@"%@", @"Statistic"]];
        }
    }

    if (describeAlarmsForMetricRequest != nil) {
        int dimensionsListIndex = 1;
        for (CloudWatchDimension *dimensionsListValue in describeAlarmsForMetricRequest.dimensions) {
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
    if (describeAlarmsForMetricRequest != nil) {
        if (describeAlarmsForMetricRequest.period != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsForMetricRequest.period] forKey:[NSString stringWithFormat:@"%@", @"Period"]];
        }
    }
    if (describeAlarmsForMetricRequest != nil) {
        if (describeAlarmsForMetricRequest.unit != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", describeAlarmsForMetricRequest.unit] forKey:[NSString stringWithFormat:@"%@", @"Unit"]];
        }
    }


    return [request autorelease];
}

@end

