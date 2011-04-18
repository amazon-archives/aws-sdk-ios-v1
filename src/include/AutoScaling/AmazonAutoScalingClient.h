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
#import "AutoScalingPutScheduledUpdateGroupActionResponse.h"
#import "AutoScalingPutScheduledUpdateGroupActionResponseUnmarshaller.h"
#import "AutoScalingPutScheduledUpdateGroupActionRequest.h"
#import "AutoScalingPutScheduledUpdateGroupActionRequestMarshaller.h"
#import "AutoScalingSetDesiredCapacityResponse.h"
#import "AutoScalingSetDesiredCapacityResponseUnmarshaller.h"
#import "AutoScalingSetDesiredCapacityRequest.h"
#import "AutoScalingSetDesiredCapacityRequestMarshaller.h"
#import "AutoScalingDeletePolicyResponse.h"
#import "AutoScalingDeletePolicyResponseUnmarshaller.h"
#import "AutoScalingDeletePolicyRequest.h"
#import "AutoScalingDeletePolicyRequestMarshaller.h"
#import "AutoScalingDeleteScheduledActionResponse.h"
#import "AutoScalingDeleteScheduledActionResponseUnmarshaller.h"
#import "AutoScalingDeleteScheduledActionRequest.h"
#import "AutoScalingDeleteScheduledActionRequestMarshaller.h"
#import "AutoScalingDescribeLaunchConfigurationsResponse.h"
#import "AutoScalingDescribeLaunchConfigurationsResponseUnmarshaller.h"
#import "AutoScalingDescribeLaunchConfigurationsRequest.h"
#import "AutoScalingDescribeLaunchConfigurationsRequestMarshaller.h"
#import "AutoScalingDescribeScalingProcessTypesResponse.h"
#import "AutoScalingDescribeScalingProcessTypesResponseUnmarshaller.h"
#import "AutoScalingDescribeScalingProcessTypesRequest.h"
#import "AutoScalingDescribeScalingProcessTypesRequestMarshaller.h"
#import "AutoScalingDescribeAutoScalingGroupsResponse.h"
#import "AutoScalingDescribeAutoScalingGroupsResponseUnmarshaller.h"
#import "AutoScalingDescribeAutoScalingGroupsRequest.h"
#import "AutoScalingDescribeAutoScalingGroupsRequestMarshaller.h"
#import "AutoScalingEnableMetricsCollectionResponse.h"
#import "AutoScalingEnableMetricsCollectionResponseUnmarshaller.h"
#import "AutoScalingEnableMetricsCollectionRequest.h"
#import "AutoScalingEnableMetricsCollectionRequestMarshaller.h"
#import "AutoScalingTerminateInstanceInAutoScalingGroupResponse.h"
#import "AutoScalingTerminateInstanceInAutoScalingGroupResponseUnmarshaller.h"
#import "AutoScalingTerminateInstanceInAutoScalingGroupRequest.h"
#import "AutoScalingTerminateInstanceInAutoScalingGroupRequestMarshaller.h"
#import "AutoScalingDescribeScalingActivitiesResponse.h"
#import "AutoScalingDescribeScalingActivitiesResponseUnmarshaller.h"
#import "AutoScalingDescribeScalingActivitiesRequest.h"
#import "AutoScalingDescribeScalingActivitiesRequestMarshaller.h"
#import "AutoScalingExecutePolicyResponse.h"
#import "AutoScalingExecutePolicyResponseUnmarshaller.h"
#import "AutoScalingExecutePolicyRequest.h"
#import "AutoScalingExecutePolicyRequestMarshaller.h"
#import "AutoScalingDescribeMetricCollectionTypesResponse.h"
#import "AutoScalingDescribeMetricCollectionTypesResponseUnmarshaller.h"
#import "AutoScalingDescribeMetricCollectionTypesRequest.h"
#import "AutoScalingDescribeMetricCollectionTypesRequestMarshaller.h"
#import "AutoScalingDescribePoliciesResponse.h"
#import "AutoScalingDescribePoliciesResponseUnmarshaller.h"
#import "AutoScalingDescribePoliciesRequest.h"
#import "AutoScalingDescribePoliciesRequestMarshaller.h"
#import "AutoScalingDescribeAdjustmentTypesResponse.h"
#import "AutoScalingDescribeAdjustmentTypesResponseUnmarshaller.h"
#import "AutoScalingDescribeAdjustmentTypesRequest.h"
#import "AutoScalingDescribeAdjustmentTypesRequestMarshaller.h"
#import "AutoScalingDeleteAutoScalingGroupResponse.h"
#import "AutoScalingDeleteAutoScalingGroupResponseUnmarshaller.h"
#import "AutoScalingDeleteAutoScalingGroupRequest.h"
#import "AutoScalingDeleteAutoScalingGroupRequestMarshaller.h"
#import "AutoScalingCreateAutoScalingGroupResponse.h"
#import "AutoScalingCreateAutoScalingGroupResponseUnmarshaller.h"
#import "AutoScalingCreateAutoScalingGroupRequest.h"
#import "AutoScalingCreateAutoScalingGroupRequestMarshaller.h"
#import "AutoScalingDescribeAutoScalingInstancesResponse.h"
#import "AutoScalingDescribeAutoScalingInstancesResponseUnmarshaller.h"
#import "AutoScalingDescribeAutoScalingInstancesRequest.h"
#import "AutoScalingDescribeAutoScalingInstancesRequestMarshaller.h"
#import "AutoScalingDeleteLaunchConfigurationResponse.h"
#import "AutoScalingDeleteLaunchConfigurationResponseUnmarshaller.h"
#import "AutoScalingDeleteLaunchConfigurationRequest.h"
#import "AutoScalingDeleteLaunchConfigurationRequestMarshaller.h"
#import "AutoScalingPutScalingPolicyResponse.h"
#import "AutoScalingPutScalingPolicyResponseUnmarshaller.h"
#import "AutoScalingPutScalingPolicyRequest.h"
#import "AutoScalingPutScalingPolicyRequestMarshaller.h"
#import "AutoScalingSetInstanceHealthResponse.h"
#import "AutoScalingSetInstanceHealthResponseUnmarshaller.h"
#import "AutoScalingSetInstanceHealthRequest.h"
#import "AutoScalingSetInstanceHealthRequestMarshaller.h"
#import "AutoScalingUpdateAutoScalingGroupResponse.h"
#import "AutoScalingUpdateAutoScalingGroupResponseUnmarshaller.h"
#import "AutoScalingUpdateAutoScalingGroupRequest.h"
#import "AutoScalingUpdateAutoScalingGroupRequestMarshaller.h"
#import "AutoScalingDescribeScheduledActionsResponse.h"
#import "AutoScalingDescribeScheduledActionsResponseUnmarshaller.h"
#import "AutoScalingDescribeScheduledActionsRequest.h"
#import "AutoScalingDescribeScheduledActionsRequestMarshaller.h"
#import "AutoScalingSuspendProcessesResponse.h"
#import "AutoScalingSuspendProcessesResponseUnmarshaller.h"
#import "AutoScalingSuspendProcessesRequest.h"
#import "AutoScalingSuspendProcessesRequestMarshaller.h"
#import "AutoScalingResumeProcessesResponse.h"
#import "AutoScalingResumeProcessesResponseUnmarshaller.h"
#import "AutoScalingResumeProcessesRequest.h"
#import "AutoScalingResumeProcessesRequestMarshaller.h"
#import "AutoScalingCreateLaunchConfigurationResponse.h"
#import "AutoScalingCreateLaunchConfigurationResponseUnmarshaller.h"
#import "AutoScalingCreateLaunchConfigurationRequest.h"
#import "AutoScalingCreateLaunchConfigurationRequestMarshaller.h"
#import "AutoScalingDisableMetricsCollectionResponse.h"
#import "AutoScalingDisableMetricsCollectionResponseUnmarshaller.h"
#import "AutoScalingDisableMetricsCollectionRequest.h"
#import "AutoScalingDisableMetricsCollectionRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"

/** \defgroup AutoScaling Auto Scaling */

/** <summary>
 * Interface for accessing AmazonAutoScaling.
 *
 *  Auto Scaling <p>
 * Auto Scaling is a web service designed to automatically launch or
 * terminate EC2 instances based on user-defined policies, schedules, and
 * health checks. Auto Scaling responds automatically to changing
 * conditions. All you need to do is specify how it should respond to
 * those changes.
 * </p>
 * <p>
 * Auto Scaling groups can work across multiple Availability Zones -
 * distinct physical locations for the hosted Amazon EC2 instances - so
 * that if an Availability Zone becomes unavailable, Auto Scaling will
 * automatically redistribute applications to a different Availability
 * Zone.
 * </p>
 * <p>
 * Every API call returns a response meta data object that contains a
 * request identifier. Successful requests return an HTTP 200 status
 * code. Unsuccessful requests return an error object and an HTTP status
 * code of 400 or 500.
 * </p>
 * <p>
 * The current WSDL is available at:
 * </p>
 * <p>
 * <a
 * ef="http://autoscaling.amazonaws.com/doc/2010-08-01/AutoScaling.wsdl">
 * http://autoscaling.amazonaws.com/doc/2010-08-01/AutoScaling.wsdl </a>
 * </p>
 * <p>
 * <b>Endpoints</b>
 * </p>
 * <p>
 * For information about this product's regions and endpoints, go to <a
 * //docs.amazonwebservices.com/general/latest/gr/index.html?rande.html">
 * Regions and Endpoints </a> in the Amazon Web Services General
 * Reference.
 * </p>
 * </summary>
 *
 * \ingroup AutoScaling
 */
@interface AmazonAutoScalingClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Creates a scheduled scaling action for a Auto Scaling group. If you
 * leave a parameter unspecified, the corresponding value remains
 * unchanged in the affected Auto Scaling group.
 * </p>
 *
 * @param putScheduledUpdateGroupActionRequest Container for the
 *           necessary parameters to execute the PutScheduledUpdateGroupAction
 *           service method on AmazonAutoScaling.
 *
 * @throws AutoScalingAlreadyExistsException
 * @throws AutoScalingLimitExceededException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingPutScheduledUpdateGroupActionResponse *)putScheduledUpdateGroupAction:(AutoScalingPutScheduledUpdateGroupActionRequest *)putScheduledUpdateGroupActionRequest;


/**
 * <p>
 * Adjusts the desired size of the AutoScalingGroup by initiating
 * scaling activities. When reducing the size of the group, it is not
 * possible to define which EC2 instances will be terminated. This
 * applies to any auto-scaling decisions that might result in terminating
 * instances.
 * </p>
 * <p>
 * There are two common use cases for <code>SetDesiredCapacity</code> :
 * one for users of the Auto Scaling triggering system, and
 * another for developers who write their own triggering systems. Both
 * use cases relate to the concept of cooldown.
 * </p>
 * <p>
 * In the first case, if you use the Auto Scaling triggering system,
 * <code>SetDesiredCapacity</code> changes the size of your Auto Scaling
 * group without regard to the cooldown period. This could be useful, for
 * example, if Auto Scaling did something unexpected for some reason. If
 * your cooldown period is 10 minutes, Auto Scaling would normally reject
 * requests to change the size of the group for that entire 10 minute
 * period. The <code>SetDesiredCapacity</code> command allows you to
 * circumvent this restriction and change the size of the group before
 * the end of the cooldown period.
 * </p>
 * <p>
 * In the second case, if you write your own triggering system, you can
 * use <code>SetDesiredCapacity</code> to control the size of your Auto
 * Scaling group. If you want the same cooldown functionality that Auto
 * Scaling offers, you can configure <code>SetDesiredCapacity</code> to
 * honor cooldown by setting the <code>HonorCooldown</code> parameter to
 * <code>true</code> .
 *
 * </p>
 *
 * @param setDesiredCapacityRequest Container for the necessary
 *           parameters to execute the SetDesiredCapacity service method on
 *           AmazonAutoScaling.
 *
 * @throws AutoScalingScalingActivityInProgressException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingSetDesiredCapacityResponse *)setDesiredCapacity:(AutoScalingSetDesiredCapacityRequest *)setDesiredCapacityRequest;


/**
 * <p>
 * Deletes a policy created by PutScalingPolicy
 * </p>
 *
 * @param deletePolicyRequest Container for the necessary parameters to
 *           execute the DeletePolicy service method on AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDeletePolicyResponse *)deletePolicy:(AutoScalingDeletePolicyRequest *)deletePolicyRequest;


/**
 * <p>
 * Deletes a scheduled action previously created using the
 * PutScheduledUpdateGroupAction.
 * </p>
 *
 * @param deleteScheduledActionRequest Container for the necessary
 *           parameters to execute the DeleteScheduledAction service method on
 *           AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDeleteScheduledActionResponse *)deleteScheduledAction:(AutoScalingDeleteScheduledActionRequest *)deleteScheduledActionRequest;


/**
 * <p>
 * Returns a full description of the launch configurations given the
 * specified names.
 * </p>
 * <p>
 * If no names are specified, then the full details of all launch
 * configurations are returned.
 * </p>
 *
 * @param describeLaunchConfigurationsRequest Container for the necessary
 *           parameters to execute the DescribeLaunchConfigurations service method
 *           on AmazonAutoScaling.
 *
 * @return The response from the DescribeLaunchConfigurations service
 *         method, as returned by AmazonAutoScaling.
 *
 * @throws AutoScalingInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeLaunchConfigurationsResponse *)describeLaunchConfigurations:(AutoScalingDescribeLaunchConfigurationsRequest *)describeLaunchConfigurationsRequest;


/**
 * <p>
 * Returns scaling process types for use in the ResumeProcesses and
 * SuspendProcesses actions.
 * </p>
 *
 * @param describeScalingProcessTypesRequest Container for the necessary
 *           parameters to execute the DescribeScalingProcessTypes service method
 *           on AmazonAutoScaling.
 *
 * @return The response from the DescribeScalingProcessTypes service
 *         method, as returned by AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeScalingProcessTypesResponse *)describeScalingProcessTypes:(AutoScalingDescribeScalingProcessTypesRequest *)describeScalingProcessTypesRequest;


/**
 * <p>
 * Returns a full description of each Auto Scaling group in the given
 * list. This includes all Amazon EC2 instances that are members of the
 * group. If a list of names is not provided, the service returns the
 * full details of all Auto Scaling groups.
 * </p>
 * <p>
 * This action supports pagination by returning a token if there are
 * more pages to retrieve. To get the next page, call this action again
 * with the returned token as the NextToken parameter.
 * </p>
 *
 * @param describeAutoScalingGroupsRequest Container for the necessary
 *           parameters to execute the DescribeAutoScalingGroups service method on
 *           AmazonAutoScaling.
 *
 * @return The response from the DescribeAutoScalingGroups service
 *         method, as returned by AmazonAutoScaling.
 *
 * @throws AutoScalingInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeAutoScalingGroupsResponse *)describeAutoScalingGroups:(AutoScalingDescribeAutoScalingGroupsRequest *)describeAutoScalingGroupsRequest;


/**
 * <p>
 * Enables monitoring of group metrics for the Auto Scaling group
 * specified in AutoScalingGroupName. You can specify the list of enabled
 * metrics with the Metrics parameter.
 * </p>
 * <p>
 * Auto scaling metrics collection can be turned on only if the
 * <code>InstanceMonitoring.Enabled</code> flag, in the Auto Scaling
 * group's launch configuration, is set to <code>true</code> .
 *
 * </p>
 *
 * @param enableMetricsCollectionRequest Container for the necessary
 *           parameters to execute the EnableMetricsCollection service method on
 *           AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingEnableMetricsCollectionResponse *)enableMetricsCollection:(AutoScalingEnableMetricsCollectionRequest *)enableMetricsCollectionRequest;


/**
 * <p>
 * Terminates the specified instance. Optionally, the desired group size
 * can be adjusted.
 * </p>
 * <p>
 * <b>NOTE:</b> This call simply registers a termination request. The
 * termination of the instance cannot happen immediately.
 * </p>
 *
 * @param terminateInstanceInAutoScalingGroupRequest Container for the
 *           necessary parameters to execute the
 *           TerminateInstanceInAutoScalingGroup service method on
 *           AmazonAutoScaling.
 *
 * @return The response from the TerminateInstanceInAutoScalingGroup
 *         service method, as returned by AmazonAutoScaling.
 *
 * @throws AutoScalingScalingActivityInProgressException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingTerminateInstanceInAutoScalingGroupResponse *)terminateInstanceInAutoScalingGroup:(AutoScalingTerminateInstanceInAutoScalingGroupRequest *)terminateInstanceInAutoScalingGroupRequest;


/**
 * <p>
 * Returns the scaling activities for the specified Auto Scaling group.
 * </p>
 * <p>
 * If the specified <i>ActivityIds</i> list is empty, all the activities
 * from the past six weeks are returned. Activities are sorted by
 * completion time. Activities still in progress appear first on the
 * list.
 * </p>
 * <p>
 * This action supports pagination. If the response includes a token,
 * there are more records available. To get the additional records,
 * repeat the request with the response token as the NextToken parameter.
 * </p>
 *
 * @param describeScalingActivitiesRequest Container for the necessary
 *           parameters to execute the DescribeScalingActivities service method on
 *           AmazonAutoScaling.
 *
 * @return The response from the DescribeScalingActivities service
 *         method, as returned by AmazonAutoScaling.
 *
 * @throws AutoScalingInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeScalingActivitiesResponse *)describeScalingActivities:(AutoScalingDescribeScalingActivitiesRequest *)describeScalingActivitiesRequest;


/**
 * <p>
 * Runs the policy you create for your Auto Scaling group in
 * PutScalingPolicy.
 * </p>
 *
 * @param executePolicyRequest Container for the necessary parameters to
 *           execute the ExecutePolicy service method on AmazonAutoScaling.
 *
 * @throws AutoScalingScalingActivityInProgressException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingExecutePolicyResponse *)executePolicy:(AutoScalingExecutePolicyRequest *)executePolicyRequest;


/**
 * <p>
 * Returns a list of metrics and a corresponding list of granularities
 * for each metric.
 * </p>
 *
 * @param describeMetricCollectionTypesRequest Container for the
 *           necessary parameters to execute the DescribeMetricCollectionTypes
 *           service method on AmazonAutoScaling.
 *
 * @return The response from the DescribeMetricCollectionTypes service
 *         method, as returned by AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeMetricCollectionTypesResponse *)describeMetricCollectionTypes:(AutoScalingDescribeMetricCollectionTypesRequest *)describeMetricCollectionTypesRequest;


/**
 * <p>
 * Returns descriptions of what each policy does. This action supports
 * pagination. If the response includes a token, there are more records
 * available. To get the additional records, repeat the request with the
 * response token as the NextToken parameter.
 * </p>
 *
 * @param describePoliciesRequest Container for the necessary parameters
 *           to execute the DescribePolicies service method on AmazonAutoScaling.
 *
 * @return The response from the DescribePolicies service method, as
 *         returned by AmazonAutoScaling.
 *
 * @throws AutoScalingInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribePoliciesResponse *)describePolicies:(AutoScalingDescribePoliciesRequest *)describePoliciesRequest;


/**
 * <p>
 * Returns policy adjustment types for use in the PutScalingPolicy
 * action.
 * </p>
 *
 * @param describeAdjustmentTypesRequest Container for the necessary
 *           parameters to execute the DescribeAdjustmentTypes service method on
 *           AmazonAutoScaling.
 *
 * @return The response from the DescribeAdjustmentTypes service method,
 *         as returned by AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeAdjustmentTypesResponse *)describeAdjustmentTypes:(AutoScalingDescribeAdjustmentTypesRequest *)describeAdjustmentTypesRequest;


/**
 * <p>
 * Deletes the specified auto scaling group if the group has no
 * instances and no scaling activities in progress.
 * </p>
 * <p>
 * <b>NOTE:</b> To remove all instances before calling
 * DeleteAutoScalingGroup, you can call UpdateAutoScalingGroup to set the
 * minimum and maximum size of the AutoScalingGroup to zero.
 * </p>
 *
 * @param deleteAutoScalingGroupRequest Container for the necessary
 *           parameters to execute the DeleteAutoScalingGroup service method on
 *           AmazonAutoScaling.
 *
 * @throws AutoScalingResourceInUseException
 * @throws AutoScalingScalingActivityInProgressException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDeleteAutoScalingGroupResponse *)deleteAutoScalingGroup:(AutoScalingDeleteAutoScalingGroupRequest *)deleteAutoScalingGroupRequest;


/**
 * <p>
 * Creates a new Auto Scaling group with the specified name. Once the
 * creation request is completed, the AutoScalingGroup is ready to be
 * used in other calls.
 * </p>
 * <p>
 * <b>NOTE:</b> The Auto Scaling group name must be unique within the
 * scope of your AWS account, and under the quota of Auto Scaling groups
 * allowed for your account.
 * </p>
 *
 * @param createAutoScalingGroupRequest Container for the necessary
 *           parameters to execute the CreateAutoScalingGroup service method on
 *           AmazonAutoScaling.
 *
 * @throws AutoScalingAlreadyExistsException
 * @throws AutoScalingLimitExceededException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingCreateAutoScalingGroupResponse *)createAutoScalingGroup:(AutoScalingCreateAutoScalingGroupRequest *)createAutoScalingGroupRequest;


/**
 * <p>
 * Returns a description of each Auto Scaling instance in the
 * InstanceIds list. If a list is not provided, the service returns the
 * full details of all instances up to a maximum of fifty.
 * </p>
 * <p>
 * This action supports pagination by returning a token if there are
 * more pages to retrieve. To get the next page, call this action again
 * with the returned token as the NextToken parameter.
 * </p>
 *
 * @param describeAutoScalingInstancesRequest Container for the necessary
 *           parameters to execute the DescribeAutoScalingInstances service method
 *           on AmazonAutoScaling.
 *
 * @return The response from the DescribeAutoScalingInstances service
 *         method, as returned by AmazonAutoScaling.
 *
 * @throws AutoScalingInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeAutoScalingInstancesResponse *)describeAutoScalingInstances:(AutoScalingDescribeAutoScalingInstancesRequest *)describeAutoScalingInstancesRequest;


/**
 * <p>
 * Deletes the specified LaunchConfiguration.
 * </p>
 * <p>
 * The specified launch configuration must not be attached to an Auto
 * Scaling group. Once this call completes, the launch configuration is
 * no longer available for use.
 * </p>
 *
 * @param deleteLaunchConfigurationRequest Container for the necessary
 *           parameters to execute the DeleteLaunchConfiguration service method on
 *           AmazonAutoScaling.
 *
 * @throws AutoScalingResourceInUseException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDeleteLaunchConfigurationResponse *)deleteLaunchConfiguration:(AutoScalingDeleteLaunchConfigurationRequest *)deleteLaunchConfigurationRequest;


/**
 * <p>
 * Creates or updates a policy for an Auto Scaling group. To update an
 * existing policy, use the existing policy name and set the parameter(s)
 * you want to change. Any existing parameter not changed in an update to
 * an existing policy is not changed in this update request.
 * </p>
 *
 * @param putScalingPolicyRequest Container for the necessary parameters
 *           to execute the PutScalingPolicy service method on AmazonAutoScaling.
 *
 * @return The response from the PutScalingPolicy service method, as
 *         returned by AmazonAutoScaling.
 *
 * @throws AutoScalingLimitExceededException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingPutScalingPolicyResponse *)putScalingPolicy:(AutoScalingPutScalingPolicyRequest *)putScalingPolicyRequest;


/**
 * <p>
 * Sets the health status of an instance.
 * </p>
 *
 * @param setInstanceHealthRequest Container for the necessary parameters
 *           to execute the SetInstanceHealth service method on AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingSetInstanceHealthResponse *)setInstanceHealth:(AutoScalingSetInstanceHealthRequest *)setInstanceHealthRequest;


/**
 * <p>
 * Updates the configuration for the specified AutoScalingGroup.
 * </p>
 * <p>
 * <b>NOTE:</b> To update an Auto Scaling group with a launch
 * configuration that has the InstanceMonitoring.enabled flag set to
 * false, you must first ensure that collection of group metrics is
 * disabled. Otherwise, calls to UpdateAutoScalingGroup will fail. If you
 * have previously enabled group metrics collection, you can disable
 * collection of all group metrics by calling DisableMetricsCollection.
 * </p>
 * <p>
 * The new settings are registered upon the completion of this call. Any
 * launch configuration settings take effect on any triggers after this
 * call returns. Triggers that are currently in progress aren't affected.
 * </p>
 * <p>
 * <b>NOTE:</b> If the new values are specified for the MinSize or
 * MaxSize parameters, then there will be an implicit call to
 * SetDesiredCapacity to set the group to the new MaxSize. All optional
 * parameters are left unchanged if not passed in the request.
 * </p>
 *
 * @param updateAutoScalingGroupRequest Container for the necessary
 *           parameters to execute the UpdateAutoScalingGroup service method on
 *           AmazonAutoScaling.
 *
 * @throws AutoScalingScalingActivityInProgressException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingUpdateAutoScalingGroupResponse *)updateAutoScalingGroup:(AutoScalingUpdateAutoScalingGroupRequest *)updateAutoScalingGroupRequest;


/**
 * <p>
 * Lists all the actions scheduled for your Auto Scaling group that
 * haven't been executed. To see a list of action already executed, see
 * the activity record returned in DescribeScalingActivities.
 * </p>
 *
 * @param describeScheduledActionsRequest Container for the necessary
 *           parameters to execute the DescribeScheduledActions service method on
 *           AmazonAutoScaling.
 *
 * @return The response from the DescribeScheduledActions service method,
 *         as returned by AmazonAutoScaling.
 *
 * @throws AutoScalingInvalidNextTokenException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDescribeScheduledActionsResponse *)describeScheduledActions:(AutoScalingDescribeScheduledActionsRequest *)describeScheduledActionsRequest;


/**
 * <p>
 * Suspends Auto Scaling processes for an Auto Scaling group. To suspend
 * specific process types, specify them by name with the
 * <code>ScalingProcesses.member.N</code> parameter. To suspend all
 * process types, omit the <code>ScalingProcesses.member.N</code>
 * parameter.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> Suspending either of the two primary process types,
 * Launch or Terminate, can prevent other process types from functioning
 * properly. For more information about processes and their dependencies,
 * see ProcessType.
 * </p>
 * <p>
 * To resume processes that have been suspended, use ResumeProcesses.
 * </p>
 *
 * @param suspendProcessesRequest Container for the necessary parameters
 *           to execute the SuspendProcesses service method on AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingSuspendProcessesResponse *)suspendProcesses:(AutoScalingSuspendProcessesRequest *)suspendProcessesRequest;


/**
 * <p>
 * Resumes Auto Scaling processes for an Auto Scaling group. For more
 * information, see SuspendProcesses and ProcessType.
 * </p>
 *
 * @param resumeProcessesRequest Container for the necessary parameters
 *           to execute the ResumeProcesses service method on AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingResumeProcessesResponse *)resumeProcesses:(AutoScalingResumeProcessesRequest *)resumeProcessesRequest;


/**
 * <p>
 * Creates a new launch configuration. Once created, the new launch
 * configuration is available for immediate use.
 * </p>
 * <p>
 * <b>NOTE:</b> The launch configuration name used must be unique, within
 * the scope of the client's AWS account, and the maximum limit of launch
 * configurations must not yet have been met, or else the call will fail.
 * </p>
 *
 * @param createLaunchConfigurationRequest Container for the necessary
 *           parameters to execute the CreateLaunchConfiguration service method on
 *           AmazonAutoScaling.
 *
 * @throws AutoScalingAlreadyExistsException
 * @throws AutoScalingLimitExceededException
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingCreateLaunchConfigurationResponse *)createLaunchConfiguration:(AutoScalingCreateLaunchConfigurationRequest *)createLaunchConfigurationRequest;


/**
 * <p>
 * Disables monitoring of group metrics for the Auto Scaling group
 * specified in AutoScalingGroupName. You can specify the list of
 * affected metrics with the Metrics parameter.
 * </p>
 *
 * @param disableMetricsCollectionRequest Container for the necessary
 *           parameters to execute the DisableMetricsCollection service method on
 *           AmazonAutoScaling.
 *
 *
 * @throws AmazonClientException
 *             If any internal errors are encountered inside the client while
 *             attempting to make the request or handle the response.  For example
 *             if a network connection is not available.
 * @throws AmazonServiceException
 *             If an error response is returned by AmazonAutoScaling indicating
 *             either a problem with the data in the request, or a server side issue.
 */
-(AutoScalingDisableMetricsCollectionResponse *)disableMetricsCollection:(AutoScalingDisableMetricsCollectionRequest *)disableMetricsCollectionRequest;



@end

