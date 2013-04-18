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

#import "AmazonEC2Client.h"
#import "AmazonEndpoints.h"
#import "AmazonServiceRequest.h"
#import "EC2RebootInstancesResponseUnmarshaller.h"
#import "EC2RebootInstancesRequestMarshaller.h"
#import "EC2DescribeReservedInstancesResponseUnmarshaller.h"
#import "EC2DescribeReservedInstancesRequestMarshaller.h"
#import "EC2DescribeAvailabilityZonesResponseUnmarshaller.h"
#import "EC2DescribeAvailabilityZonesRequestMarshaller.h"
#import "EC2DetachVolumeResponseUnmarshaller.h"
#import "EC2DetachVolumeRequestMarshaller.h"
#import "EC2DeleteKeyPairResponseUnmarshaller.h"
#import "EC2DeleteKeyPairRequestMarshaller.h"
#import "EC2UnmonitorInstancesResponseUnmarshaller.h"
#import "EC2UnmonitorInstancesRequestMarshaller.h"
#import "EC2CreateImageResponseUnmarshaller.h"
#import "EC2CreateImageRequestMarshaller.h"
#import "EC2DeleteSecurityGroupResponseUnmarshaller.h"
#import "EC2DeleteSecurityGroupRequestMarshaller.h"
#import "EC2CreateInstanceExportTaskResponseUnmarshaller.h"
#import "EC2CreateInstanceExportTaskRequestMarshaller.h"
#import "EC2GetPasswordDataResponseUnmarshaller.h"
#import "EC2GetPasswordDataRequestMarshaller.h"
#import "EC2StopInstancesResponseUnmarshaller.h"
#import "EC2StopInstancesRequestMarshaller.h"
#import "EC2ImportKeyPairResponseUnmarshaller.h"
#import "EC2ImportKeyPairRequestMarshaller.h"
#import "EC2CreateSecurityGroupResponseUnmarshaller.h"
#import "EC2CreateSecurityGroupRequestMarshaller.h"
#import "EC2DescribeSpotPriceHistoryResponseUnmarshaller.h"
#import "EC2DescribeSpotPriceHistoryRequestMarshaller.h"
#import "EC2DescribeRegionsResponseUnmarshaller.h"
#import "EC2DescribeRegionsRequestMarshaller.h"
#import "EC2CreateReservedInstancesListingResponseUnmarshaller.h"
#import "EC2CreateReservedInstancesListingRequestMarshaller.h"
#import "EC2ResetSnapshotAttributeResponseUnmarshaller.h"
#import "EC2ResetSnapshotAttributeRequestMarshaller.h"
#import "EC2ImportVolumeResponseUnmarshaller.h"
#import "EC2ImportVolumeRequestMarshaller.h"
#import "EC2DescribeSecurityGroupsResponseUnmarshaller.h"
#import "EC2DescribeSecurityGroupsRequestMarshaller.h"
#import "EC2DeregisterImageResponseUnmarshaller.h"
#import "EC2DeregisterImageRequestMarshaller.h"
#import "EC2DescribeSpotDatafeedSubscriptionResponseUnmarshaller.h"
#import "EC2DescribeSpotDatafeedSubscriptionRequestMarshaller.h"
#import "EC2DeleteTagsResponseUnmarshaller.h"
#import "EC2DeleteTagsRequestMarshaller.h"
#import "EC2DescribeAccountAttributesResponseUnmarshaller.h"
#import "EC2DescribeAccountAttributesRequestMarshaller.h"
#import "EC2EnableVolumeIOResponseUnmarshaller.h"
#import "EC2EnableVolumeIORequestMarshaller.h"
#import "EC2AttachVolumeResponseUnmarshaller.h"
#import "EC2AttachVolumeRequestMarshaller.h"
#import "EC2DescribeLicensesResponseUnmarshaller.h"
#import "EC2DescribeLicensesRequestMarshaller.h"
#import "EC2DescribeVolumeStatusResponseUnmarshaller.h"
#import "EC2DescribeVolumeStatusRequestMarshaller.h"
#import "EC2ActivateLicenseResponseUnmarshaller.h"
#import "EC2ActivateLicenseRequestMarshaller.h"
#import "EC2ResetImageAttributeResponseUnmarshaller.h"
#import "EC2ResetImageAttributeRequestMarshaller.h"
#import "EC2CreateSnapshotResponseUnmarshaller.h"
#import "EC2CreateSnapshotRequestMarshaller.h"
#import "EC2DeleteVolumeResponseUnmarshaller.h"
#import "EC2DeleteVolumeRequestMarshaller.h"
#import "EC2DescribeVpcsResponseUnmarshaller.h"
#import "EC2DescribeVpcsRequestMarshaller.h"
#import "EC2CancelConversionTaskResponseUnmarshaller.h"
#import "EC2CancelConversionTaskRequestMarshaller.h"
#import "EC2AssociateAddressResponseUnmarshaller.h"
#import "EC2AssociateAddressRequestMarshaller.h"
#import "EC2DeactivateLicenseResponseUnmarshaller.h"
#import "EC2DeactivateLicenseRequestMarshaller.h"
#import "EC2DescribeExportTasksResponseUnmarshaller.h"
#import "EC2DescribeExportTasksRequestMarshaller.h"
#import "EC2DescribeVolumesResponseUnmarshaller.h"
#import "EC2DescribeVolumesRequestMarshaller.h"
#import "EC2DescribeReservedInstancesListingsResponseUnmarshaller.h"
#import "EC2DescribeReservedInstancesListingsRequestMarshaller.h"
#import "EC2ReportInstanceStatusResponseUnmarshaller.h"
#import "EC2ReportInstanceStatusRequestMarshaller.h"
#import "EC2MonitorInstancesResponseUnmarshaller.h"
#import "EC2MonitorInstancesRequestMarshaller.h"
#import "EC2DescribeBundleTasksResponseUnmarshaller.h"
#import "EC2DescribeBundleTasksRequestMarshaller.h"
#import "EC2ImportInstanceResponseUnmarshaller.h"
#import "EC2ImportInstanceRequestMarshaller.h"
#import "EC2RevokeSecurityGroupIngressResponseUnmarshaller.h"
#import "EC2RevokeSecurityGroupIngressRequestMarshaller.h"
#import "EC2GetConsoleOutputResponseUnmarshaller.h"
#import "EC2GetConsoleOutputRequestMarshaller.h"
#import "EC2ModifyImageAttributeResponseUnmarshaller.h"
#import "EC2ModifyImageAttributeRequestMarshaller.h"
#import "EC2CreateSpotDatafeedSubscriptionResponseUnmarshaller.h"
#import "EC2CreateSpotDatafeedSubscriptionRequestMarshaller.h"
#import "EC2DescribeConversionTasksResponseUnmarshaller.h"
#import "EC2DescribeConversionTasksRequestMarshaller.h"
#import "EC2DescribeInstanceAttributeResponseUnmarshaller.h"
#import "EC2DescribeInstanceAttributeRequestMarshaller.h"
#import "EC2DescribeSubnetsResponseUnmarshaller.h"
#import "EC2DescribeSubnetsRequestMarshaller.h"
#import "EC2RunInstancesResponseUnmarshaller.h"
#import "EC2RunInstancesRequestMarshaller.h"
#import "EC2DescribePlacementGroupsResponseUnmarshaller.h"
#import "EC2DescribePlacementGroupsRequestMarshaller.h"
#import "EC2DescribeInstancesResponseUnmarshaller.h"
#import "EC2DescribeInstancesRequestMarshaller.h"
#import "EC2ModifyVolumeAttributeResponseUnmarshaller.h"
#import "EC2ModifyVolumeAttributeRequestMarshaller.h"
#import "EC2DescribeImagesResponseUnmarshaller.h"
#import "EC2DescribeImagesRequestMarshaller.h"
#import "EC2StartInstancesResponseUnmarshaller.h"
#import "EC2StartInstancesRequestMarshaller.h"
#import "EC2CancelReservedInstancesListingResponseUnmarshaller.h"
#import "EC2CancelReservedInstancesListingRequestMarshaller.h"
#import "EC2ModifyInstanceAttributeResponseUnmarshaller.h"
#import "EC2ModifyInstanceAttributeRequestMarshaller.h"
#import "EC2AuthorizeSecurityGroupIngressResponseUnmarshaller.h"
#import "EC2AuthorizeSecurityGroupIngressRequestMarshaller.h"
#import "EC2DescribeSpotInstanceRequestsResponseUnmarshaller.h"
#import "EC2DescribeSpotInstanceRequestsRequestMarshaller.h"
#import "EC2CancelExportTaskResponseUnmarshaller.h"
#import "EC2CancelExportTaskRequestMarshaller.h"
#import "EC2CopyImageResponseUnmarshaller.h"
#import "EC2CopyImageRequestMarshaller.h"
#import "EC2RequestSpotInstancesResponseUnmarshaller.h"
#import "EC2RequestSpotInstancesRequestMarshaller.h"
#import "EC2CreateTagsResponseUnmarshaller.h"
#import "EC2CreateTagsRequestMarshaller.h"
#import "EC2DescribeVolumeAttributeResponseUnmarshaller.h"
#import "EC2DescribeVolumeAttributeRequestMarshaller.h"
#import "EC2DescribeTagsResponseUnmarshaller.h"
#import "EC2DescribeTagsRequestMarshaller.h"
#import "EC2CancelBundleTaskResponseUnmarshaller.h"
#import "EC2CancelBundleTaskRequestMarshaller.h"
#import "EC2CancelSpotInstanceRequestsResponseUnmarshaller.h"
#import "EC2CancelSpotInstanceRequestsRequestMarshaller.h"
#import "EC2PurchaseReservedInstancesOfferingResponseUnmarshaller.h"
#import "EC2PurchaseReservedInstancesOfferingRequestMarshaller.h"
#import "EC2ModifySnapshotAttributeResponseUnmarshaller.h"
#import "EC2ModifySnapshotAttributeRequestMarshaller.h"
#import "EC2TerminateInstancesResponseUnmarshaller.h"
#import "EC2TerminateInstancesRequestMarshaller.h"
#import "EC2DeleteSpotDatafeedSubscriptionResponseUnmarshaller.h"
#import "EC2DeleteSpotDatafeedSubscriptionRequestMarshaller.h"
#import "EC2DescribeSnapshotAttributeResponseUnmarshaller.h"
#import "EC2DescribeSnapshotAttributeRequestMarshaller.h"
#import "EC2DescribeAddressesResponseUnmarshaller.h"
#import "EC2DescribeAddressesRequestMarshaller.h"
#import "EC2DescribeImageAttributeResponseUnmarshaller.h"
#import "EC2DescribeImageAttributeRequestMarshaller.h"
#import "EC2DescribeKeyPairsResponseUnmarshaller.h"
#import "EC2DescribeKeyPairsRequestMarshaller.h"
#import "EC2ConfirmProductInstanceResponseUnmarshaller.h"
#import "EC2ConfirmProductInstanceRequestMarshaller.h"
#import "EC2CreateVolumeResponseUnmarshaller.h"
#import "EC2CreateVolumeRequestMarshaller.h"
#import "EC2DescribeInstanceStatusResponseUnmarshaller.h"
#import "EC2DescribeInstanceStatusRequestMarshaller.h"
#import "EC2DescribeReservedInstancesOfferingsResponseUnmarshaller.h"
#import "EC2DescribeReservedInstancesOfferingsRequestMarshaller.h"
#import "EC2DeleteSnapshotResponseUnmarshaller.h"
#import "EC2DeleteSnapshotRequestMarshaller.h"
#import "EC2DisassociateAddressResponseUnmarshaller.h"
#import "EC2DisassociateAddressRequestMarshaller.h"
#import "EC2CreatePlacementGroupResponseUnmarshaller.h"
#import "EC2CreatePlacementGroupRequestMarshaller.h"
#import "EC2BundleInstanceResponseUnmarshaller.h"
#import "EC2BundleInstanceRequestMarshaller.h"
#import "EC2DeletePlacementGroupResponseUnmarshaller.h"
#import "EC2DeletePlacementGroupRequestMarshaller.h"
#import "EC2CopySnapshotResponseUnmarshaller.h"
#import "EC2CopySnapshotRequestMarshaller.h"
#import "EC2AllocateAddressResponseUnmarshaller.h"
#import "EC2AllocateAddressRequestMarshaller.h"
#import "EC2ReleaseAddressResponseUnmarshaller.h"
#import "EC2ReleaseAddressRequestMarshaller.h"
#import "EC2ResetInstanceAttributeResponseUnmarshaller.h"
#import "EC2ResetInstanceAttributeRequestMarshaller.h"
#import "EC2CreateKeyPairResponseUnmarshaller.h"
#import "EC2CreateKeyPairRequestMarshaller.h"
#import "EC2DescribeSnapshotsResponseUnmarshaller.h"
#import "EC2DescribeSnapshotsRequestMarshaller.h"
#import "EC2RegisterImageResponseUnmarshaller.h"
#import "EC2RegisterImageRequestMarshaller.h"


@implementation AmazonEC2Client

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = AMAZON_EC2_US_EAST_1_ENDPOINT_SECURE;
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = AMAZON_EC2_US_EAST_1_ENDPOINT_SECURE;
    }
    return self;
}

-(id)initWithCredentialsProvider:(id<AmazonCredentialsProvider> )theProvider
{
    if (self = [super initWithCredentialsProvider:theProvider]) {
        self.endpoint = AMAZON_EC2_US_EAST_1_ENDPOINT_SECURE;
    }
    return self;
}

-(EC2RebootInstancesResponse *)rebootInstances:(EC2RebootInstancesRequest *)rebootInstancesRequest
{
    AmazonServiceRequest *request = [EC2RebootInstancesRequestMarshaller createRequest:rebootInstancesRequest];

    return (EC2RebootInstancesResponse *)[self invoke:request rawRequest:rebootInstancesRequest unmarshallerDelegate:[EC2RebootInstancesResponseUnmarshaller class]];
}

-(EC2DescribeReservedInstancesResponse *)describeReservedInstances:(EC2DescribeReservedInstancesRequest *)describeReservedInstancesRequest
{
    AmazonServiceRequest *request = [EC2DescribeReservedInstancesRequestMarshaller createRequest:describeReservedInstancesRequest];

    return (EC2DescribeReservedInstancesResponse *)[self invoke:request rawRequest:describeReservedInstancesRequest unmarshallerDelegate:[EC2DescribeReservedInstancesResponseUnmarshaller class]];
}

-(EC2DescribeAvailabilityZonesResponse *)describeAvailabilityZones:(EC2DescribeAvailabilityZonesRequest *)describeAvailabilityZonesRequest
{
    AmazonServiceRequest *request = [EC2DescribeAvailabilityZonesRequestMarshaller createRequest:describeAvailabilityZonesRequest];

    return (EC2DescribeAvailabilityZonesResponse *)[self invoke:request rawRequest:describeAvailabilityZonesRequest unmarshallerDelegate:[EC2DescribeAvailabilityZonesResponseUnmarshaller class]];
}

-(EC2DetachVolumeResponse *)detachVolume:(EC2DetachVolumeRequest *)detachVolumeRequest
{
    AmazonServiceRequest *request = [EC2DetachVolumeRequestMarshaller createRequest:detachVolumeRequest];

    return (EC2DetachVolumeResponse *)[self invoke:request rawRequest:detachVolumeRequest unmarshallerDelegate:[EC2DetachVolumeResponseUnmarshaller class]];
}

-(EC2DeleteKeyPairResponse *)deleteKeyPair:(EC2DeleteKeyPairRequest *)deleteKeyPairRequest
{
    AmazonServiceRequest *request = [EC2DeleteKeyPairRequestMarshaller createRequest:deleteKeyPairRequest];

    return (EC2DeleteKeyPairResponse *)[self invoke:request rawRequest:deleteKeyPairRequest unmarshallerDelegate:[EC2DeleteKeyPairResponseUnmarshaller class]];
}

-(EC2UnmonitorInstancesResponse *)unmonitorInstances:(EC2UnmonitorInstancesRequest *)unmonitorInstancesRequest
{
    AmazonServiceRequest *request = [EC2UnmonitorInstancesRequestMarshaller createRequest:unmonitorInstancesRequest];

    return (EC2UnmonitorInstancesResponse *)[self invoke:request rawRequest:unmonitorInstancesRequest unmarshallerDelegate:[EC2UnmonitorInstancesResponseUnmarshaller class]];
}

-(EC2CreateImageResponse *)createImage:(EC2CreateImageRequest *)createImageRequest
{
    AmazonServiceRequest *request = [EC2CreateImageRequestMarshaller createRequest:createImageRequest];

    return (EC2CreateImageResponse *)[self invoke:request rawRequest:createImageRequest unmarshallerDelegate:[EC2CreateImageResponseUnmarshaller class]];
}

-(EC2DeleteSecurityGroupResponse *)deleteSecurityGroup:(EC2DeleteSecurityGroupRequest *)deleteSecurityGroupRequest
{
    AmazonServiceRequest *request = [EC2DeleteSecurityGroupRequestMarshaller createRequest:deleteSecurityGroupRequest];

    return (EC2DeleteSecurityGroupResponse *)[self invoke:request rawRequest:deleteSecurityGroupRequest unmarshallerDelegate:[EC2DeleteSecurityGroupResponseUnmarshaller class]];
}

-(EC2CreateInstanceExportTaskResponse *)createInstanceExportTask:(EC2CreateInstanceExportTaskRequest *)createInstanceExportTaskRequest
{
    AmazonServiceRequest *request = [EC2CreateInstanceExportTaskRequestMarshaller createRequest:createInstanceExportTaskRequest];

    return (EC2CreateInstanceExportTaskResponse *)[self invoke:request rawRequest:createInstanceExportTaskRequest unmarshallerDelegate:[EC2CreateInstanceExportTaskResponseUnmarshaller class]];
}

-(EC2GetPasswordDataResponse *)getPasswordData:(EC2GetPasswordDataRequest *)getPasswordDataRequest
{
    AmazonServiceRequest *request = [EC2GetPasswordDataRequestMarshaller createRequest:getPasswordDataRequest];

    return (EC2GetPasswordDataResponse *)[self invoke:request rawRequest:getPasswordDataRequest unmarshallerDelegate:[EC2GetPasswordDataResponseUnmarshaller class]];
}

-(EC2StopInstancesResponse *)stopInstances:(EC2StopInstancesRequest *)stopInstancesRequest
{
    AmazonServiceRequest *request = [EC2StopInstancesRequestMarshaller createRequest:stopInstancesRequest];

    return (EC2StopInstancesResponse *)[self invoke:request rawRequest:stopInstancesRequest unmarshallerDelegate:[EC2StopInstancesResponseUnmarshaller class]];
}

-(EC2ImportKeyPairResponse *)importKeyPair:(EC2ImportKeyPairRequest *)importKeyPairRequest
{
    AmazonServiceRequest *request = [EC2ImportKeyPairRequestMarshaller createRequest:importKeyPairRequest];

    return (EC2ImportKeyPairResponse *)[self invoke:request rawRequest:importKeyPairRequest unmarshallerDelegate:[EC2ImportKeyPairResponseUnmarshaller class]];
}

-(EC2CreateSecurityGroupResponse *)createSecurityGroup:(EC2CreateSecurityGroupRequest *)createSecurityGroupRequest
{
    AmazonServiceRequest *request = [EC2CreateSecurityGroupRequestMarshaller createRequest:createSecurityGroupRequest];

    return (EC2CreateSecurityGroupResponse *)[self invoke:request rawRequest:createSecurityGroupRequest unmarshallerDelegate:[EC2CreateSecurityGroupResponseUnmarshaller class]];
}

-(EC2DescribeSpotPriceHistoryResponse *)describeSpotPriceHistory:(EC2DescribeSpotPriceHistoryRequest *)describeSpotPriceHistoryRequest
{
    AmazonServiceRequest *request = [EC2DescribeSpotPriceHistoryRequestMarshaller createRequest:describeSpotPriceHistoryRequest];

    return (EC2DescribeSpotPriceHistoryResponse *)[self invoke:request rawRequest:describeSpotPriceHistoryRequest unmarshallerDelegate:[EC2DescribeSpotPriceHistoryResponseUnmarshaller class]];
}

-(EC2DescribeRegionsResponse *)describeRegions:(EC2DescribeRegionsRequest *)describeRegionsRequest
{
    AmazonServiceRequest *request = [EC2DescribeRegionsRequestMarshaller createRequest:describeRegionsRequest];

    return (EC2DescribeRegionsResponse *)[self invoke:request rawRequest:describeRegionsRequest unmarshallerDelegate:[EC2DescribeRegionsResponseUnmarshaller class]];
}

-(EC2CreateReservedInstancesListingResponse *)createReservedInstancesListing:(EC2CreateReservedInstancesListingRequest *)createReservedInstancesListingRequest
{
    AmazonServiceRequest *request = [EC2CreateReservedInstancesListingRequestMarshaller createRequest:createReservedInstancesListingRequest];

    return (EC2CreateReservedInstancesListingResponse *)[self invoke:request rawRequest:createReservedInstancesListingRequest unmarshallerDelegate:[EC2CreateReservedInstancesListingResponseUnmarshaller class]];
}

-(EC2ResetSnapshotAttributeResponse *)resetSnapshotAttribute:(EC2ResetSnapshotAttributeRequest *)resetSnapshotAttributeRequest
{
    AmazonServiceRequest *request = [EC2ResetSnapshotAttributeRequestMarshaller createRequest:resetSnapshotAttributeRequest];

    return (EC2ResetSnapshotAttributeResponse *)[self invoke:request rawRequest:resetSnapshotAttributeRequest unmarshallerDelegate:[EC2ResetSnapshotAttributeResponseUnmarshaller class]];
}

-(EC2ImportVolumeResponse *)importVolume:(EC2ImportVolumeRequest *)importVolumeRequest
{
    AmazonServiceRequest *request = [EC2ImportVolumeRequestMarshaller createRequest:importVolumeRequest];

    return (EC2ImportVolumeResponse *)[self invoke:request rawRequest:importVolumeRequest unmarshallerDelegate:[EC2ImportVolumeResponseUnmarshaller class]];
}

-(EC2DescribeSecurityGroupsResponse *)describeSecurityGroups:(EC2DescribeSecurityGroupsRequest *)describeSecurityGroupsRequest
{
    AmazonServiceRequest *request = [EC2DescribeSecurityGroupsRequestMarshaller createRequest:describeSecurityGroupsRequest];

    return (EC2DescribeSecurityGroupsResponse *)[self invoke:request rawRequest:describeSecurityGroupsRequest unmarshallerDelegate:[EC2DescribeSecurityGroupsResponseUnmarshaller class]];
}

-(EC2DeregisterImageResponse *)deregisterImage:(EC2DeregisterImageRequest *)deregisterImageRequest
{
    AmazonServiceRequest *request = [EC2DeregisterImageRequestMarshaller createRequest:deregisterImageRequest];

    return (EC2DeregisterImageResponse *)[self invoke:request rawRequest:deregisterImageRequest unmarshallerDelegate:[EC2DeregisterImageResponseUnmarshaller class]];
}

-(EC2DescribeSpotDatafeedSubscriptionResponse *)describeSpotDatafeedSubscription:(EC2DescribeSpotDatafeedSubscriptionRequest *)describeSpotDatafeedSubscriptionRequest
{
    AmazonServiceRequest *request = [EC2DescribeSpotDatafeedSubscriptionRequestMarshaller createRequest:describeSpotDatafeedSubscriptionRequest];

    return (EC2DescribeSpotDatafeedSubscriptionResponse *)[self invoke:request rawRequest:describeSpotDatafeedSubscriptionRequest unmarshallerDelegate:[EC2DescribeSpotDatafeedSubscriptionResponseUnmarshaller class]];
}

-(EC2DeleteTagsResponse *)deleteTags:(EC2DeleteTagsRequest *)deleteTagsRequest
{
    AmazonServiceRequest *request = [EC2DeleteTagsRequestMarshaller createRequest:deleteTagsRequest];

    return (EC2DeleteTagsResponse *)[self invoke:request rawRequest:deleteTagsRequest unmarshallerDelegate:[EC2DeleteTagsResponseUnmarshaller class]];
}

-(EC2DescribeAccountAttributesResponse *)describeAccountAttributes:(EC2DescribeAccountAttributesRequest *)describeAccountAttributesRequest
{
    AmazonServiceRequest *request = [EC2DescribeAccountAttributesRequestMarshaller createRequest:describeAccountAttributesRequest];

    return (EC2DescribeAccountAttributesResponse *)[self invoke:request rawRequest:describeAccountAttributesRequest unmarshallerDelegate:[EC2DescribeAccountAttributesResponseUnmarshaller class]];
}

-(EC2EnableVolumeIOResponse *)enableVolumeIO:(EC2EnableVolumeIORequest *)enableVolumeIORequest
{
    AmazonServiceRequest *request = [EC2EnableVolumeIORequestMarshaller createRequest:enableVolumeIORequest];

    return (EC2EnableVolumeIOResponse *)[self invoke:request rawRequest:enableVolumeIORequest unmarshallerDelegate:[EC2EnableVolumeIOResponseUnmarshaller class]];
}

-(EC2AttachVolumeResponse *)attachVolume:(EC2AttachVolumeRequest *)attachVolumeRequest
{
    AmazonServiceRequest *request = [EC2AttachVolumeRequestMarshaller createRequest:attachVolumeRequest];

    return (EC2AttachVolumeResponse *)[self invoke:request rawRequest:attachVolumeRequest unmarshallerDelegate:[EC2AttachVolumeResponseUnmarshaller class]];
}

-(EC2DescribeLicensesResponse *)describeLicenses:(EC2DescribeLicensesRequest *)describeLicensesRequest
{
    AmazonServiceRequest *request = [EC2DescribeLicensesRequestMarshaller createRequest:describeLicensesRequest];

    return (EC2DescribeLicensesResponse *)[self invoke:request rawRequest:describeLicensesRequest unmarshallerDelegate:[EC2DescribeLicensesResponseUnmarshaller class]];
}

-(EC2DescribeVolumeStatusResponse *)describeVolumeStatus:(EC2DescribeVolumeStatusRequest *)describeVolumeStatusRequest
{
    AmazonServiceRequest *request = [EC2DescribeVolumeStatusRequestMarshaller createRequest:describeVolumeStatusRequest];

    return (EC2DescribeVolumeStatusResponse *)[self invoke:request rawRequest:describeVolumeStatusRequest unmarshallerDelegate:[EC2DescribeVolumeStatusResponseUnmarshaller class]];
}

-(EC2ActivateLicenseResponse *)activateLicense:(EC2ActivateLicenseRequest *)activateLicenseRequest
{
    AmazonServiceRequest *request = [EC2ActivateLicenseRequestMarshaller createRequest:activateLicenseRequest];

    return (EC2ActivateLicenseResponse *)[self invoke:request rawRequest:activateLicenseRequest unmarshallerDelegate:[EC2ActivateLicenseResponseUnmarshaller class]];
}

-(EC2ResetImageAttributeResponse *)resetImageAttribute:(EC2ResetImageAttributeRequest *)resetImageAttributeRequest
{
    AmazonServiceRequest *request = [EC2ResetImageAttributeRequestMarshaller createRequest:resetImageAttributeRequest];

    return (EC2ResetImageAttributeResponse *)[self invoke:request rawRequest:resetImageAttributeRequest unmarshallerDelegate:[EC2ResetImageAttributeResponseUnmarshaller class]];
}

-(EC2CreateSnapshotResponse *)createSnapshot:(EC2CreateSnapshotRequest *)createSnapshotRequest
{
    AmazonServiceRequest *request = [EC2CreateSnapshotRequestMarshaller createRequest:createSnapshotRequest];

    return (EC2CreateSnapshotResponse *)[self invoke:request rawRequest:createSnapshotRequest unmarshallerDelegate:[EC2CreateSnapshotResponseUnmarshaller class]];
}

-(EC2DeleteVolumeResponse *)deleteVolume:(EC2DeleteVolumeRequest *)deleteVolumeRequest
{
    AmazonServiceRequest *request = [EC2DeleteVolumeRequestMarshaller createRequest:deleteVolumeRequest];

    return (EC2DeleteVolumeResponse *)[self invoke:request rawRequest:deleteVolumeRequest unmarshallerDelegate:[EC2DeleteVolumeResponseUnmarshaller class]];
}

-(EC2DescribeVpcsResponse *)describeVpcs:(EC2DescribeVpcsRequest *)describeVpcsRequest
{
    AmazonServiceRequest *request = [EC2DescribeVpcsRequestMarshaller createRequest:describeVpcsRequest];

    return (EC2DescribeVpcsResponse *)[self invoke:request rawRequest:describeVpcsRequest unmarshallerDelegate:[EC2DescribeVpcsResponseUnmarshaller class]];
}

-(EC2CancelConversionTaskResponse *)cancelConversionTask:(EC2CancelConversionTaskRequest *)cancelConversionTaskRequest
{
    AmazonServiceRequest *request = [EC2CancelConversionTaskRequestMarshaller createRequest:cancelConversionTaskRequest];

    return (EC2CancelConversionTaskResponse *)[self invoke:request rawRequest:cancelConversionTaskRequest unmarshallerDelegate:[EC2CancelConversionTaskResponseUnmarshaller class]];
}

-(EC2AssociateAddressResponse *)associateAddress:(EC2AssociateAddressRequest *)associateAddressRequest
{
    AmazonServiceRequest *request = [EC2AssociateAddressRequestMarshaller createRequest:associateAddressRequest];

    return (EC2AssociateAddressResponse *)[self invoke:request rawRequest:associateAddressRequest unmarshallerDelegate:[EC2AssociateAddressResponseUnmarshaller class]];
}

-(EC2DeactivateLicenseResponse *)deactivateLicense:(EC2DeactivateLicenseRequest *)deactivateLicenseRequest
{
    AmazonServiceRequest *request = [EC2DeactivateLicenseRequestMarshaller createRequest:deactivateLicenseRequest];

    return (EC2DeactivateLicenseResponse *)[self invoke:request rawRequest:deactivateLicenseRequest unmarshallerDelegate:[EC2DeactivateLicenseResponseUnmarshaller class]];
}

-(EC2DescribeExportTasksResponse *)describeExportTasks:(EC2DescribeExportTasksRequest *)describeExportTasksRequest
{
    AmazonServiceRequest *request = [EC2DescribeExportTasksRequestMarshaller createRequest:describeExportTasksRequest];

    return (EC2DescribeExportTasksResponse *)[self invoke:request rawRequest:describeExportTasksRequest unmarshallerDelegate:[EC2DescribeExportTasksResponseUnmarshaller class]];
}

-(EC2DescribeVolumesResponse *)describeVolumes:(EC2DescribeVolumesRequest *)describeVolumesRequest
{
    AmazonServiceRequest *request = [EC2DescribeVolumesRequestMarshaller createRequest:describeVolumesRequest];

    return (EC2DescribeVolumesResponse *)[self invoke:request rawRequest:describeVolumesRequest unmarshallerDelegate:[EC2DescribeVolumesResponseUnmarshaller class]];
}

-(EC2DescribeReservedInstancesListingsResponse *)describeReservedInstancesListings:(EC2DescribeReservedInstancesListingsRequest *)describeReservedInstancesListingsRequest
{
    AmazonServiceRequest *request = [EC2DescribeReservedInstancesListingsRequestMarshaller createRequest:describeReservedInstancesListingsRequest];

    return (EC2DescribeReservedInstancesListingsResponse *)[self invoke:request rawRequest:describeReservedInstancesListingsRequest unmarshallerDelegate:[EC2DescribeReservedInstancesListingsResponseUnmarshaller class]];
}

-(EC2ReportInstanceStatusResponse *)reportInstanceStatus:(EC2ReportInstanceStatusRequest *)reportInstanceStatusRequest
{
    AmazonServiceRequest *request = [EC2ReportInstanceStatusRequestMarshaller createRequest:reportInstanceStatusRequest];

    return (EC2ReportInstanceStatusResponse *)[self invoke:request rawRequest:reportInstanceStatusRequest unmarshallerDelegate:[EC2ReportInstanceStatusResponseUnmarshaller class]];
}

-(EC2MonitorInstancesResponse *)monitorInstances:(EC2MonitorInstancesRequest *)monitorInstancesRequest
{
    AmazonServiceRequest *request = [EC2MonitorInstancesRequestMarshaller createRequest:monitorInstancesRequest];

    return (EC2MonitorInstancesResponse *)[self invoke:request rawRequest:monitorInstancesRequest unmarshallerDelegate:[EC2MonitorInstancesResponseUnmarshaller class]];
}

-(EC2DescribeBundleTasksResponse *)describeBundleTasks:(EC2DescribeBundleTasksRequest *)describeBundleTasksRequest
{
    AmazonServiceRequest *request = [EC2DescribeBundleTasksRequestMarshaller createRequest:describeBundleTasksRequest];

    return (EC2DescribeBundleTasksResponse *)[self invoke:request rawRequest:describeBundleTasksRequest unmarshallerDelegate:[EC2DescribeBundleTasksResponseUnmarshaller class]];
}

-(EC2ImportInstanceResponse *)importInstance:(EC2ImportInstanceRequest *)importInstanceRequest
{
    AmazonServiceRequest *request = [EC2ImportInstanceRequestMarshaller createRequest:importInstanceRequest];

    return (EC2ImportInstanceResponse *)[self invoke:request rawRequest:importInstanceRequest unmarshallerDelegate:[EC2ImportInstanceResponseUnmarshaller class]];
}

-(EC2RevokeSecurityGroupIngressResponse *)revokeSecurityGroupIngress:(EC2RevokeSecurityGroupIngressRequest *)revokeSecurityGroupIngressRequest
{
    AmazonServiceRequest *request = [EC2RevokeSecurityGroupIngressRequestMarshaller createRequest:revokeSecurityGroupIngressRequest];

    return (EC2RevokeSecurityGroupIngressResponse *)[self invoke:request rawRequest:revokeSecurityGroupIngressRequest unmarshallerDelegate:[EC2RevokeSecurityGroupIngressResponseUnmarshaller class]];
}

-(EC2GetConsoleOutputResponse *)getConsoleOutput:(EC2GetConsoleOutputRequest *)getConsoleOutputRequest
{
    AmazonServiceRequest *request = [EC2GetConsoleOutputRequestMarshaller createRequest:getConsoleOutputRequest];

    return (EC2GetConsoleOutputResponse *)[self invoke:request rawRequest:getConsoleOutputRequest unmarshallerDelegate:[EC2GetConsoleOutputResponseUnmarshaller class]];
}

-(EC2ModifyImageAttributeResponse *)modifyImageAttribute:(EC2ModifyImageAttributeRequest *)modifyImageAttributeRequest
{
    AmazonServiceRequest *request = [EC2ModifyImageAttributeRequestMarshaller createRequest:modifyImageAttributeRequest];

    return (EC2ModifyImageAttributeResponse *)[self invoke:request rawRequest:modifyImageAttributeRequest unmarshallerDelegate:[EC2ModifyImageAttributeResponseUnmarshaller class]];
}

-(EC2CreateSpotDatafeedSubscriptionResponse *)createSpotDatafeedSubscription:(EC2CreateSpotDatafeedSubscriptionRequest *)createSpotDatafeedSubscriptionRequest
{
    AmazonServiceRequest *request = [EC2CreateSpotDatafeedSubscriptionRequestMarshaller createRequest:createSpotDatafeedSubscriptionRequest];

    return (EC2CreateSpotDatafeedSubscriptionResponse *)[self invoke:request rawRequest:createSpotDatafeedSubscriptionRequest unmarshallerDelegate:[EC2CreateSpotDatafeedSubscriptionResponseUnmarshaller class]];
}

-(EC2DescribeConversionTasksResponse *)describeConversionTasks:(EC2DescribeConversionTasksRequest *)describeConversionTasksRequest
{
    AmazonServiceRequest *request = [EC2DescribeConversionTasksRequestMarshaller createRequest:describeConversionTasksRequest];

    return (EC2DescribeConversionTasksResponse *)[self invoke:request rawRequest:describeConversionTasksRequest unmarshallerDelegate:[EC2DescribeConversionTasksResponseUnmarshaller class]];
}

-(EC2DescribeInstanceAttributeResponse *)describeInstanceAttribute:(EC2DescribeInstanceAttributeRequest *)describeInstanceAttributeRequest
{
    AmazonServiceRequest *request = [EC2DescribeInstanceAttributeRequestMarshaller createRequest:describeInstanceAttributeRequest];

    return (EC2DescribeInstanceAttributeResponse *)[self invoke:request rawRequest:describeInstanceAttributeRequest unmarshallerDelegate:[EC2DescribeInstanceAttributeResponseUnmarshaller class]];
}

-(EC2DescribeSubnetsResponse *)describeSubnets:(EC2DescribeSubnetsRequest *)describeSubnetsRequest
{
    AmazonServiceRequest *request = [EC2DescribeSubnetsRequestMarshaller createRequest:describeSubnetsRequest];

    return (EC2DescribeSubnetsResponse *)[self invoke:request rawRequest:describeSubnetsRequest unmarshallerDelegate:[EC2DescribeSubnetsResponseUnmarshaller class]];
}

-(EC2RunInstancesResponse *)runInstances:(EC2RunInstancesRequest *)runInstancesRequest
{
    AmazonServiceRequest *request = [EC2RunInstancesRequestMarshaller createRequest:runInstancesRequest];

    return (EC2RunInstancesResponse *)[self invoke:request rawRequest:runInstancesRequest unmarshallerDelegate:[EC2RunInstancesResponseUnmarshaller class]];
}

-(EC2DescribePlacementGroupsResponse *)describePlacementGroups:(EC2DescribePlacementGroupsRequest *)describePlacementGroupsRequest
{
    AmazonServiceRequest *request = [EC2DescribePlacementGroupsRequestMarshaller createRequest:describePlacementGroupsRequest];

    return (EC2DescribePlacementGroupsResponse *)[self invoke:request rawRequest:describePlacementGroupsRequest unmarshallerDelegate:[EC2DescribePlacementGroupsResponseUnmarshaller class]];
}

-(EC2DescribeInstancesResponse *)describeInstances:(EC2DescribeInstancesRequest *)describeInstancesRequest
{
    AmazonServiceRequest *request = [EC2DescribeInstancesRequestMarshaller createRequest:describeInstancesRequest];

    return (EC2DescribeInstancesResponse *)[self invoke:request rawRequest:describeInstancesRequest unmarshallerDelegate:[EC2DescribeInstancesResponseUnmarshaller class]];
}

-(EC2ModifyVolumeAttributeResponse *)modifyVolumeAttribute:(EC2ModifyVolumeAttributeRequest *)modifyVolumeAttributeRequest
{
    AmazonServiceRequest *request = [EC2ModifyVolumeAttributeRequestMarshaller createRequest:modifyVolumeAttributeRequest];

    return (EC2ModifyVolumeAttributeResponse *)[self invoke:request rawRequest:modifyVolumeAttributeRequest unmarshallerDelegate:[EC2ModifyVolumeAttributeResponseUnmarshaller class]];
}

-(EC2DescribeImagesResponse *)describeImages:(EC2DescribeImagesRequest *)describeImagesRequest
{
    AmazonServiceRequest *request = [EC2DescribeImagesRequestMarshaller createRequest:describeImagesRequest];

    return (EC2DescribeImagesResponse *)[self invoke:request rawRequest:describeImagesRequest unmarshallerDelegate:[EC2DescribeImagesResponseUnmarshaller class]];
}

-(EC2StartInstancesResponse *)startInstances:(EC2StartInstancesRequest *)startInstancesRequest
{
    AmazonServiceRequest *request = [EC2StartInstancesRequestMarshaller createRequest:startInstancesRequest];

    return (EC2StartInstancesResponse *)[self invoke:request rawRequest:startInstancesRequest unmarshallerDelegate:[EC2StartInstancesResponseUnmarshaller class]];
}

-(EC2CancelReservedInstancesListingResponse *)cancelReservedInstancesListing:(EC2CancelReservedInstancesListingRequest *)cancelReservedInstancesListingRequest
{
    AmazonServiceRequest *request = [EC2CancelReservedInstancesListingRequestMarshaller createRequest:cancelReservedInstancesListingRequest];

    return (EC2CancelReservedInstancesListingResponse *)[self invoke:request rawRequest:cancelReservedInstancesListingRequest unmarshallerDelegate:[EC2CancelReservedInstancesListingResponseUnmarshaller class]];
}

-(EC2ModifyInstanceAttributeResponse *)modifyInstanceAttribute:(EC2ModifyInstanceAttributeRequest *)modifyInstanceAttributeRequest
{
    AmazonServiceRequest *request = [EC2ModifyInstanceAttributeRequestMarshaller createRequest:modifyInstanceAttributeRequest];

    return (EC2ModifyInstanceAttributeResponse *)[self invoke:request rawRequest:modifyInstanceAttributeRequest unmarshallerDelegate:[EC2ModifyInstanceAttributeResponseUnmarshaller class]];
}

-(EC2AuthorizeSecurityGroupIngressResponse *)authorizeSecurityGroupIngress:(EC2AuthorizeSecurityGroupIngressRequest *)authorizeSecurityGroupIngressRequest
{
    AmazonServiceRequest *request = [EC2AuthorizeSecurityGroupIngressRequestMarshaller createRequest:authorizeSecurityGroupIngressRequest];

    return (EC2AuthorizeSecurityGroupIngressResponse *)[self invoke:request rawRequest:authorizeSecurityGroupIngressRequest unmarshallerDelegate:[EC2AuthorizeSecurityGroupIngressResponseUnmarshaller class]];
}

-(EC2DescribeSpotInstanceRequestsResponse *)describeSpotInstanceRequests:(EC2DescribeSpotInstanceRequestsRequest *)describeSpotInstanceRequestsRequest
{
    AmazonServiceRequest *request = [EC2DescribeSpotInstanceRequestsRequestMarshaller createRequest:describeSpotInstanceRequestsRequest];

    return (EC2DescribeSpotInstanceRequestsResponse *)[self invoke:request rawRequest:describeSpotInstanceRequestsRequest unmarshallerDelegate:[EC2DescribeSpotInstanceRequestsResponseUnmarshaller class]];
}

-(EC2CancelExportTaskResponse *)cancelExportTask:(EC2CancelExportTaskRequest *)cancelExportTaskRequest
{
    AmazonServiceRequest *request = [EC2CancelExportTaskRequestMarshaller createRequest:cancelExportTaskRequest];

    return (EC2CancelExportTaskResponse *)[self invoke:request rawRequest:cancelExportTaskRequest unmarshallerDelegate:[EC2CancelExportTaskResponseUnmarshaller class]];
}

-(EC2CopyImageResponse *)doCopyImage:(EC2CopyImageRequest *)copyImageRequest
{
    AmazonServiceRequest *request = [EC2CopyImageRequestMarshaller createRequest:copyImageRequest];

    return (EC2CopyImageResponse *)[self invoke:request rawRequest:copyImageRequest unmarshallerDelegate:[EC2CopyImageResponseUnmarshaller class]];
}

-(EC2RequestSpotInstancesResponse *)requestSpotInstances:(EC2RequestSpotInstancesRequest *)requestSpotInstancesRequest
{
    AmazonServiceRequest *request = [EC2RequestSpotInstancesRequestMarshaller createRequest:requestSpotInstancesRequest];

    return (EC2RequestSpotInstancesResponse *)[self invoke:request rawRequest:requestSpotInstancesRequest unmarshallerDelegate:[EC2RequestSpotInstancesResponseUnmarshaller class]];
}

-(EC2CreateTagsResponse *)createTags:(EC2CreateTagsRequest *)createTagsRequest
{
    AmazonServiceRequest *request = [EC2CreateTagsRequestMarshaller createRequest:createTagsRequest];

    return (EC2CreateTagsResponse *)[self invoke:request rawRequest:createTagsRequest unmarshallerDelegate:[EC2CreateTagsResponseUnmarshaller class]];
}

-(EC2DescribeVolumeAttributeResponse *)describeVolumeAttribute:(EC2DescribeVolumeAttributeRequest *)describeVolumeAttributeRequest
{
    AmazonServiceRequest *request = [EC2DescribeVolumeAttributeRequestMarshaller createRequest:describeVolumeAttributeRequest];

    return (EC2DescribeVolumeAttributeResponse *)[self invoke:request rawRequest:describeVolumeAttributeRequest unmarshallerDelegate:[EC2DescribeVolumeAttributeResponseUnmarshaller class]];
}

-(EC2DescribeTagsResponse *)describeTags:(EC2DescribeTagsRequest *)describeTagsRequest
{
    AmazonServiceRequest *request = [EC2DescribeTagsRequestMarshaller createRequest:describeTagsRequest];

    return (EC2DescribeTagsResponse *)[self invoke:request rawRequest:describeTagsRequest unmarshallerDelegate:[EC2DescribeTagsResponseUnmarshaller class]];
}

-(EC2CancelBundleTaskResponse *)cancelBundleTask:(EC2CancelBundleTaskRequest *)cancelBundleTaskRequest
{
    AmazonServiceRequest *request = [EC2CancelBundleTaskRequestMarshaller createRequest:cancelBundleTaskRequest];

    return (EC2CancelBundleTaskResponse *)[self invoke:request rawRequest:cancelBundleTaskRequest unmarshallerDelegate:[EC2CancelBundleTaskResponseUnmarshaller class]];
}

-(EC2CancelSpotInstanceRequestsResponse *)cancelSpotInstanceRequests:(EC2CancelSpotInstanceRequestsRequest *)cancelSpotInstanceRequestsRequest
{
    AmazonServiceRequest *request = [EC2CancelSpotInstanceRequestsRequestMarshaller createRequest:cancelSpotInstanceRequestsRequest];

    return (EC2CancelSpotInstanceRequestsResponse *)[self invoke:request rawRequest:cancelSpotInstanceRequestsRequest unmarshallerDelegate:[EC2CancelSpotInstanceRequestsResponseUnmarshaller class]];
}

-(EC2PurchaseReservedInstancesOfferingResponse *)purchaseReservedInstancesOffering:(EC2PurchaseReservedInstancesOfferingRequest *)purchaseReservedInstancesOfferingRequest
{
    AmazonServiceRequest *request = [EC2PurchaseReservedInstancesOfferingRequestMarshaller createRequest:purchaseReservedInstancesOfferingRequest];

    return (EC2PurchaseReservedInstancesOfferingResponse *)[self invoke:request rawRequest:purchaseReservedInstancesOfferingRequest unmarshallerDelegate:[EC2PurchaseReservedInstancesOfferingResponseUnmarshaller class]];
}

-(EC2ModifySnapshotAttributeResponse *)modifySnapshotAttribute:(EC2ModifySnapshotAttributeRequest *)modifySnapshotAttributeRequest
{
    AmazonServiceRequest *request = [EC2ModifySnapshotAttributeRequestMarshaller createRequest:modifySnapshotAttributeRequest];

    return (EC2ModifySnapshotAttributeResponse *)[self invoke:request rawRequest:modifySnapshotAttributeRequest unmarshallerDelegate:[EC2ModifySnapshotAttributeResponseUnmarshaller class]];
}

-(EC2TerminateInstancesResponse *)terminateInstances:(EC2TerminateInstancesRequest *)terminateInstancesRequest
{
    AmazonServiceRequest *request = [EC2TerminateInstancesRequestMarshaller createRequest:terminateInstancesRequest];

    return (EC2TerminateInstancesResponse *)[self invoke:request rawRequest:terminateInstancesRequest unmarshallerDelegate:[EC2TerminateInstancesResponseUnmarshaller class]];
}

-(EC2DeleteSpotDatafeedSubscriptionResponse *)deleteSpotDatafeedSubscription:(EC2DeleteSpotDatafeedSubscriptionRequest *)deleteSpotDatafeedSubscriptionRequest
{
    AmazonServiceRequest *request = [EC2DeleteSpotDatafeedSubscriptionRequestMarshaller createRequest:deleteSpotDatafeedSubscriptionRequest];

    return (EC2DeleteSpotDatafeedSubscriptionResponse *)[self invoke:request rawRequest:deleteSpotDatafeedSubscriptionRequest unmarshallerDelegate:[EC2DeleteSpotDatafeedSubscriptionResponseUnmarshaller class]];
}

-(EC2DescribeSnapshotAttributeResponse *)describeSnapshotAttribute:(EC2DescribeSnapshotAttributeRequest *)describeSnapshotAttributeRequest
{
    AmazonServiceRequest *request = [EC2DescribeSnapshotAttributeRequestMarshaller createRequest:describeSnapshotAttributeRequest];

    return (EC2DescribeSnapshotAttributeResponse *)[self invoke:request rawRequest:describeSnapshotAttributeRequest unmarshallerDelegate:[EC2DescribeSnapshotAttributeResponseUnmarshaller class]];
}

-(EC2DescribeAddressesResponse *)describeAddresses:(EC2DescribeAddressesRequest *)describeAddressesRequest
{
    AmazonServiceRequest *request = [EC2DescribeAddressesRequestMarshaller createRequest:describeAddressesRequest];

    return (EC2DescribeAddressesResponse *)[self invoke:request rawRequest:describeAddressesRequest unmarshallerDelegate:[EC2DescribeAddressesResponseUnmarshaller class]];
}

-(EC2DescribeImageAttributeResponse *)describeImageAttribute:(EC2DescribeImageAttributeRequest *)describeImageAttributeRequest
{
    AmazonServiceRequest *request = [EC2DescribeImageAttributeRequestMarshaller createRequest:describeImageAttributeRequest];

    return (EC2DescribeImageAttributeResponse *)[self invoke:request rawRequest:describeImageAttributeRequest unmarshallerDelegate:[EC2DescribeImageAttributeResponseUnmarshaller class]];
}

-(EC2DescribeKeyPairsResponse *)describeKeyPairs:(EC2DescribeKeyPairsRequest *)describeKeyPairsRequest
{
    AmazonServiceRequest *request = [EC2DescribeKeyPairsRequestMarshaller createRequest:describeKeyPairsRequest];

    return (EC2DescribeKeyPairsResponse *)[self invoke:request rawRequest:describeKeyPairsRequest unmarshallerDelegate:[EC2DescribeKeyPairsResponseUnmarshaller class]];
}

-(EC2ConfirmProductInstanceResponse *)confirmProductInstance:(EC2ConfirmProductInstanceRequest *)confirmProductInstanceRequest
{
    AmazonServiceRequest *request = [EC2ConfirmProductInstanceRequestMarshaller createRequest:confirmProductInstanceRequest];

    return (EC2ConfirmProductInstanceResponse *)[self invoke:request rawRequest:confirmProductInstanceRequest unmarshallerDelegate:[EC2ConfirmProductInstanceResponseUnmarshaller class]];
}

-(EC2CreateVolumeResponse *)createVolume:(EC2CreateVolumeRequest *)createVolumeRequest
{
    AmazonServiceRequest *request = [EC2CreateVolumeRequestMarshaller createRequest:createVolumeRequest];

    return (EC2CreateVolumeResponse *)[self invoke:request rawRequest:createVolumeRequest unmarshallerDelegate:[EC2CreateVolumeResponseUnmarshaller class]];
}

-(EC2DescribeInstanceStatusResponse *)describeInstanceStatus:(EC2DescribeInstanceStatusRequest *)describeInstanceStatusRequest
{
    AmazonServiceRequest *request = [EC2DescribeInstanceStatusRequestMarshaller createRequest:describeInstanceStatusRequest];

    return (EC2DescribeInstanceStatusResponse *)[self invoke:request rawRequest:describeInstanceStatusRequest unmarshallerDelegate:[EC2DescribeInstanceStatusResponseUnmarshaller class]];
}

-(EC2DescribeReservedInstancesOfferingsResponse *)describeReservedInstancesOfferings:(EC2DescribeReservedInstancesOfferingsRequest *)describeReservedInstancesOfferingsRequest
{
    AmazonServiceRequest *request = [EC2DescribeReservedInstancesOfferingsRequestMarshaller createRequest:describeReservedInstancesOfferingsRequest];

    return (EC2DescribeReservedInstancesOfferingsResponse *)[self invoke:request rawRequest:describeReservedInstancesOfferingsRequest unmarshallerDelegate:[EC2DescribeReservedInstancesOfferingsResponseUnmarshaller class]];
}

-(EC2DeleteSnapshotResponse *)deleteSnapshot:(EC2DeleteSnapshotRequest *)deleteSnapshotRequest
{
    AmazonServiceRequest *request = [EC2DeleteSnapshotRequestMarshaller createRequest:deleteSnapshotRequest];

    return (EC2DeleteSnapshotResponse *)[self invoke:request rawRequest:deleteSnapshotRequest unmarshallerDelegate:[EC2DeleteSnapshotResponseUnmarshaller class]];
}

-(EC2DisassociateAddressResponse *)disassociateAddress:(EC2DisassociateAddressRequest *)disassociateAddressRequest
{
    AmazonServiceRequest *request = [EC2DisassociateAddressRequestMarshaller createRequest:disassociateAddressRequest];

    return (EC2DisassociateAddressResponse *)[self invoke:request rawRequest:disassociateAddressRequest unmarshallerDelegate:[EC2DisassociateAddressResponseUnmarshaller class]];
}

-(EC2CreatePlacementGroupResponse *)createPlacementGroup:(EC2CreatePlacementGroupRequest *)createPlacementGroupRequest
{
    AmazonServiceRequest *request = [EC2CreatePlacementGroupRequestMarshaller createRequest:createPlacementGroupRequest];

    return (EC2CreatePlacementGroupResponse *)[self invoke:request rawRequest:createPlacementGroupRequest unmarshallerDelegate:[EC2CreatePlacementGroupResponseUnmarshaller class]];
}

-(EC2BundleInstanceResponse *)bundleInstance:(EC2BundleInstanceRequest *)bundleInstanceRequest
{
    AmazonServiceRequest *request = [EC2BundleInstanceRequestMarshaller createRequest:bundleInstanceRequest];

    return (EC2BundleInstanceResponse *)[self invoke:request rawRequest:bundleInstanceRequest unmarshallerDelegate:[EC2BundleInstanceResponseUnmarshaller class]];
}

-(EC2DeletePlacementGroupResponse *)deletePlacementGroup:(EC2DeletePlacementGroupRequest *)deletePlacementGroupRequest
{
    AmazonServiceRequest *request = [EC2DeletePlacementGroupRequestMarshaller createRequest:deletePlacementGroupRequest];

    return (EC2DeletePlacementGroupResponse *)[self invoke:request rawRequest:deletePlacementGroupRequest unmarshallerDelegate:[EC2DeletePlacementGroupResponseUnmarshaller class]];
}

-(EC2CopySnapshotResponse *)doCopySnapshot:(EC2CopySnapshotRequest *)copySnapshotRequest
{
    AmazonServiceRequest *request = [EC2CopySnapshotRequestMarshaller createRequest:copySnapshotRequest];

    return (EC2CopySnapshotResponse *)[self invoke:request rawRequest:copySnapshotRequest unmarshallerDelegate:[EC2CopySnapshotResponseUnmarshaller class]];
}

-(EC2AllocateAddressResponse *)allocateAddress:(EC2AllocateAddressRequest *)allocateAddressRequest
{
    AmazonServiceRequest *request = [EC2AllocateAddressRequestMarshaller createRequest:allocateAddressRequest];

    return (EC2AllocateAddressResponse *)[self invoke:request rawRequest:allocateAddressRequest unmarshallerDelegate:[EC2AllocateAddressResponseUnmarshaller class]];
}

-(EC2ReleaseAddressResponse *)releaseAddress:(EC2ReleaseAddressRequest *)releaseAddressRequest
{
    AmazonServiceRequest *request = [EC2ReleaseAddressRequestMarshaller createRequest:releaseAddressRequest];

    return (EC2ReleaseAddressResponse *)[self invoke:request rawRequest:releaseAddressRequest unmarshallerDelegate:[EC2ReleaseAddressResponseUnmarshaller class]];
}

-(EC2ResetInstanceAttributeResponse *)resetInstanceAttribute:(EC2ResetInstanceAttributeRequest *)resetInstanceAttributeRequest
{
    AmazonServiceRequest *request = [EC2ResetInstanceAttributeRequestMarshaller createRequest:resetInstanceAttributeRequest];

    return (EC2ResetInstanceAttributeResponse *)[self invoke:request rawRequest:resetInstanceAttributeRequest unmarshallerDelegate:[EC2ResetInstanceAttributeResponseUnmarshaller class]];
}

-(EC2CreateKeyPairResponse *)createKeyPair:(EC2CreateKeyPairRequest *)createKeyPairRequest
{
    AmazonServiceRequest *request = [EC2CreateKeyPairRequestMarshaller createRequest:createKeyPairRequest];

    return (EC2CreateKeyPairResponse *)[self invoke:request rawRequest:createKeyPairRequest unmarshallerDelegate:[EC2CreateKeyPairResponseUnmarshaller class]];
}

-(EC2DescribeSnapshotsResponse *)describeSnapshots:(EC2DescribeSnapshotsRequest *)describeSnapshotsRequest
{
    AmazonServiceRequest *request = [EC2DescribeSnapshotsRequestMarshaller createRequest:describeSnapshotsRequest];

    return (EC2DescribeSnapshotsResponse *)[self invoke:request rawRequest:describeSnapshotsRequest unmarshallerDelegate:[EC2DescribeSnapshotsResponseUnmarshaller class]];
}

-(EC2RegisterImageResponse *)registerImage:(EC2RegisterImageRequest *)registerImageRequest
{
    AmazonServiceRequest *request = [EC2RegisterImageRequestMarshaller createRequest:registerImageRequest];

    return (EC2RegisterImageResponse *)[self invoke:request rawRequest:registerImageRequest unmarshallerDelegate:[EC2RegisterImageResponseUnmarshaller class]];
}



@end

