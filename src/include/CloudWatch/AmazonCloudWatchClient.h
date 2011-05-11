/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "CloudWatchPutMetricAlarmResponse.h"
#import "CloudWatchPutMetricAlarmResponseUnmarshaller.h"
#import "CloudWatchPutMetricAlarmRequest.h"
#import "CloudWatchPutMetricAlarmRequestMarshaller.h"
#import "CloudWatchPutMetricDataResponse.h"
#import "CloudWatchPutMetricDataResponseUnmarshaller.h"
#import "CloudWatchPutMetricDataRequest.h"
#import "CloudWatchPutMetricDataRequestMarshaller.h"
#import "CloudWatchListMetricsResponse.h"
#import "CloudWatchListMetricsResponseUnmarshaller.h"
#import "CloudWatchListMetricsRequest.h"
#import "CloudWatchListMetricsRequestMarshaller.h"
#import "CloudWatchGetMetricStatisticsResponse.h"
#import "CloudWatchGetMetricStatisticsResponseUnmarshaller.h"
#import "CloudWatchGetMetricStatisticsRequest.h"
#import "CloudWatchGetMetricStatisticsRequestMarshaller.h"
#import "CloudWatchDisableAlarmActionsResponse.h"
#import "CloudWatchDisableAlarmActionsResponseUnmarshaller.h"
#import "CloudWatchDisableAlarmActionsRequest.h"
#import "CloudWatchDisableAlarmActionsRequestMarshaller.h"
#import "CloudWatchDescribeAlarmsResponse.h"
#import "CloudWatchDescribeAlarmsResponseUnmarshaller.h"
#import "CloudWatchDescribeAlarmsRequest.h"
#import "CloudWatchDescribeAlarmsRequestMarshaller.h"
#import "CloudWatchDescribeAlarmsForMetricResponse.h"
#import "CloudWatchDescribeAlarmsForMetricResponseUnmarshaller.h"
#import "CloudWatchDescribeAlarmsForMetricRequest.h"
#import "CloudWatchDescribeAlarmsForMetricRequestMarshaller.h"
#import "CloudWatchDescribeAlarmHistoryResponse.h"
#import "CloudWatchDescribeAlarmHistoryResponseUnmarshaller.h"
#import "CloudWatchDescribeAlarmHistoryRequest.h"
#import "CloudWatchDescribeAlarmHistoryRequestMarshaller.h"
#import "CloudWatchEnableAlarmActionsResponse.h"
#import "CloudWatchEnableAlarmActionsResponseUnmarshaller.h"
#import "CloudWatchEnableAlarmActionsRequest.h"
#import "CloudWatchEnableAlarmActionsRequestMarshaller.h"
#import "CloudWatchDeleteAlarmsResponse.h"
#import "CloudWatchDeleteAlarmsResponseUnmarshaller.h"
#import "CloudWatchDeleteAlarmsRequest.h"
#import "CloudWatchDeleteAlarmsRequestMarshaller.h"
#import "CloudWatchSetAlarmStateResponse.h"
#import "CloudWatchSetAlarmStateResponseUnmarshaller.h"
#import "CloudWatchSetAlarmStateRequest.h"
#import "CloudWatchSetAlarmStateRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"

/** \defgroup CloudWatch Amazon CloudWatch */

/** <summary>
 * Interface for accessing AmazonCloudWatch.
 *
 *  Amazon CloudWatch <p>
 * Amazon CloudWatch is a web service that enables you to monitor and
 * manage various metrics, as well as configure alarm actions based on
 * data from metrics.
 * </p>
 * <p>
 * Amazon CloudWatch monitoring enables you to collect, analyze, and view
 * system and application metrics so that you can make operational and
 * business decisions more quickly and with greater confidence. You can
 * use Amazon CloudWatch to collect metrics about your AWS resources,
 * such as the performance of your Amazon EC2 instances. You can also
 * publish your own metrics directly to Amazon CloudWatch.
 * </p>
 * <p>
 * Amazon CloudWatch allows you to manage the metrics in several ways. If
 * you are publishing your own metrics, you can define custom metrics for
 * your own use. If you are registered for an AWS product that supports
 * Amazon CloudWatch, the service automatically pushes basic metrics to
 * CloudWatch for you. Once Amazon CloudWatch contains metrics from
 * either source, you can calculate statistics based on that data and
 * graphically visualize those statistics in the Amazon CloudWatch
 * Console.
 * </p>
 * <p>
 * Amazon CloudWatch alarms help you implement decisions more easily by
 * enabling you to do things like send notifications or automatically
 * make changes to the resources you are monitoring, based on rules that
 * you define. For example, you can create alarms that initiate Auto
 * Scaling and Simple Notification Service actions on your behalf.
 * </p>
 * </summary>
 *
 * \ingroup CloudWatch
 */
@interface AmazonCloudWatchClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Creates or updates an alarm and associates it with the specified
 * Amazon CloudWatch metric. Optionally, this operation can associate one
 * or more Amazon Simple Notification Service resources with the alarm.
 * </p>
 * <p>
 * When this operation creates an alarm, the alarm state is immediately
 * set to <code>INSUFFICIENT_DATA</code> . The alarm is evaluated and
 * its <code>StateValue</code> is set appropriately. Any actions
 * associated with the <code>StateValue</code> is then executed.
 * </p>
 * <p>
 * <b>NOTE:</b> When updating an existing alarm, its StateValue is left
 * unchanged.
 * </p>
 *
 * @param putMetricAlarmRequest Container for the necessary parameters to
 *           execute the PutMetricAlarm service method on AmazonCloudWatch.
 *
 * @throws CloudWatchLimitExceededException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchPutMetricAlarmResponse *)putMetricAlarm:(CloudWatchPutMetricAlarmRequest *)putMetricAlarmRequest;


/**
 * <p>
 * Publishes metric data points to Amazon CloudWatch. Amazon Cloudwatch
 * associates the data points with the specified metric. If the specified
 * metric does not exist, Amazon CloudWatch creates the metric.
 * </p>
 * <p>
 * <b>NOTE:</b> If you create a metric with the PutMetricData action,
 * allow up to fifteen minutes for the metric to appear in calls to the
 * ListMetrics action.
 * </p>
 * <p>
 * The size of a PutMetricData request is limited to 8 KB for HTTP GET
 * requests and 40 KB for HTTP POST requests.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> Although the Value parameter accepts numbers of type
 * Double, Amazon CloudWatch truncates values with very large exponents.
 * Values with base-10 exponents greater than 126 (1 x 10^126) are
 * truncated. Likewise, values with base-10 exponents less than -130 (1 x
 * 10^-130) are also truncated.
 * </p>
 *
 * @param putMetricDataRequest Container for the necessary parameters to
 *           execute the PutMetricData service method on AmazonCloudWatch.
 *
 * @throws CloudWatchInvalidParameterValueException
 * @throws CloudWatchInternalServiceException
 * @throws CloudWatchInvalidParameterCombinationException
 * @throws CloudWatchMissingRequiredParameterException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchPutMetricDataResponse *)putMetricData:(CloudWatchPutMetricDataRequest *)putMetricDataRequest;


/**
 * <p>
 * Returns a list of valid metrics stored for the AWS account owner.
 * Returned metrics can be used with <code>GetMetricStatistics</code> to
 * obtain statistical data for a given metric.
 * </p>
 * <p>
 * <b>NOTE:</b> Up to 500 results are returned for any one call. To
 * retrieve further results, use returned NextToken values with
 * subsequent ListMetrics operations.
 * </p>
 * <p>
 * <b>NOTE:</b> If you create a metric with the PutMetricData action,
 * allow up to fifteen minutes for the metric to appear in calls to the
 * ListMetrics action.
 * </p>
 *
 * @param listMetricsRequest Container for the necessary parameters to
 *           execute the ListMetrics service method on AmazonCloudWatch.
 *
 * @return The response from the ListMetrics service method, as returned
 *         by AmazonCloudWatch.
 *
 * @throws CloudWatchInternalServiceException
 * @throws CloudWatchInvalidParameterValueException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchListMetricsResponse *)listMetrics:(CloudWatchListMetricsRequest *)listMetricsRequest;


/**
 * <p>
 * Gets statistics for the specified metric.
 * </p>
 * <p>
 * <b>NOTE:</b> The maximum number of data points returned from a single
 * GetMetricStatistics request is 1,440. If a request is made that
 * generates more than 1,440 data points, Amazon CloudWatch returns an
 * error. In such a case, alter the request by narrowing the specified
 * time range or increasing the specified period. Alternatively, make
 * multiple requests across adjacent time ranges.
 * </p>
 * <p>
 * Amazon CloudWatch aggregates data points based on the length of the
 * <code>period</code> that you specify. For example, if you request
 * statistics with a one-minute granularity, Amazon CloudWatch aggregates
 * data points with time stamps that fall within the same one-minute
 * period. In such a case, the data points queried can greatly outnumber
 * the data points returned.
 * </p>
 * <p>
 * <b>NOTE:</b> The maximum number of data points that can be queried is
 * 50,850; whereas the maximum number of data points returned is 1,440.
 * </p>
 * <p>
 * The following examples show various statistics allowed by the data
 * point query maximum of 50,850 when you call
 * <code>GetMetricStatistics</code> on Amazon EC2 instances with detailed
 * (one-minute) monitoring enabled:
 * </p>
 *
 * <ul>
 * <li>Statistics for up to 400 instances for a span of one hour</li>
 * <li>Statistics for up to 35 instances over a span of 24 hours</li>
 * <li>Statistics for up to 2 instances over a span of 2 weeks</li>
 *
 * </ul>
 *
 * @param getMetricStatisticsRequest Container for the necessary
 *           parameters to execute the GetMetricStatistics service method on
 *           AmazonCloudWatch.
 *
 * @return The response from the GetMetricStatistics service method, as
 *         returned by AmazonCloudWatch.
 *
 * @throws CloudWatchInvalidParameterValueException
 * @throws CloudWatchInternalServiceException
 * @throws CloudWatchInvalidParameterCombinationException
 * @throws CloudWatchMissingRequiredParameterException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchGetMetricStatisticsResponse *)getMetricStatistics:(CloudWatchGetMetricStatisticsRequest *)getMetricStatisticsRequest;


/**
 * <p>
 * Disables actions for the specified alarms. When an alarm's actions
 * are disabled the alarm's state may change, but none of the alarm's
 * actions will execute.
 * </p>
 *
 * @param disableAlarmActionsRequest Container for the necessary
 *           parameters to execute the DisableAlarmActions service method on
 *           AmazonCloudWatch.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchDisableAlarmActionsResponse *)disableAlarmActions:(CloudWatchDisableAlarmActionsRequest *)disableAlarmActionsRequest;


/**
 * <p>
 * Retrieves alarms with the specified names. If no name is specified,
 * all alarms for the user are returned. Alarms can be retrieved by using
 * only a prefix for the alarm name, the alarm state, or a prefix for any
 * action.
 * </p>
 *
 * @param describeAlarmsRequest Container for the necessary parameters to
 *           execute the DescribeAlarms service method on AmazonCloudWatch.
 *
 * @return The response from the DescribeAlarms service method, as
 *         returned by AmazonCloudWatch.
 *
 * @throws CloudWatchInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchDescribeAlarmsResponse *)describeAlarms:(CloudWatchDescribeAlarmsRequest *)describeAlarmsRequest;


/**
 * <p>
 * Retrieves all alarms for a single metric. Specify a statistic,
 * period, or unit to filter the set of alarms further.
 * </p>
 *
 * @param describeAlarmsForMetricRequest Container for the necessary
 *           parameters to execute the DescribeAlarmsForMetric service method on
 *           AmazonCloudWatch.
 *
 * @return The response from the DescribeAlarmsForMetric service method,
 *         as returned by AmazonCloudWatch.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchDescribeAlarmsForMetricResponse *)describeAlarmsForMetric:(CloudWatchDescribeAlarmsForMetricRequest *)describeAlarmsForMetricRequest;


/**
 * <p>
 * Retrieves history for the specified alarm. Filter alarms by date
 * range or item type. If an alarm name is not specified, Amazon
 * CloudWatch returns histories for all of the owner's alarms.
 * </p>
 * <p>
 * <b>NOTE:</b> Amazon CloudWatch retains the history of an alarm for two
 * weeks, whether or not you delete the alarm.
 * </p>
 *
 * @param describeAlarmHistoryRequest Container for the necessary
 *           parameters to execute the DescribeAlarmHistory service method on
 *           AmazonCloudWatch.
 *
 * @return The response from the DescribeAlarmHistory service method, as
 *         returned by AmazonCloudWatch.
 *
 * @throws CloudWatchInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchDescribeAlarmHistoryResponse *)describeAlarmHistory:(CloudWatchDescribeAlarmHistoryRequest *)describeAlarmHistoryRequest;


/**
 * <p>
 * Enables actions for the specified alarms.
 * </p>
 *
 * @param enableAlarmActionsRequest Container for the necessary
 *           parameters to execute the EnableAlarmActions service method on
 *           AmazonCloudWatch.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchEnableAlarmActionsResponse *)enableAlarmActions:(CloudWatchEnableAlarmActionsRequest *)enableAlarmActionsRequest;


/**
 * <p>
 * Deletes all specified alarms. In the event of an error, no alarms are
 * deleted.
 * </p>
 *
 * @param deleteAlarmsRequest Container for the necessary parameters to
 *           execute the DeleteAlarms service method on AmazonCloudWatch.
 *
 * @throws CloudWatchResourceNotFoundException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchDeleteAlarmsResponse *)deleteAlarms:(CloudWatchDeleteAlarmsRequest *)deleteAlarmsRequest;


/**
 * <p>
 * Temporarily sets the state of an alarm. When the updated
 * <code>StateValue</code> differs from the previous value, the action
 * configured for the appropriate state is invoked. This is not a
 * permanent change. The next periodic alarm check (in about a minute)
 * will set the alarm to its actual state.
 * </p>
 *
 * @param setAlarmStateRequest Container for the necessary parameters to
 *           execute the SetAlarmState service method on AmazonCloudWatch.
 *
 * @throws CloudWatchResourceNotFoundException
 * @throws CloudWatchInvalidFormatException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonCloudWatch indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(CloudWatchSetAlarmStateResponse *)setAlarmState:(CloudWatchSetAlarmStateRequest *)setAlarmStateRequest;



@end

