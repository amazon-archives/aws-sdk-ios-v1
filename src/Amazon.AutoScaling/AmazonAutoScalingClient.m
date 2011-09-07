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

#import "AmazonAutoScalingClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonAutoScalingClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = @"https://autoscaling.amazonaws.com";
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = @"https://autoscaling.amazonaws.com";
    }
    return self;
}

-(AutoScalingPutScheduledUpdateGroupActionResponse *)putScheduledUpdateGroupAction:(AutoScalingPutScheduledUpdateGroupActionRequest *)putScheduledUpdateGroupActionRequest
{
    AmazonServiceRequest *request = [AutoScalingPutScheduledUpdateGroupActionRequestMarshaller createRequest:putScheduledUpdateGroupActionRequest];

    return (AutoScalingPutScheduledUpdateGroupActionResponse *)[self invoke:request rawRequest:putScheduledUpdateGroupActionRequest unmarshallerDelegate:[AutoScalingPutScheduledUpdateGroupActionResponseUnmarshaller class]];
}

-(AutoScalingSetDesiredCapacityResponse *)setDesiredCapacity:(AutoScalingSetDesiredCapacityRequest *)setDesiredCapacityRequest
{
    AmazonServiceRequest *request = [AutoScalingSetDesiredCapacityRequestMarshaller createRequest:setDesiredCapacityRequest];

    return (AutoScalingSetDesiredCapacityResponse *)[self invoke:request rawRequest:setDesiredCapacityRequest unmarshallerDelegate:[AutoScalingSetDesiredCapacityResponseUnmarshaller class]];
}

-(AutoScalingDeletePolicyResponse *)deletePolicy:(AutoScalingDeletePolicyRequest *)deletePolicyRequest
{
    AmazonServiceRequest *request = [AutoScalingDeletePolicyRequestMarshaller createRequest:deletePolicyRequest];

    return (AutoScalingDeletePolicyResponse *)[self invoke:request rawRequest:deletePolicyRequest unmarshallerDelegate:[AutoScalingDeletePolicyResponseUnmarshaller class]];
}

-(AutoScalingDeleteScheduledActionResponse *)deleteScheduledAction:(AutoScalingDeleteScheduledActionRequest *)deleteScheduledActionRequest
{
    AmazonServiceRequest *request = [AutoScalingDeleteScheduledActionRequestMarshaller createRequest:deleteScheduledActionRequest];

    return (AutoScalingDeleteScheduledActionResponse *)[self invoke:request rawRequest:deleteScheduledActionRequest unmarshallerDelegate:[AutoScalingDeleteScheduledActionResponseUnmarshaller class]];
}

-(AutoScalingDescribeLaunchConfigurationsResponse *)describeLaunchConfigurations:(AutoScalingDescribeLaunchConfigurationsRequest *)describeLaunchConfigurationsRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeLaunchConfigurationsRequestMarshaller createRequest:describeLaunchConfigurationsRequest];

    return (AutoScalingDescribeLaunchConfigurationsResponse *)[self invoke:request rawRequest:describeLaunchConfigurationsRequest unmarshallerDelegate:[AutoScalingDescribeLaunchConfigurationsResponseUnmarshaller class]];
}

-(AutoScalingDescribeScalingProcessTypesResponse *)describeScalingProcessTypes:(AutoScalingDescribeScalingProcessTypesRequest *)describeScalingProcessTypesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeScalingProcessTypesRequestMarshaller createRequest:describeScalingProcessTypesRequest];

    return (AutoScalingDescribeScalingProcessTypesResponse *)[self invoke:request rawRequest:describeScalingProcessTypesRequest unmarshallerDelegate:[AutoScalingDescribeScalingProcessTypesResponseUnmarshaller class]];
}

-(AutoScalingDescribeAutoScalingGroupsResponse *)describeAutoScalingGroups:(AutoScalingDescribeAutoScalingGroupsRequest *)describeAutoScalingGroupsRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeAutoScalingGroupsRequestMarshaller createRequest:describeAutoScalingGroupsRequest];

    return (AutoScalingDescribeAutoScalingGroupsResponse *)[self invoke:request rawRequest:describeAutoScalingGroupsRequest unmarshallerDelegate:[AutoScalingDescribeAutoScalingGroupsResponseUnmarshaller class]];
}

-(AutoScalingEnableMetricsCollectionResponse *)enableMetricsCollection:(AutoScalingEnableMetricsCollectionRequest *)enableMetricsCollectionRequest
{
    AmazonServiceRequest *request = [AutoScalingEnableMetricsCollectionRequestMarshaller createRequest:enableMetricsCollectionRequest];

    return (AutoScalingEnableMetricsCollectionResponse *)[self invoke:request rawRequest:enableMetricsCollectionRequest unmarshallerDelegate:[AutoScalingEnableMetricsCollectionResponseUnmarshaller class]];
}

-(AutoScalingTerminateInstanceInAutoScalingGroupResponse *)terminateInstanceInAutoScalingGroup:(AutoScalingTerminateInstanceInAutoScalingGroupRequest *)terminateInstanceInAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingTerminateInstanceInAutoScalingGroupRequestMarshaller createRequest:terminateInstanceInAutoScalingGroupRequest];

    return (AutoScalingTerminateInstanceInAutoScalingGroupResponse *)[self invoke:request rawRequest:terminateInstanceInAutoScalingGroupRequest unmarshallerDelegate:[AutoScalingTerminateInstanceInAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingDescribeScalingActivitiesResponse *)describeScalingActivities:(AutoScalingDescribeScalingActivitiesRequest *)describeScalingActivitiesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeScalingActivitiesRequestMarshaller createRequest:describeScalingActivitiesRequest];

    return (AutoScalingDescribeScalingActivitiesResponse *)[self invoke:request rawRequest:describeScalingActivitiesRequest unmarshallerDelegate:[AutoScalingDescribeScalingActivitiesResponseUnmarshaller class]];
}

-(AutoScalingExecutePolicyResponse *)executePolicy:(AutoScalingExecutePolicyRequest *)executePolicyRequest
{
    AmazonServiceRequest *request = [AutoScalingExecutePolicyRequestMarshaller createRequest:executePolicyRequest];

    return (AutoScalingExecutePolicyResponse *)[self invoke:request rawRequest:executePolicyRequest unmarshallerDelegate:[AutoScalingExecutePolicyResponseUnmarshaller class]];
}

-(AutoScalingDescribeMetricCollectionTypesResponse *)describeMetricCollectionTypes:(AutoScalingDescribeMetricCollectionTypesRequest *)describeMetricCollectionTypesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeMetricCollectionTypesRequestMarshaller createRequest:describeMetricCollectionTypesRequest];

    return (AutoScalingDescribeMetricCollectionTypesResponse *)[self invoke:request rawRequest:describeMetricCollectionTypesRequest unmarshallerDelegate:[AutoScalingDescribeMetricCollectionTypesResponseUnmarshaller class]];
}

-(AutoScalingDescribePoliciesResponse *)describePolicies:(AutoScalingDescribePoliciesRequest *)describePoliciesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribePoliciesRequestMarshaller createRequest:describePoliciesRequest];

    return (AutoScalingDescribePoliciesResponse *)[self invoke:request rawRequest:describePoliciesRequest unmarshallerDelegate:[AutoScalingDescribePoliciesResponseUnmarshaller class]];
}

-(AutoScalingDescribeAdjustmentTypesResponse *)describeAdjustmentTypes:(AutoScalingDescribeAdjustmentTypesRequest *)describeAdjustmentTypesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeAdjustmentTypesRequestMarshaller createRequest:describeAdjustmentTypesRequest];

    return (AutoScalingDescribeAdjustmentTypesResponse *)[self invoke:request rawRequest:describeAdjustmentTypesRequest unmarshallerDelegate:[AutoScalingDescribeAdjustmentTypesResponseUnmarshaller class]];
}

-(AutoScalingDeleteAutoScalingGroupResponse *)deleteAutoScalingGroup:(AutoScalingDeleteAutoScalingGroupRequest *)deleteAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingDeleteAutoScalingGroupRequestMarshaller createRequest:deleteAutoScalingGroupRequest];

    return (AutoScalingDeleteAutoScalingGroupResponse *)[self invoke:request rawRequest:deleteAutoScalingGroupRequest unmarshallerDelegate:[AutoScalingDeleteAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingCreateAutoScalingGroupResponse *)createAutoScalingGroup:(AutoScalingCreateAutoScalingGroupRequest *)createAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingCreateAutoScalingGroupRequestMarshaller createRequest:createAutoScalingGroupRequest];

    return (AutoScalingCreateAutoScalingGroupResponse *)[self invoke:request rawRequest:createAutoScalingGroupRequest unmarshallerDelegate:[AutoScalingCreateAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingDescribeAutoScalingInstancesResponse *)describeAutoScalingInstances:(AutoScalingDescribeAutoScalingInstancesRequest *)describeAutoScalingInstancesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeAutoScalingInstancesRequestMarshaller createRequest:describeAutoScalingInstancesRequest];

    return (AutoScalingDescribeAutoScalingInstancesResponse *)[self invoke:request rawRequest:describeAutoScalingInstancesRequest unmarshallerDelegate:[AutoScalingDescribeAutoScalingInstancesResponseUnmarshaller class]];
}

-(AutoScalingDeleteLaunchConfigurationResponse *)deleteLaunchConfiguration:(AutoScalingDeleteLaunchConfigurationRequest *)deleteLaunchConfigurationRequest
{
    AmazonServiceRequest *request = [AutoScalingDeleteLaunchConfigurationRequestMarshaller createRequest:deleteLaunchConfigurationRequest];

    return (AutoScalingDeleteLaunchConfigurationResponse *)[self invoke:request rawRequest:deleteLaunchConfigurationRequest unmarshallerDelegate:[AutoScalingDeleteLaunchConfigurationResponseUnmarshaller class]];
}

-(AutoScalingPutScalingPolicyResponse *)putScalingPolicy:(AutoScalingPutScalingPolicyRequest *)putScalingPolicyRequest
{
    AmazonServiceRequest *request = [AutoScalingPutScalingPolicyRequestMarshaller createRequest:putScalingPolicyRequest];

    return (AutoScalingPutScalingPolicyResponse *)[self invoke:request rawRequest:putScalingPolicyRequest unmarshallerDelegate:[AutoScalingPutScalingPolicyResponseUnmarshaller class]];
}

-(AutoScalingSetInstanceHealthResponse *)setInstanceHealth:(AutoScalingSetInstanceHealthRequest *)setInstanceHealthRequest
{
    AmazonServiceRequest *request = [AutoScalingSetInstanceHealthRequestMarshaller createRequest:setInstanceHealthRequest];

    return (AutoScalingSetInstanceHealthResponse *)[self invoke:request rawRequest:setInstanceHealthRequest unmarshallerDelegate:[AutoScalingSetInstanceHealthResponseUnmarshaller class]];
}

-(AutoScalingUpdateAutoScalingGroupResponse *)updateAutoScalingGroup:(AutoScalingUpdateAutoScalingGroupRequest *)updateAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingUpdateAutoScalingGroupRequestMarshaller createRequest:updateAutoScalingGroupRequest];

    return (AutoScalingUpdateAutoScalingGroupResponse *)[self invoke:request rawRequest:updateAutoScalingGroupRequest unmarshallerDelegate:[AutoScalingUpdateAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingDescribeScheduledActionsResponse *)describeScheduledActions:(AutoScalingDescribeScheduledActionsRequest *)describeScheduledActionsRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeScheduledActionsRequestMarshaller createRequest:describeScheduledActionsRequest];

    return (AutoScalingDescribeScheduledActionsResponse *)[self invoke:request rawRequest:describeScheduledActionsRequest unmarshallerDelegate:[AutoScalingDescribeScheduledActionsResponseUnmarshaller class]];
}

-(AutoScalingSuspendProcessesResponse *)suspendProcesses:(AutoScalingSuspendProcessesRequest *)suspendProcessesRequest
{
    AmazonServiceRequest *request = [AutoScalingSuspendProcessesRequestMarshaller createRequest:suspendProcessesRequest];

    return (AutoScalingSuspendProcessesResponse *)[self invoke:request rawRequest:suspendProcessesRequest unmarshallerDelegate:[AutoScalingSuspendProcessesResponseUnmarshaller class]];
}

-(AutoScalingResumeProcessesResponse *)resumeProcesses:(AutoScalingResumeProcessesRequest *)resumeProcessesRequest
{
    AmazonServiceRequest *request = [AutoScalingResumeProcessesRequestMarshaller createRequest:resumeProcessesRequest];

    return (AutoScalingResumeProcessesResponse *)[self invoke:request rawRequest:resumeProcessesRequest unmarshallerDelegate:[AutoScalingResumeProcessesResponseUnmarshaller class]];
}

-(AutoScalingCreateLaunchConfigurationResponse *)createLaunchConfiguration:(AutoScalingCreateLaunchConfigurationRequest *)createLaunchConfigurationRequest
{
    AmazonServiceRequest *request = [AutoScalingCreateLaunchConfigurationRequestMarshaller createRequest:createLaunchConfigurationRequest];

    return (AutoScalingCreateLaunchConfigurationResponse *)[self invoke:request rawRequest:createLaunchConfigurationRequest unmarshallerDelegate:[AutoScalingCreateLaunchConfigurationResponseUnmarshaller class]];
}

-(AutoScalingDisableMetricsCollectionResponse *)disableMetricsCollection:(AutoScalingDisableMetricsCollectionRequest *)disableMetricsCollectionRequest
{
    AmazonServiceRequest *request = [AutoScalingDisableMetricsCollectionRequestMarshaller createRequest:disableMetricsCollectionRequest];

    return (AutoScalingDisableMetricsCollectionResponse *)[self invoke:request rawRequest:disableMetricsCollectionRequest unmarshallerDelegate:[AutoScalingDisableMetricsCollectionResponseUnmarshaller class]];
}



@end

