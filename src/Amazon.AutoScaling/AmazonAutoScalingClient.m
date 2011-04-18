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

-(AutoScalingPutScheduledUpdateGroupActionResponse *)putScheduledUpdateGroupAction:(AutoScalingPutScheduledUpdateGroupActionRequest *)putScheduledUpdateGroupActionRequest
{
    AmazonServiceRequest *request = [AutoScalingPutScheduledUpdateGroupActionRequestMarshaller createRequest:putScheduledUpdateGroupActionRequest];

    return (AutoScalingPutScheduledUpdateGroupActionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingPutScheduledUpdateGroupActionResponseUnmarshaller class]];
}

-(AutoScalingSetDesiredCapacityResponse *)setDesiredCapacity:(AutoScalingSetDesiredCapacityRequest *)setDesiredCapacityRequest
{
    AmazonServiceRequest *request = [AutoScalingSetDesiredCapacityRequestMarshaller createRequest:setDesiredCapacityRequest];

    return (AutoScalingSetDesiredCapacityResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingSetDesiredCapacityResponseUnmarshaller class]];
}

-(AutoScalingDeletePolicyResponse *)deletePolicy:(AutoScalingDeletePolicyRequest *)deletePolicyRequest
{
    AmazonServiceRequest *request = [AutoScalingDeletePolicyRequestMarshaller createRequest:deletePolicyRequest];

    return (AutoScalingDeletePolicyResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDeletePolicyResponseUnmarshaller class]];
}

-(AutoScalingDeleteScheduledActionResponse *)deleteScheduledAction:(AutoScalingDeleteScheduledActionRequest *)deleteScheduledActionRequest
{
    AmazonServiceRequest *request = [AutoScalingDeleteScheduledActionRequestMarshaller createRequest:deleteScheduledActionRequest];

    return (AutoScalingDeleteScheduledActionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDeleteScheduledActionResponseUnmarshaller class]];
}

-(AutoScalingDescribeLaunchConfigurationsResponse *)describeLaunchConfigurations:(AutoScalingDescribeLaunchConfigurationsRequest *)describeLaunchConfigurationsRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeLaunchConfigurationsRequestMarshaller createRequest:describeLaunchConfigurationsRequest];

    return (AutoScalingDescribeLaunchConfigurationsResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeLaunchConfigurationsResponseUnmarshaller class]];
}

-(AutoScalingDescribeScalingProcessTypesResponse *)describeScalingProcessTypes:(AutoScalingDescribeScalingProcessTypesRequest *)describeScalingProcessTypesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeScalingProcessTypesRequestMarshaller createRequest:describeScalingProcessTypesRequest];

    return (AutoScalingDescribeScalingProcessTypesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeScalingProcessTypesResponseUnmarshaller class]];
}

-(AutoScalingDescribeAutoScalingGroupsResponse *)describeAutoScalingGroups:(AutoScalingDescribeAutoScalingGroupsRequest *)describeAutoScalingGroupsRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeAutoScalingGroupsRequestMarshaller createRequest:describeAutoScalingGroupsRequest];

    return (AutoScalingDescribeAutoScalingGroupsResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeAutoScalingGroupsResponseUnmarshaller class]];
}

-(AutoScalingEnableMetricsCollectionResponse *)enableMetricsCollection:(AutoScalingEnableMetricsCollectionRequest *)enableMetricsCollectionRequest
{
    AmazonServiceRequest *request = [AutoScalingEnableMetricsCollectionRequestMarshaller createRequest:enableMetricsCollectionRequest];

    return (AutoScalingEnableMetricsCollectionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingEnableMetricsCollectionResponseUnmarshaller class]];
}

-(AutoScalingTerminateInstanceInAutoScalingGroupResponse *)terminateInstanceInAutoScalingGroup:(AutoScalingTerminateInstanceInAutoScalingGroupRequest *)terminateInstanceInAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingTerminateInstanceInAutoScalingGroupRequestMarshaller createRequest:terminateInstanceInAutoScalingGroupRequest];

    return (AutoScalingTerminateInstanceInAutoScalingGroupResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingTerminateInstanceInAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingDescribeScalingActivitiesResponse *)describeScalingActivities:(AutoScalingDescribeScalingActivitiesRequest *)describeScalingActivitiesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeScalingActivitiesRequestMarshaller createRequest:describeScalingActivitiesRequest];

    return (AutoScalingDescribeScalingActivitiesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeScalingActivitiesResponseUnmarshaller class]];
}

-(AutoScalingExecutePolicyResponse *)executePolicy:(AutoScalingExecutePolicyRequest *)executePolicyRequest
{
    AmazonServiceRequest *request = [AutoScalingExecutePolicyRequestMarshaller createRequest:executePolicyRequest];

    return (AutoScalingExecutePolicyResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingExecutePolicyResponseUnmarshaller class]];
}

-(AutoScalingDescribeMetricCollectionTypesResponse *)describeMetricCollectionTypes:(AutoScalingDescribeMetricCollectionTypesRequest *)describeMetricCollectionTypesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeMetricCollectionTypesRequestMarshaller createRequest:describeMetricCollectionTypesRequest];

    return (AutoScalingDescribeMetricCollectionTypesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeMetricCollectionTypesResponseUnmarshaller class]];
}

-(AutoScalingDescribePoliciesResponse *)describePolicies:(AutoScalingDescribePoliciesRequest *)describePoliciesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribePoliciesRequestMarshaller createRequest:describePoliciesRequest];

    return (AutoScalingDescribePoliciesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribePoliciesResponseUnmarshaller class]];
}

-(AutoScalingDescribeAdjustmentTypesResponse *)describeAdjustmentTypes:(AutoScalingDescribeAdjustmentTypesRequest *)describeAdjustmentTypesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeAdjustmentTypesRequestMarshaller createRequest:describeAdjustmentTypesRequest];

    return (AutoScalingDescribeAdjustmentTypesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeAdjustmentTypesResponseUnmarshaller class]];
}

-(AutoScalingDeleteAutoScalingGroupResponse *)deleteAutoScalingGroup:(AutoScalingDeleteAutoScalingGroupRequest *)deleteAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingDeleteAutoScalingGroupRequestMarshaller createRequest:deleteAutoScalingGroupRequest];

    return (AutoScalingDeleteAutoScalingGroupResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDeleteAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingCreateAutoScalingGroupResponse *)createAutoScalingGroup:(AutoScalingCreateAutoScalingGroupRequest *)createAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingCreateAutoScalingGroupRequestMarshaller createRequest:createAutoScalingGroupRequest];

    return (AutoScalingCreateAutoScalingGroupResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingCreateAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingDescribeAutoScalingInstancesResponse *)describeAutoScalingInstances:(AutoScalingDescribeAutoScalingInstancesRequest *)describeAutoScalingInstancesRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeAutoScalingInstancesRequestMarshaller createRequest:describeAutoScalingInstancesRequest];

    return (AutoScalingDescribeAutoScalingInstancesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeAutoScalingInstancesResponseUnmarshaller class]];
}

-(AutoScalingDeleteLaunchConfigurationResponse *)deleteLaunchConfiguration:(AutoScalingDeleteLaunchConfigurationRequest *)deleteLaunchConfigurationRequest
{
    AmazonServiceRequest *request = [AutoScalingDeleteLaunchConfigurationRequestMarshaller createRequest:deleteLaunchConfigurationRequest];

    return (AutoScalingDeleteLaunchConfigurationResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDeleteLaunchConfigurationResponseUnmarshaller class]];
}

-(AutoScalingPutScalingPolicyResponse *)putScalingPolicy:(AutoScalingPutScalingPolicyRequest *)putScalingPolicyRequest
{
    AmazonServiceRequest *request = [AutoScalingPutScalingPolicyRequestMarshaller createRequest:putScalingPolicyRequest];

    return (AutoScalingPutScalingPolicyResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingPutScalingPolicyResponseUnmarshaller class]];
}

-(AutoScalingSetInstanceHealthResponse *)setInstanceHealth:(AutoScalingSetInstanceHealthRequest *)setInstanceHealthRequest
{
    AmazonServiceRequest *request = [AutoScalingSetInstanceHealthRequestMarshaller createRequest:setInstanceHealthRequest];

    return (AutoScalingSetInstanceHealthResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingSetInstanceHealthResponseUnmarshaller class]];
}

-(AutoScalingUpdateAutoScalingGroupResponse *)updateAutoScalingGroup:(AutoScalingUpdateAutoScalingGroupRequest *)updateAutoScalingGroupRequest
{
    AmazonServiceRequest *request = [AutoScalingUpdateAutoScalingGroupRequestMarshaller createRequest:updateAutoScalingGroupRequest];

    return (AutoScalingUpdateAutoScalingGroupResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingUpdateAutoScalingGroupResponseUnmarshaller class]];
}

-(AutoScalingDescribeScheduledActionsResponse *)describeScheduledActions:(AutoScalingDescribeScheduledActionsRequest *)describeScheduledActionsRequest
{
    AmazonServiceRequest *request = [AutoScalingDescribeScheduledActionsRequestMarshaller createRequest:describeScheduledActionsRequest];

    return (AutoScalingDescribeScheduledActionsResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDescribeScheduledActionsResponseUnmarshaller class]];
}

-(AutoScalingSuspendProcessesResponse *)suspendProcesses:(AutoScalingSuspendProcessesRequest *)suspendProcessesRequest
{
    AmazonServiceRequest *request = [AutoScalingSuspendProcessesRequestMarshaller createRequest:suspendProcessesRequest];

    return (AutoScalingSuspendProcessesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingSuspendProcessesResponseUnmarshaller class]];
}

-(AutoScalingResumeProcessesResponse *)resumeProcesses:(AutoScalingResumeProcessesRequest *)resumeProcessesRequest
{
    AmazonServiceRequest *request = [AutoScalingResumeProcessesRequestMarshaller createRequest:resumeProcessesRequest];

    return (AutoScalingResumeProcessesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingResumeProcessesResponseUnmarshaller class]];
}

-(AutoScalingCreateLaunchConfigurationResponse *)createLaunchConfiguration:(AutoScalingCreateLaunchConfigurationRequest *)createLaunchConfigurationRequest
{
    AmazonServiceRequest *request = [AutoScalingCreateLaunchConfigurationRequestMarshaller createRequest:createLaunchConfigurationRequest];

    return (AutoScalingCreateLaunchConfigurationResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingCreateLaunchConfigurationResponseUnmarshaller class]];
}

-(AutoScalingDisableMetricsCollectionResponse *)disableMetricsCollection:(AutoScalingDisableMetricsCollectionRequest *)disableMetricsCollectionRequest
{
    AmazonServiceRequest *request = [AutoScalingDisableMetricsCollectionRequestMarshaller createRequest:disableMetricsCollectionRequest];

    return (AutoScalingDisableMetricsCollectionResponse *)[self parseResponse:[self invoke:request] withDelegateType:[AutoScalingDisableMetricsCollectionResponseUnmarshaller class]];
}



@end

