/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import "CloudWatchPutMetricAlarmRequest.h"
#import "CloudWatchPutMetricDataResponse.h"
#import "CloudWatchPutMetricDataRequest.h"
#import "CloudWatchListMetricsResponse.h"
#import "CloudWatchListMetricsRequest.h"
#import "CloudWatchGetMetricStatisticsResponse.h"
#import "CloudWatchGetMetricStatisticsRequest.h"
#import "CloudWatchDisableAlarmActionsResponse.h"
#import "CloudWatchDisableAlarmActionsRequest.h"
#import "CloudWatchDescribeAlarmsResponse.h"
#import "CloudWatchDescribeAlarmsRequest.h"
#import "CloudWatchDescribeAlarmsForMetricResponse.h"
#import "CloudWatchDescribeAlarmsForMetricRequest.h"
#import "CloudWatchDescribeAlarmHistoryResponse.h"
#import "CloudWatchDescribeAlarmHistoryRequest.h"
#import "CloudWatchEnableAlarmActionsResponse.h"
#import "CloudWatchEnableAlarmActionsRequest.h"
#import "CloudWatchDeleteAlarmsResponse.h"
#import "CloudWatchDeleteAlarmsRequest.h"
#import "CloudWatchSetAlarmStateResponse.h"
#import "CloudWatchSetAlarmStateRequest.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonWebServiceClient.h>
#else
#import "../AmazonWebServiceClient.h"
#endif

/** \defgroup CloudWatch Amazon CloudWatch */

/** <summary>
 * Interface for accessing AmazonCloudWatch.
 *
 *  Amazon CloudWatch <p>
 * This is the <i>Amazon CloudWatch API Reference</i> . This guide provides detailed information about Amazon CloudWatch actions, data types, parameters, and errors. For detailed information about Amazon
 * CloudWatch features and their associated API calls, go to the <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide"> Amazon CloudWatch Developer Guide </a> .
 * </p>
 * <p>
 * Amazon CloudWatch is a web service that enables you to publish, monitor, and manage various metrics, as well as configure alarm actions based on data from metrics. For more information about this
 * product go to <a href="http://aws.amazon.com/cloudwatch"> http://aws.amazon.com/cloudwatch </a> .
 * </p>
 * <p>
 * For information about the namespace, metric names, and dimensions that other Amazon Web Services products use to send metrics to CloudWatch, go to <a
 * href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html"> Amazon CloudWatch Metrics, Namespaces, and Dimensions Reference </a> in the <i>Amazon CloudWatch
 * Developer Guide</i> .
 *
 * </p>
 * <p>
 * Use the following links to get started using the <i>Amazon CloudWatch API Reference</i> :
 * </p>
 *
 * <ul>
 * <li> <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Operations.html"> Actions </a> : An alphabetical list of all Amazon CloudWatch actions.</li>
 * <li> <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Types.html"> Data Types </a> : An alphabetical list of all Amazon CloudWatch data types.</li>
 * <li> <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CommonParameters.html"> Common Parameters </a> : Parameters that all Query actions can use.</li>
 * <li> <a href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/CommonErrors.html"> Common Errors </a> : Client and server errors that all actions can return.</li>
 * <li> <a href="http://docs.aws.amazon.com/general/latest/gr/index.html?rande.html"> Regions and Endpoints </a> : Itemized regions and endpoints for all AWS products.</li>
 * <li> <a href="http://monitoring.amazonaws.com/doc/2010-08-01/CloudWatch.wsdl"> WSDL Location </a> : http://monitoring.amazonaws.com/doc/2010-08-01/CloudWatch.wsdl</li>
 *
 * </ul>
 * <p>
 * In addition to using the Amazon CloudWatch API, you can also use the following SDKs and third-party libraries to access Amazon CloudWatch programmatically.
 * </p>
 *
 * <ul>
 * <li> <a href="http://aws.amazon.com/documentation/sdkforjava/"> AWS SDK for Java Documentation </a> </li>
 * <li> <a href="http://aws.amazon.com/documentation/sdkfornet/"> AWS SDK for .NET Documentation </a> </li>
 * <li> <a href="http://aws.amazon.com/documentation/sdkforphp/"> AWS SDK for PHP Documentation </a> </li>
 * <li> <a href="http://aws.amazon.com/documentation/sdkforruby/"> AWS SDK for Ruby Documentation </a> </li>
 *
 * </ul>
 * <p>
 * Developers in the AWS developer community also provide their own libraries, which you can find at the following AWS developer centers:
 * </p>
 *
 * <ul>
 * <li> <a href="http://aws.amazon.com/java/"> AWS Java Developer Center </a> </li>
 * <li> <a href="http://aws.amazon.com/php/"> AWS PHP Developer Center </a> </li>
 * <li> <a href="http://aws.amazon.com/python/"> AWS Python Developer Center </a> </li>
 * <li> <a href="http://aws.amazon.com/ruby/"> AWS Ruby Developer Center </a> </li>
 * <li> <a href="http://aws.amazon.com/net/"> AWS Windows and .NET Developer Center </a> </li>
 *
 * </ul>
 * </summary>
 *
 * See our blog to learn more about Managing Credentials in Mobile Applications.
 * @see http://mobile.awsblog.com/post/Tx31X75XISXHRH8/Managing-Credentials-in-Mobile-Applications
 */
@interface AmazonCloudWatchClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Creates or updates an alarm and associates it with the specified Amazon CloudWatch metric. Optionally, this operation
 * can associate one or more Amazon Simple Notification Service resources with the alarm.
 * </p>
 * <p>
 * When this operation creates an alarm, the alarm state is immediately set to INSUFFICIENT_DATA . The alarm is evaluated
 * and its StateValue is set appropriately. Any actions associated with the StateValue is then executed.
 * </p>
 * <p>
 * <b>NOTE:</b> When updating an existing alarm, its StateValue is left unchanged.
 * </p>
 *
 * @param putMetricAlarmRequest Container for the necessary parameters to execute the PutMetricAlarm service method on
 *           AmazonCloudWatch.
 *
 * @exception CloudWatchLimitExceededException For more information see <CloudWatchLimitExceededException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchPutMetricAlarmRequest
 * @see CloudWatchPutMetricAlarmResponse
 */
-(CloudWatchPutMetricAlarmResponse *)putMetricAlarm:(CloudWatchPutMetricAlarmRequest *)putMetricAlarmRequest;


/**
 * <p>
 * Publishes metric data points to Amazon CloudWatch. Amazon CloudWatch associates the data points with the specified
 * metric. If the specified metric does not exist, Amazon CloudWatch creates the metric. When Amazon CloudWatch creates a
 * metric, it can take up to fifteen minutes for the metric to appear in calls to the ListMetrics action.
 * </p>
 * <p>
 * Each PutMetricData request is limited to 8 KB in size for HTTP GET requests and is limited to 40 KB in size for HTTP
 * POST requests.
 * </p>
 * <p>
 * <b>IMPORTANT:</b>Although the Value parameter accepts numbers of type Double, Amazon CloudWatch rejects values that are
 * either too small or too large. Values must be in the range of 8.515920e-109 to 1.174271e+108 (Base 10) or 2e-360 to
 * 2e360 (Base 2). In addition, special values (e.g., NaN, +Infinity, -Infinity) are not supported.
 * </p>
 * <p>
 * Data that is timestamped 24 hours or more in the past may take in excess of 48 hours to become available from submission
 * time using GetMetricStatistics .
 * </p>
 *
 * @param putMetricDataRequest Container for the necessary parameters to execute the PutMetricData service method on
 *           AmazonCloudWatch.
 *
 * @exception CloudWatchInvalidParameterValueException For more information see <CloudWatchInvalidParameterValueException>
 * @exception CloudWatchInternalServiceException For more information see <CloudWatchInternalServiceException>
 * @exception CloudWatchInvalidParameterCombinationException For more information see <CloudWatchInvalidParameterCombinationException>
 * @exception CloudWatchMissingRequiredParameterException For more information see <CloudWatchMissingRequiredParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchPutMetricDataRequest
 * @see CloudWatchPutMetricDataResponse
 */
-(CloudWatchPutMetricDataResponse *)putMetricData:(CloudWatchPutMetricDataRequest *)putMetricDataRequest;


/**
 * <p>
 * Returns a list of valid metrics stored for the AWS account owner. Returned metrics can be used with GetMetricStatistics
 * to obtain statistical data for a given metric.
 * </p>
 * <p>
 * <b>NOTE:</b> Up to 500 results are returned for any one call. To retrieve further results, use returned NextToken
 * values with subsequent ListMetrics operations.
 * </p>
 * <p>
 * <b>NOTE:</b> If you create a metric with the PutMetricData action, allow up to fifteen minutes for the metric to appear
 * in calls to the ListMetrics action. Statistics about the metric, however, are available sooner using
 * GetMetricStatistics.
 * </p>
 *
 * @param listMetricsRequest Container for the necessary parameters to execute the ListMetrics service method on
 *           AmazonCloudWatch.
 *
 * @return The response from the ListMetrics service method, as returned by AmazonCloudWatch.
 *
 * @exception CloudWatchInternalServiceException For more information see <CloudWatchInternalServiceException>
 * @exception CloudWatchInvalidParameterValueException For more information see <CloudWatchInvalidParameterValueException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchListMetricsRequest
 * @see CloudWatchListMetricsResponse
 */
-(CloudWatchListMetricsResponse *)listMetrics:(CloudWatchListMetricsRequest *)listMetricsRequest;


/**
 * <p>
 * Gets statistics for the specified metric.
 * </p>
 * <p>
 * The maximum number of data points returned from a single GetMetricStatistics request is 1,440, wereas the maximum
 * number of data points that can be queried is 50,850. If you make a request that generates more than 1,440 data points,
 * Amazon CloudWatch returns an error. In such a case, you can alter the request by narrowing the specified time range or
 * increasing the specified period. Alternatively, you can make multiple requests across adjacent time ranges.
 * </p>
 * <p>
 * Amazon CloudWatch aggregates data points based on the length of the period that you specify. For example, if you
 * request statistics with a one-minute granularity, Amazon CloudWatch aggregates data points with time stamps that fall
 * within the same one-minute period. In such a case, the data points queried can greatly outnumber the data points
 * returned.
 * </p>
 * <p>
 * The following examples show various statistics allowed by the data point query maximum of 50,850 when you call
 * GetMetricStatistics on Amazon EC2 instances with detailed (one-minute) monitoring enabled:
 * </p>
 *
 * <ul>
 * <li>Statistics for up to 400 instances for a span of one hour</li>
 * <li>Statistics for up to 35 instances over a span of 24 hours</li>
 * <li>Statistics for up to 2 instances over a span of 2 weeks</li>
 *
 * </ul>
 * <p>
 * For information about the namespace, metric names, and dimensions that other Amazon Web Services products use to send
 * metrics to CloudWatch, go to <a
 * href="http://docs.aws.amazon.com/AmazonCloudWatch/latest/DeveloperGuide/CW_Support_For_AWS.html"> Amazon CloudWatch
 * Metrics, Namespaces, and Dimensions Reference </a> in the <i>Amazon CloudWatch Developer Guide</i> .
 *
 * </p>
 *
 * @param getMetricStatisticsRequest Container for the necessary parameters to execute the GetMetricStatistics service
 *           method on AmazonCloudWatch.
 *
 * @return The response from the GetMetricStatistics service method, as returned by AmazonCloudWatch.
 *
 * @exception CloudWatchInvalidParameterValueException For more information see <CloudWatchInvalidParameterValueException>
 * @exception CloudWatchInternalServiceException For more information see <CloudWatchInternalServiceException>
 * @exception CloudWatchInvalidParameterCombinationException For more information see <CloudWatchInvalidParameterCombinationException>
 * @exception CloudWatchMissingRequiredParameterException For more information see <CloudWatchMissingRequiredParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchGetMetricStatisticsRequest
 * @see CloudWatchGetMetricStatisticsResponse
 */
-(CloudWatchGetMetricStatisticsResponse *)getMetricStatistics:(CloudWatchGetMetricStatisticsRequest *)getMetricStatisticsRequest;


/**
 * <p>
 * Disables actions for the specified alarms. When an alarm's actions are disabled the alarm's state may change, but none
 * of the alarm's actions will execute.
 * </p>
 *
 * @param disableAlarmActionsRequest Container for the necessary parameters to execute the DisableAlarmActions service
 *           method on AmazonCloudWatch.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchDisableAlarmActionsRequest
 * @see CloudWatchDisableAlarmActionsResponse
 */
-(CloudWatchDisableAlarmActionsResponse *)disableAlarmActions:(CloudWatchDisableAlarmActionsRequest *)disableAlarmActionsRequest;


/**
 * <p>
 * Retrieves alarms with the specified names. If no name is specified, all alarms for the user are returned. Alarms can be
 * retrieved by using only a prefix for the alarm name, the alarm state, or a prefix for any action.
 * </p>
 *
 * @param describeAlarmsRequest Container for the necessary parameters to execute the DescribeAlarms service method on
 *           AmazonCloudWatch.
 *
 * @return The response from the DescribeAlarms service method, as returned by AmazonCloudWatch.
 *
 * @exception CloudWatchInvalidNextTokenException For more information see <CloudWatchInvalidNextTokenException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchDescribeAlarmsRequest
 * @see CloudWatchDescribeAlarmsResponse
 */
-(CloudWatchDescribeAlarmsResponse *)describeAlarms:(CloudWatchDescribeAlarmsRequest *)describeAlarmsRequest;


/**
 * <p>
 * Retrieves all alarms for a single metric. Specify a statistic, period, or unit to filter the set of alarms further.
 * </p>
 *
 * @param describeAlarmsForMetricRequest Container for the necessary parameters to execute the DescribeAlarmsForMetric
 *           service method on AmazonCloudWatch.
 *
 * @return The response from the DescribeAlarmsForMetric service method, as returned by AmazonCloudWatch.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchDescribeAlarmsForMetricRequest
 * @see CloudWatchDescribeAlarmsForMetricResponse
 */
-(CloudWatchDescribeAlarmsForMetricResponse *)describeAlarmsForMetric:(CloudWatchDescribeAlarmsForMetricRequest *)describeAlarmsForMetricRequest;


/**
 * <p>
 * Retrieves history for the specified alarm. Filter alarms by date range or item type. If an alarm name is not specified,
 * Amazon CloudWatch returns histories for all of the owner's alarms.
 * </p>
 * <p>
 * <b>NOTE:</b> Amazon CloudWatch retains the history of an alarm for two weeks, whether or not you delete the alarm.
 * </p>
 *
 * @param describeAlarmHistoryRequest Container for the necessary parameters to execute the DescribeAlarmHistory service
 *           method on AmazonCloudWatch.
 *
 * @return The response from the DescribeAlarmHistory service method, as returned by AmazonCloudWatch.
 *
 * @exception CloudWatchInvalidNextTokenException For more information see <CloudWatchInvalidNextTokenException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchDescribeAlarmHistoryRequest
 * @see CloudWatchDescribeAlarmHistoryResponse
 */
-(CloudWatchDescribeAlarmHistoryResponse *)describeAlarmHistory:(CloudWatchDescribeAlarmHistoryRequest *)describeAlarmHistoryRequest;


/**
 * <p>
 * Enables actions for the specified alarms.
 * </p>
 *
 * @param enableAlarmActionsRequest Container for the necessary parameters to execute the EnableAlarmActions service method
 *           on AmazonCloudWatch.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchEnableAlarmActionsRequest
 * @see CloudWatchEnableAlarmActionsResponse
 */
-(CloudWatchEnableAlarmActionsResponse *)enableAlarmActions:(CloudWatchEnableAlarmActionsRequest *)enableAlarmActionsRequest;


/**
 * <p>
 * Deletes all specified alarms. In the event of an error, no alarms are deleted.
 * </p>
 *
 * @param deleteAlarmsRequest Container for the necessary parameters to execute the DeleteAlarms service method on
 *           AmazonCloudWatch.
 *
 * @exception CloudWatchResourceNotFoundException For more information see <CloudWatchResourceNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchDeleteAlarmsRequest
 * @see CloudWatchDeleteAlarmsResponse
 */
-(CloudWatchDeleteAlarmsResponse *)deleteAlarms:(CloudWatchDeleteAlarmsRequest *)deleteAlarmsRequest;


/**
 * <p>
 * Temporarily sets the state of an alarm. When the updated StateValue differs from the previous value, the action
 * configured for the appropriate state is invoked. This is not a permanent change. The next periodic alarm check (in about
 * a minute) will set the alarm to its actual state.
 * </p>
 *
 * @param setAlarmStateRequest Container for the necessary parameters to execute the SetAlarmState service method on
 *           AmazonCloudWatch.
 *
 * @exception CloudWatchResourceNotFoundException For more information see <CloudWatchResourceNotFoundException>
 * @exception CloudWatchInvalidFormatException For more information see <CloudWatchInvalidFormatException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonCloudWatch indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see CloudWatchSetAlarmStateRequest
 * @see CloudWatchSetAlarmStateResponse
 */
-(CloudWatchSetAlarmStateResponse *)setAlarmState:(CloudWatchSetAlarmStateRequest *)setAlarmStateRequest;



@end

