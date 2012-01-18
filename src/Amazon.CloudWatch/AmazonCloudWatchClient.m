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

#import "AmazonCloudWatchClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonCloudWatchClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = @"https://monitoring.amazonaws.com";
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = @"https://monitoring.amazonaws.com";
    }
    return self;
}

-(CloudWatchPutMetricAlarmResponse *)putMetricAlarm:(CloudWatchPutMetricAlarmRequest *)putMetricAlarmRequest
{
    AmazonServiceRequest *request = [CloudWatchPutMetricAlarmRequestMarshaller createRequest:putMetricAlarmRequest];

    return (CloudWatchPutMetricAlarmResponse *)[self invoke:request rawRequest:putMetricAlarmRequest unmarshallerDelegate:[CloudWatchPutMetricAlarmResponseUnmarshaller class]];
}

-(CloudWatchPutMetricDataResponse *)putMetricData:(CloudWatchPutMetricDataRequest *)putMetricDataRequest
{
    AmazonServiceRequest *request = [CloudWatchPutMetricDataRequestMarshaller createRequest:putMetricDataRequest];

    return (CloudWatchPutMetricDataResponse *)[self invoke:request rawRequest:putMetricDataRequest unmarshallerDelegate:[CloudWatchPutMetricDataResponseUnmarshaller class]];
}

-(CloudWatchListMetricsResponse *)listMetrics:(CloudWatchListMetricsRequest *)listMetricsRequest
{
    AmazonServiceRequest *request = [CloudWatchListMetricsRequestMarshaller createRequest:listMetricsRequest];

    return (CloudWatchListMetricsResponse *)[self invoke:request rawRequest:listMetricsRequest unmarshallerDelegate:[CloudWatchListMetricsResponseUnmarshaller class]];
}

-(CloudWatchGetMetricStatisticsResponse *)getMetricStatistics:(CloudWatchGetMetricStatisticsRequest *)getMetricStatisticsRequest
{
    AmazonServiceRequest *request = [CloudWatchGetMetricStatisticsRequestMarshaller createRequest:getMetricStatisticsRequest];

    return (CloudWatchGetMetricStatisticsResponse *)[self invoke:request rawRequest:getMetricStatisticsRequest unmarshallerDelegate:[CloudWatchGetMetricStatisticsResponseUnmarshaller class]];
}

-(CloudWatchDisableAlarmActionsResponse *)disableAlarmActions:(CloudWatchDisableAlarmActionsRequest *)disableAlarmActionsRequest
{
    AmazonServiceRequest *request = [CloudWatchDisableAlarmActionsRequestMarshaller createRequest:disableAlarmActionsRequest];

    return (CloudWatchDisableAlarmActionsResponse *)[self invoke:request rawRequest:disableAlarmActionsRequest unmarshallerDelegate:[CloudWatchDisableAlarmActionsResponseUnmarshaller class]];
}

-(CloudWatchDescribeAlarmsResponse *)describeAlarms:(CloudWatchDescribeAlarmsRequest *)describeAlarmsRequest
{
    AmazonServiceRequest *request = [CloudWatchDescribeAlarmsRequestMarshaller createRequest:describeAlarmsRequest];

    return (CloudWatchDescribeAlarmsResponse *)[self invoke:request rawRequest:describeAlarmsRequest unmarshallerDelegate:[CloudWatchDescribeAlarmsResponseUnmarshaller class]];
}

-(CloudWatchDescribeAlarmsForMetricResponse *)describeAlarmsForMetric:(CloudWatchDescribeAlarmsForMetricRequest *)describeAlarmsForMetricRequest
{
    AmazonServiceRequest *request = [CloudWatchDescribeAlarmsForMetricRequestMarshaller createRequest:describeAlarmsForMetricRequest];

    return (CloudWatchDescribeAlarmsForMetricResponse *)[self invoke:request rawRequest:describeAlarmsForMetricRequest unmarshallerDelegate:[CloudWatchDescribeAlarmsForMetricResponseUnmarshaller class]];
}

-(CloudWatchDescribeAlarmHistoryResponse *)describeAlarmHistory:(CloudWatchDescribeAlarmHistoryRequest *)describeAlarmHistoryRequest
{
    AmazonServiceRequest *request = [CloudWatchDescribeAlarmHistoryRequestMarshaller createRequest:describeAlarmHistoryRequest];

    return (CloudWatchDescribeAlarmHistoryResponse *)[self invoke:request rawRequest:describeAlarmHistoryRequest unmarshallerDelegate:[CloudWatchDescribeAlarmHistoryResponseUnmarshaller class]];
}

-(CloudWatchEnableAlarmActionsResponse *)enableAlarmActions:(CloudWatchEnableAlarmActionsRequest *)enableAlarmActionsRequest
{
    AmazonServiceRequest *request = [CloudWatchEnableAlarmActionsRequestMarshaller createRequest:enableAlarmActionsRequest];

    return (CloudWatchEnableAlarmActionsResponse *)[self invoke:request rawRequest:enableAlarmActionsRequest unmarshallerDelegate:[CloudWatchEnableAlarmActionsResponseUnmarshaller class]];
}

-(CloudWatchDeleteAlarmsResponse *)deleteAlarms:(CloudWatchDeleteAlarmsRequest *)deleteAlarmsRequest
{
    AmazonServiceRequest *request = [CloudWatchDeleteAlarmsRequestMarshaller createRequest:deleteAlarmsRequest];

    return (CloudWatchDeleteAlarmsResponse *)[self invoke:request rawRequest:deleteAlarmsRequest unmarshallerDelegate:[CloudWatchDeleteAlarmsResponseUnmarshaller class]];
}

-(CloudWatchSetAlarmStateResponse *)setAlarmState:(CloudWatchSetAlarmStateRequest *)setAlarmStateRequest
{
    AmazonServiceRequest *request = [CloudWatchSetAlarmStateRequestMarshaller createRequest:setAlarmStateRequest];

    return (CloudWatchSetAlarmStateResponse *)[self invoke:request rawRequest:setAlarmStateRequest unmarshallerDelegate:[CloudWatchSetAlarmStateResponseUnmarshaller class]];
}



@end

