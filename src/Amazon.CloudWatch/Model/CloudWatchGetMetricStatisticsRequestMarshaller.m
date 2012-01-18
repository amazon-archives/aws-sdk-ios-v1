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

#import "CloudWatchGetMetricStatisticsRequestMarshaller.h"

@implementation CloudWatchGetMetricStatisticsRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchGetMetricStatisticsRequest *)getMetricStatisticsRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"GetMetricStatistics"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[getMetricStatisticsRequest delegate]];
    [request setCredentials:[getMetricStatisticsRequest credentials]];
    [request setEndpoint:[getMetricStatisticsRequest requestEndpoint]];
    [request setRequestTag:[getMetricStatisticsRequest requestTag]];

    if (getMetricStatisticsRequest != nil) {
        if (getMetricStatisticsRequest.namespace != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getMetricStatisticsRequest.namespace] forKey:[NSString stringWithFormat:@"%@", @"Namespace"]];
        }
    }
    if (getMetricStatisticsRequest != nil) {
        if (getMetricStatisticsRequest.metricName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getMetricStatisticsRequest.metricName] forKey:[NSString stringWithFormat:@"%@", @"MetricName"]];
        }
    }

    if (getMetricStatisticsRequest != nil) {
        int dimensionsListIndex = 1;
        for (CloudWatchDimension *dimensionsListValue in getMetricStatisticsRequest.dimensions) {
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
    if (getMetricStatisticsRequest != nil) {
        if (getMetricStatisticsRequest.startTime != nil) {
            [request setParameterValue:[getMetricStatisticsRequest.startTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"StartTime"]];
        }
    }
    if (getMetricStatisticsRequest != nil) {
        if (getMetricStatisticsRequest.endTime != nil) {
            [request setParameterValue:[getMetricStatisticsRequest.endTime stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@", @"EndTime"]];
        }
    }
    if (getMetricStatisticsRequest != nil) {
        if (getMetricStatisticsRequest.period != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getMetricStatisticsRequest.period] forKey:[NSString stringWithFormat:@"%@", @"Period"]];
        }
    }

    if (getMetricStatisticsRequest != nil) {
        int statisticsListIndex = 1;
        for (NSString *statisticsListValue in getMetricStatisticsRequest.statistics) {
            if (statisticsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", statisticsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"Statistics", statisticsListIndex]];
            }

            statisticsListIndex++;
        }
    }
    if (getMetricStatisticsRequest != nil) {
        if (getMetricStatisticsRequest.unit != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", getMetricStatisticsRequest.unit] forKey:[NSString stringWithFormat:@"%@", @"Unit"]];
        }
    }


    return [request autorelease];
}

@end

