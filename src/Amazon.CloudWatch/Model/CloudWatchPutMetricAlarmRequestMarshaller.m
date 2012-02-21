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

#import "CloudWatchPutMetricAlarmRequestMarshaller.h"

@implementation CloudWatchPutMetricAlarmRequestMarshaller

+(AmazonServiceRequest *)createRequest:(CloudWatchPutMetricAlarmRequest *)putMetricAlarmRequest
{
    AmazonServiceRequest *request = [[CloudWatchRequest alloc] init];

    [request setParameterValue:@"PutMetricAlarm"           forKey:@"Action"];
    [request setParameterValue:@"2010-08-01"   forKey:@"Version"];

    [request setDelegate:[putMetricAlarmRequest delegate]];
    [request setCredentials:[putMetricAlarmRequest credentials]];
    [request setEndpoint:[putMetricAlarmRequest requestEndpoint]];
    [request setRequestTag:[putMetricAlarmRequest requestTag]];

    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.alarmName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.alarmName] forKey:[NSString stringWithFormat:@"%@", @"AlarmName"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.alarmDescription != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.alarmDescription] forKey:[NSString stringWithFormat:@"%@", @"AlarmDescription"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.actionsEnabledIsSet) {
            [request setParameterValue:(putMetricAlarmRequest.actionsEnabled ? @"true":@"false") forKey:[NSString stringWithFormat:@"%@", @"ActionsEnabled"]];
        }
    }

    if (putMetricAlarmRequest != nil) {
        int oKActionsListIndex = 1;
        for (NSString *oKActionsListValue in putMetricAlarmRequest.oKActions) {
            if (oKActionsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", oKActionsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"OKActions", oKActionsListIndex]];
            }

            oKActionsListIndex++;
        }
    }

    if (putMetricAlarmRequest != nil) {
        int alarmActionsListIndex = 1;
        for (NSString *alarmActionsListValue in putMetricAlarmRequest.alarmActions) {
            if (alarmActionsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", alarmActionsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"AlarmActions", alarmActionsListIndex]];
            }

            alarmActionsListIndex++;
        }
    }

    if (putMetricAlarmRequest != nil) {
        int insufficientDataActionsListIndex = 1;
        for (NSString *insufficientDataActionsListValue in putMetricAlarmRequest.insufficientDataActions) {
            if (insufficientDataActionsListValue != nil) {
                [request setParameterValue:[NSString stringWithFormat:@"%@", insufficientDataActionsListValue] forKey:[NSString stringWithFormat:@"%@.member.%d", @"InsufficientDataActions", insufficientDataActionsListIndex]];
            }

            insufficientDataActionsListIndex++;
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.metricName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.metricName] forKey:[NSString stringWithFormat:@"%@", @"MetricName"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.namespace != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.namespace] forKey:[NSString stringWithFormat:@"%@", @"Namespace"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.statistic != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.statistic] forKey:[NSString stringWithFormat:@"%@", @"Statistic"]];
        }
    }

    if (putMetricAlarmRequest != nil) {
        int dimensionsListIndex = 1;
        for (CloudWatchDimension *dimensionsListValue in putMetricAlarmRequest.dimensions) {
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
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.period != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.period] forKey:[NSString stringWithFormat:@"%@", @"Period"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.unit != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.unit] forKey:[NSString stringWithFormat:@"%@", @"Unit"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.evaluationPeriods != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.evaluationPeriods] forKey:[NSString stringWithFormat:@"%@", @"EvaluationPeriods"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.threshold != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.threshold] forKey:[NSString stringWithFormat:@"%@", @"Threshold"]];
        }
    }
    if (putMetricAlarmRequest != nil) {
        if (putMetricAlarmRequest.comparisonOperator != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", putMetricAlarmRequest.comparisonOperator] forKey:[NSString stringWithFormat:@"%@", @"ComparisonOperator"]];
        }
    }


    return [request autorelease];
}

@end

