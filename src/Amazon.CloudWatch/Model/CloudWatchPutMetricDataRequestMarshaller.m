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

#import "CloudWatchPutMetricDataRequestMarshaller.h"

@implementation CloudWatchPutMetricDataRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchPutMetricDataRequest *)putMetricDataRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"PutMetricData"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[putMetricDataRequest delegate]];
    [request setCredentials:[putMetricDataRequest credentials]];
    [request setEndpoint:[putMetricDataRequest requestEndpoint]];
    [request setRequestTag:[putMetricDataRequest requestTag]];

    if (putMetricDataRequest != nil) {
        if (putMetricDataRequest.namespace != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricDataRequest.namespace] forKey:[NSString stringWithFormat:@"%@", @"Namespace"]];
        }
    }

    if (putMetricDataRequest != nil) {
        int metricDatasListIndex = 1;
        for (CloudWatchMetricDatum *metricDatasListValue in putMetricDataRequest.metricDatas) {
            if (metricDatasListValue != nil) {
                if (metricDatasListValue.metricName != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", metricDatasListValue.metricName] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"MetricData", metricDatasListIndex, @"MetricName"]];
                }
            }

            if (metricDatasListValue != nil) {
                int dimensionsListIndex = 1;
                for (CloudWatchDimension *dimensionsListValue in metricDatasListValue.dimensions) {
                    if (dimensionsListValue != nil) {
                        if (dimensionsListValue.name != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", dimensionsListValue.name] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.member.%d.%@", @"MetricData", metricDatasListIndex, @"Dimensions", dimensionsListIndex, @"Name"]];
                        }
                    }
                    if (dimensionsListValue != nil) {
                        if (dimensionsListValue.value != nil) {
                            [request setParameterValue:[NSString stringWithFormat:@"%@", dimensionsListValue.value] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.member.%d.%@", @"MetricData", metricDatasListIndex, @"Dimensions", dimensionsListIndex, @"Value"]];
                        }
                    }

                    dimensionsListIndex++;
                }
            }
            if (metricDatasListValue != nil) {
                if (metricDatasListValue.timestamp != nil) {
                    [request setParameterValue:[metricDatasListValue.timestamp stringWithISO8061Format] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"MetricData", metricDatasListIndex, @"Timestamp"]];
                }
            }
            if (metricDatasListValue != nil) {
                if (metricDatasListValue.value != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", metricDatasListValue.value] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"MetricData", metricDatasListIndex, @"Value"]];
                }
            }
            if (metricDatasListValue != nil) {
                CloudWatchStatisticSet *statisticValues = metricDatasListValue.statisticValues;
                if (statisticValues != nil) {
                    if (statisticValues.sampleCount != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", statisticValues.sampleCount] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.%@", @"MetricData", metricDatasListIndex, @"StatisticValues", @"SampleCount"]];
                    }
                }
                if (statisticValues != nil) {
                    if (statisticValues.sum != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", statisticValues.sum] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.%@", @"MetricData", metricDatasListIndex, @"StatisticValues", @"Sum"]];
                    }
                }
                if (statisticValues != nil) {
                    if (statisticValues.minimum != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", statisticValues.minimum] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.%@", @"MetricData", metricDatasListIndex, @"StatisticValues", @"Minimum"]];
                    }
                }
                if (statisticValues != nil) {
                    if (statisticValues.maximum != nil) {
                        [request setParameterValue:[NSString stringWithFormat:@"%@", statisticValues.maximum] forKey:[NSString stringWithFormat:@"%@.member.%d.%@.%@", @"MetricData", metricDatasListIndex, @"StatisticValues", @"Maximum"]];
                    }
                }
            }
            if (metricDatasListValue != nil) {
                if (metricDatasListValue.unit != nil) {
                    [request setParameterValue:[NSString stringWithFormat:@"%@", metricDatasListValue.unit] forKey:[NSString stringWithFormat:@"%@.member.%d.%@", @"MetricData", metricDatasListIndex, @"Unit"]];
                }
            }

            metricDatasListIndex++;
        }
    }


    return [request autorelease];
}

@end

