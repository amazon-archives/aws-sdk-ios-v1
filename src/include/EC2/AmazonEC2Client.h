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
#import "EC2RebootInstancesResponse.h"
#import "EC2RebootInstancesRequest.h"
#import "EC2DescribeReservedInstancesResponse.h"
#import "EC2DescribeReservedInstancesRequest.h"
#import "EC2DescribeAvailabilityZonesResponse.h"
#import "EC2DescribeAvailabilityZonesRequest.h"
#import "EC2DetachVolumeResponse.h"
#import "EC2DetachVolumeRequest.h"
#import "EC2DeleteKeyPairResponse.h"
#import "EC2DeleteKeyPairRequest.h"
#import "EC2UnmonitorInstancesResponse.h"
#import "EC2UnmonitorInstancesRequest.h"
#import "EC2CreateImageResponse.h"
#import "EC2CreateImageRequest.h"
#import "EC2DeleteSecurityGroupResponse.h"
#import "EC2DeleteSecurityGroupRequest.h"
#import "EC2CreateInstanceExportTaskResponse.h"
#import "EC2CreateInstanceExportTaskRequest.h"
#import "EC2GetPasswordDataResponse.h"
#import "EC2GetPasswordDataRequest.h"
#import "EC2StopInstancesResponse.h"
#import "EC2StopInstancesRequest.h"
#import "EC2ImportKeyPairResponse.h"
#import "EC2ImportKeyPairRequest.h"
#import "EC2CreateSecurityGroupResponse.h"
#import "EC2CreateSecurityGroupRequest.h"
#import "EC2DescribeSpotPriceHistoryResponse.h"
#import "EC2DescribeSpotPriceHistoryRequest.h"
#import "EC2DescribeRegionsResponse.h"
#import "EC2DescribeRegionsRequest.h"
#import "EC2CreateReservedInstancesListingResponse.h"
#import "EC2CreateReservedInstancesListingRequest.h"
#import "EC2ResetSnapshotAttributeResponse.h"
#import "EC2ResetSnapshotAttributeRequest.h"
#import "EC2ImportVolumeResponse.h"
#import "EC2ImportVolumeRequest.h"
#import "EC2DescribeSecurityGroupsResponse.h"
#import "EC2DescribeSecurityGroupsRequest.h"
#import "EC2DeregisterImageResponse.h"
#import "EC2DeregisterImageRequest.h"
#import "EC2DescribeSpotDatafeedSubscriptionResponse.h"
#import "EC2DescribeSpotDatafeedSubscriptionRequest.h"
#import "EC2DeleteTagsResponse.h"
#import "EC2DeleteTagsRequest.h"
#import "EC2DescribeAccountAttributesResponse.h"
#import "EC2DescribeAccountAttributesRequest.h"
#import "EC2EnableVolumeIOResponse.h"
#import "EC2EnableVolumeIORequest.h"
#import "EC2AttachVolumeResponse.h"
#import "EC2AttachVolumeRequest.h"
#import "EC2DescribeLicensesResponse.h"
#import "EC2DescribeLicensesRequest.h"
#import "EC2DescribeVolumeStatusResponse.h"
#import "EC2DescribeVolumeStatusRequest.h"
#import "EC2ActivateLicenseResponse.h"
#import "EC2ActivateLicenseRequest.h"
#import "EC2ResetImageAttributeResponse.h"
#import "EC2ResetImageAttributeRequest.h"
#import "EC2CreateSnapshotResponse.h"
#import "EC2CreateSnapshotRequest.h"
#import "EC2DeleteVolumeResponse.h"
#import "EC2DeleteVolumeRequest.h"
#import "EC2DescribeVpcsResponse.h"
#import "EC2DescribeVpcsRequest.h"
#import "EC2CancelConversionTaskResponse.h"
#import "EC2CancelConversionTaskRequest.h"
#import "EC2AssociateAddressResponse.h"
#import "EC2AssociateAddressRequest.h"
#import "EC2DeactivateLicenseResponse.h"
#import "EC2DeactivateLicenseRequest.h"
#import "EC2DescribeExportTasksResponse.h"
#import "EC2DescribeExportTasksRequest.h"
#import "EC2DescribeVolumesResponse.h"
#import "EC2DescribeVolumesRequest.h"
#import "EC2DescribeReservedInstancesListingsResponse.h"
#import "EC2DescribeReservedInstancesListingsRequest.h"
#import "EC2ReportInstanceStatusResponse.h"
#import "EC2ReportInstanceStatusRequest.h"
#import "EC2MonitorInstancesResponse.h"
#import "EC2MonitorInstancesRequest.h"
#import "EC2DescribeBundleTasksResponse.h"
#import "EC2DescribeBundleTasksRequest.h"
#import "EC2ImportInstanceResponse.h"
#import "EC2ImportInstanceRequest.h"
#import "EC2RevokeSecurityGroupIngressResponse.h"
#import "EC2RevokeSecurityGroupIngressRequest.h"
#import "EC2GetConsoleOutputResponse.h"
#import "EC2GetConsoleOutputRequest.h"
#import "EC2ModifyImageAttributeResponse.h"
#import "EC2ModifyImageAttributeRequest.h"
#import "EC2CreateSpotDatafeedSubscriptionResponse.h"
#import "EC2CreateSpotDatafeedSubscriptionRequest.h"
#import "EC2DescribeConversionTasksResponse.h"
#import "EC2DescribeConversionTasksRequest.h"
#import "EC2DescribeInstanceAttributeResponse.h"
#import "EC2DescribeInstanceAttributeRequest.h"
#import "EC2DescribeSubnetsResponse.h"
#import "EC2DescribeSubnetsRequest.h"
#import "EC2RunInstancesResponse.h"
#import "EC2RunInstancesRequest.h"
#import "EC2DescribePlacementGroupsResponse.h"
#import "EC2DescribePlacementGroupsRequest.h"
#import "EC2DescribeInstancesResponse.h"
#import "EC2DescribeInstancesRequest.h"
#import "EC2ModifyVolumeAttributeResponse.h"
#import "EC2ModifyVolumeAttributeRequest.h"
#import "EC2DescribeImagesResponse.h"
#import "EC2DescribeImagesRequest.h"
#import "EC2StartInstancesResponse.h"
#import "EC2StartInstancesRequest.h"
#import "EC2CancelReservedInstancesListingResponse.h"
#import "EC2CancelReservedInstancesListingRequest.h"
#import "EC2ModifyInstanceAttributeResponse.h"
#import "EC2ModifyInstanceAttributeRequest.h"
#import "EC2AuthorizeSecurityGroupIngressResponse.h"
#import "EC2AuthorizeSecurityGroupIngressRequest.h"
#import "EC2DescribeSpotInstanceRequestsResponse.h"
#import "EC2DescribeSpotInstanceRequestsRequest.h"
#import "EC2CancelExportTaskResponse.h"
#import "EC2CancelExportTaskRequest.h"
#import "EC2CopyImageResponse.h"
#import "EC2CopyImageRequest.h"
#import "EC2RequestSpotInstancesResponse.h"
#import "EC2RequestSpotInstancesRequest.h"
#import "EC2CreateTagsResponse.h"
#import "EC2CreateTagsRequest.h"
#import "EC2DescribeVolumeAttributeResponse.h"
#import "EC2DescribeVolumeAttributeRequest.h"
#import "EC2DescribeTagsResponse.h"
#import "EC2DescribeTagsRequest.h"
#import "EC2CancelBundleTaskResponse.h"
#import "EC2CancelBundleTaskRequest.h"
#import "EC2CancelSpotInstanceRequestsResponse.h"
#import "EC2CancelSpotInstanceRequestsRequest.h"
#import "EC2PurchaseReservedInstancesOfferingResponse.h"
#import "EC2PurchaseReservedInstancesOfferingRequest.h"
#import "EC2ModifySnapshotAttributeResponse.h"
#import "EC2ModifySnapshotAttributeRequest.h"
#import "EC2TerminateInstancesResponse.h"
#import "EC2TerminateInstancesRequest.h"
#import "EC2DeleteSpotDatafeedSubscriptionResponse.h"
#import "EC2DeleteSpotDatafeedSubscriptionRequest.h"
#import "EC2DescribeSnapshotAttributeResponse.h"
#import "EC2DescribeSnapshotAttributeRequest.h"
#import "EC2DescribeAddressesResponse.h"
#import "EC2DescribeAddressesRequest.h"
#import "EC2DescribeImageAttributeResponse.h"
#import "EC2DescribeImageAttributeRequest.h"
#import "EC2DescribeKeyPairsResponse.h"
#import "EC2DescribeKeyPairsRequest.h"
#import "EC2ConfirmProductInstanceResponse.h"
#import "EC2ConfirmProductInstanceRequest.h"
#import "EC2CreateVolumeResponse.h"
#import "EC2CreateVolumeRequest.h"
#import "EC2DescribeInstanceStatusResponse.h"
#import "EC2DescribeInstanceStatusRequest.h"
#import "EC2DescribeReservedInstancesOfferingsResponse.h"
#import "EC2DescribeReservedInstancesOfferingsRequest.h"
#import "EC2DeleteSnapshotResponse.h"
#import "EC2DeleteSnapshotRequest.h"
#import "EC2DisassociateAddressResponse.h"
#import "EC2DisassociateAddressRequest.h"
#import "EC2CreatePlacementGroupResponse.h"
#import "EC2CreatePlacementGroupRequest.h"
#import "EC2BundleInstanceResponse.h"
#import "EC2BundleInstanceRequest.h"
#import "EC2DeletePlacementGroupResponse.h"
#import "EC2DeletePlacementGroupRequest.h"
#import "EC2CopySnapshotResponse.h"
#import "EC2CopySnapshotRequest.h"
#import "EC2AllocateAddressResponse.h"
#import "EC2AllocateAddressRequest.h"
#import "EC2ReleaseAddressResponse.h"
#import "EC2ReleaseAddressRequest.h"
#import "EC2ResetInstanceAttributeResponse.h"
#import "EC2ResetInstanceAttributeRequest.h"
#import "EC2CreateKeyPairResponse.h"
#import "EC2CreateKeyPairRequest.h"
#import "EC2DescribeSnapshotsResponse.h"
#import "EC2DescribeSnapshotsRequest.h"
#import "EC2RegisterImageResponse.h"
#import "EC2RegisterImageRequest.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonWebServiceClient.h>
#else
#import "../AmazonWebServiceClient.h"
#endif

/** \defgroup EC2 Amazon EC2 */

/** <summary>
 * Interface for accessing AmazonEC2.
 *
 *  Amazon EC2 <p>
 * Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable compute capacity in the cloud. It is designed to make web-scale computing easier for developers.
 * </p>
 * <p>
 * Amazon EC2's simple web service interface allows you to obtain and configure capacity with minimal friction. It provides you with complete control of your computing resources and lets you run on
 * Amazon's proven computing environment. Amazon EC2 reduces the time required to obtain and boot new server instances to minutes, allowing you to quickly scale capacity, both up and down, as your
 * computing requirements change. Amazon EC2 changes the economics of computing by allowing you to pay only for capacity that you actually use. Amazon EC2 provides developers the tools to build failure
 * resilient applications and isolate themselves from common failure scenarios.
 * </p>
 * <p>
 * Visit <a href="http://aws.amazon.com/ec2/"> http://aws.amazon.com/ec2/ </a> for more information.
 * </p>
 * </summary>
 *
 * See our blog to learn more about Managing Credentials in Mobile Applications.
 * @see http://mobile.awsblog.com/post/Tx31X75XISXHRH8/Managing-Credentials-in-Mobile-Applications
 */
@interface AmazonEC2Client:AmazonWebServiceClient
{
}


/**
 * <p>
 * The RebootInstances operation requests a reboot of one or more instances. This operation is asynchronous; it only
 * queues a request to reboot the specified instance(s). The operation will succeed if the instances are valid and belong
 * to the user. Requests to reboot terminated instances are ignored.
 * </p>
 *
 * @param rebootInstancesRequest Container for the necessary parameters to execute the RebootInstances service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2RebootInstancesRequest
 * @see EC2RebootInstancesResponse
 */
-(EC2RebootInstancesResponse *)rebootInstances:(EC2RebootInstancesRequest *)rebootInstancesRequest;


/**
 * <p>
 * The DescribeReservedInstances operation describes Reserved Instances that were purchased for use with your account.
 * </p>
 *
 * @param describeReservedInstancesRequest Container for the necessary parameters to execute the DescribeReservedInstances
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeReservedInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeReservedInstancesRequest
 * @see EC2DescribeReservedInstancesResponse
 */
-(EC2DescribeReservedInstancesResponse *)describeReservedInstances:(EC2DescribeReservedInstancesRequest *)describeReservedInstancesRequest;


/**
 * <p>
 * The DescribeAvailabilityZones operation describes availability zones that are currently available to the account and
 * their states.
 * </p>
 * <p>
 * Availability zones are not the same across accounts. The availability zone us-east-1a for account A is not necessarily
 * the same as us-east-1a for account B. Zone assignments are mapped independently for each account.
 * </p>
 *
 * @param describeAvailabilityZonesRequest Container for the necessary parameters to execute the DescribeAvailabilityZones
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeAvailabilityZones service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeAvailabilityZonesRequest
 * @see EC2DescribeAvailabilityZonesResponse
 */
-(EC2DescribeAvailabilityZonesResponse *)describeAvailabilityZones:(EC2DescribeAvailabilityZonesRequest *)describeAvailabilityZonesRequest;


/**
 * <p>
 * Detach a previously attached volume from a running instance.
 * </p>
 *
 * @param detachVolumeRequest Container for the necessary parameters to execute the DetachVolume service method on
 *           AmazonEC2.
 *
 * @return The response from the DetachVolume service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DetachVolumeRequest
 * @see EC2DetachVolumeResponse
 */
-(EC2DetachVolumeResponse *)detachVolume:(EC2DetachVolumeRequest *)detachVolumeRequest;


/**
 * <p>
 * The DeleteKeyPair operation deletes a key pair.
 * </p>
 *
 * @param deleteKeyPairRequest Container for the necessary parameters to execute the DeleteKeyPair service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeleteKeyPairRequest
 * @see EC2DeleteKeyPairResponse
 */
-(EC2DeleteKeyPairResponse *)deleteKeyPair:(EC2DeleteKeyPairRequest *)deleteKeyPairRequest;


/**
 * <p>
 * Disables monitoring for a running instance.
 * </p>
 *
 * @param unmonitorInstancesRequest Container for the necessary parameters to execute the UnmonitorInstances service method
 *           on AmazonEC2.
 *
 * @return The response from the UnmonitorInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2UnmonitorInstancesRequest
 * @see EC2UnmonitorInstancesResponse
 */
-(EC2UnmonitorInstancesResponse *)unmonitorInstances:(EC2UnmonitorInstancesRequest *)unmonitorInstancesRequest;


/**
 * <p>
 * Creates an Amazon EBS-backed AMI from a "running" or "stopped" instance. AMIs that use an Amazon EBS root device boot
 * faster than AMIs that use instance stores. They can be up to 1 TiB in size, use storage that persists on instance
 * failure, and can be stopped and started.
 * </p>
 *
 * @param createImageRequest Container for the necessary parameters to execute the CreateImage service method on AmazonEC2.
 *
 * @return The response from the CreateImage service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateImageRequest
 * @see EC2CreateImageResponse
 */
-(EC2CreateImageResponse *)createImage:(EC2CreateImageRequest *)createImageRequest;


/**
 * <p>
 * The DeleteSecurityGroup operation deletes a security group.
 * </p>
 * <p>
 * <b>NOTE:</b> If you attempt to delete a security group that contains instances, a fault is returned. If you attempt to
 * delete a security group that is referenced by another security group, a fault is returned. For example, if security
 * group B has a rule that allows access from security group A, security group A cannot be deleted until the allow rule is
 * removed.
 * </p>
 *
 * @param deleteSecurityGroupRequest Container for the necessary parameters to execute the DeleteSecurityGroup service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeleteSecurityGroupRequest
 * @see EC2DeleteSecurityGroupResponse
 */
-(EC2DeleteSecurityGroupResponse *)deleteSecurityGroup:(EC2DeleteSecurityGroupRequest *)deleteSecurityGroupRequest;


/**
 *
 * @param createInstanceExportTaskRequest Container for the necessary parameters to execute the CreateInstanceExportTask
 *           service method on AmazonEC2.
 *
 * @return The response from the CreateInstanceExportTask service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateInstanceExportTaskRequest
 * @see EC2CreateInstanceExportTaskResponse
 */
-(EC2CreateInstanceExportTaskResponse *)createInstanceExportTask:(EC2CreateInstanceExportTaskRequest *)createInstanceExportTaskRequest;


/**
 * <p>
 * Retrieves the encrypted administrator password for the instances running Windows.
 * </p>
 * <p>
 * <b>NOTE:</b> The Windows password is only generated the first time an AMI is launched. It is not generated for rebundled
 * AMIs or after the password is changed on an instance. The password is encrypted using the key pair that you provided.
 * </p>
 *
 * @param getPasswordDataRequest Container for the necessary parameters to execute the GetPasswordData service method on
 *           AmazonEC2.
 *
 * @return The response from the GetPasswordData service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2GetPasswordDataRequest
 * @see EC2GetPasswordDataResponse
 */
-(EC2GetPasswordDataResponse *)getPasswordData:(EC2GetPasswordDataRequest *)getPasswordDataRequest;


/**
 * <p>
 * Stops an instance that uses an Amazon EBS volume as its root device. Instances that use Amazon EBS volumes as their
 * root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you
 * are not billed for hourly instance usage. However, your root partition Amazon EBS volume remains, continues to persist
 * your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time.
 * </p>
 * <p>
 * <b>NOTE:</b> Before stopping an instance, make sure it is in a state from which it can be restarted. Stopping an
 * instance does not preserve data stored in RAM. Performing this operation on an instance that uses an instance store as
 * its root device returns an error.
 * </p>
 *
 * @param stopInstancesRequest Container for the necessary parameters to execute the StopInstances service method on
 *           AmazonEC2.
 *
 * @return The response from the StopInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2StopInstancesRequest
 * @see EC2StopInstancesResponse
 */
-(EC2StopInstancesResponse *)stopInstances:(EC2StopInstancesRequest *)stopInstancesRequest;


/**
 * <p>
 * Imports the public key from an RSA key pair created with a third-party tool. This operation differs from CreateKeyPair
 * as the private key is never transferred between the caller and AWS servers.
 * </p>
 * <p>
 * RSA key pairs are easily created on Microsoft Windows and Linux OS systems using the ssh-keygen command line tool
 * provided with the standard OpenSSH installation. Standard library support for RSA key pair creation is also available
 * for Java, Ruby, Python, and many other programming languages.
 * </p>
 * <p>
 * The following formats are supported:
 * </p>
 *
 * <ul>
 * <li> OpenSSH public key format, </li>
 * <li> Base64 encoded DER format. </li>
 * <li> SSH public key file format as specified in <a href="http://tools.ietf.org/html/rfc4716"> RFC4716 </a> . </li>
 *
 * </ul>
 *
 * @param importKeyPairRequest Container for the necessary parameters to execute the ImportKeyPair service method on
 *           AmazonEC2.
 *
 * @return The response from the ImportKeyPair service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ImportKeyPairRequest
 * @see EC2ImportKeyPairResponse
 */
-(EC2ImportKeyPairResponse *)importKeyPair:(EC2ImportKeyPairRequest *)importKeyPairRequest;


/**
 * <p>
 * The CreateSecurityGroup operation creates a new security group.
 * </p>
 * <p>
 * Every instance is launched in a security group. If no security group is specified during launch, the instances are
 * launched in the default security group. Instances within the same security group have unrestricted network access to
 * each other. Instances will reject network access attempts from other instances in a different security group. As the
 * owner of instances you can grant or revoke specific permissions using the AuthorizeSecurityGroupIngress and
 * RevokeSecurityGroupIngress operations.
 * </p>
 *
 * @param createSecurityGroupRequest Container for the necessary parameters to execute the CreateSecurityGroup service
 *           method on AmazonEC2.
 *
 * @return The response from the CreateSecurityGroup service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateSecurityGroupRequest
 * @see EC2CreateSecurityGroupResponse
 */
-(EC2CreateSecurityGroupResponse *)createSecurityGroup:(EC2CreateSecurityGroupRequest *)createSecurityGroupRequest;


/**
 * <p>
 * Describes the Spot Price history.
 * </p>
 * <p>
 * Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum price that you specify exceeds the
 * current Spot Price. Amazon EC2 periodically sets the Spot Price based on available Spot Instance capacity and current
 * spot instance requests.
 * </p>
 * <p>
 * For conceptual information about Spot Instances, refer to the Amazon Elastic Compute Cloud Developer Guide or Amazon
 * Elastic Compute Cloud User Guide .
 *
 * </p>
 *
 * @param describeSpotPriceHistoryRequest Container for the necessary parameters to execute the DescribeSpotPriceHistory
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeSpotPriceHistory service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeSpotPriceHistoryRequest
 * @see EC2DescribeSpotPriceHistoryResponse
 */
-(EC2DescribeSpotPriceHistoryResponse *)describeSpotPriceHistory:(EC2DescribeSpotPriceHistoryRequest *)describeSpotPriceHistoryRequest;


/**
 * <p>
 * The DescribeRegions operation describes regions zones that are currently available to the account.
 * </p>
 *
 * @param describeRegionsRequest Container for the necessary parameters to execute the DescribeRegions service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeRegions service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeRegionsRequest
 * @see EC2DescribeRegionsResponse
 */
-(EC2DescribeRegionsResponse *)describeRegions:(EC2DescribeRegionsRequest *)describeRegionsRequest;


/**
 *
 * @param createReservedInstancesListingRequest Container for the necessary parameters to execute the
 *           CreateReservedInstancesListing service method on AmazonEC2.
 *
 * @return The response from the CreateReservedInstancesListing service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateReservedInstancesListingRequest
 * @see EC2CreateReservedInstancesListingResponse
 */
-(EC2CreateReservedInstancesListingResponse *)createReservedInstancesListing:(EC2CreateReservedInstancesListingRequest *)createReservedInstancesListingRequest;


/**
 * <p>
 * Resets permission settings for the specified snapshot.
 * </p>
 *
 * @param resetSnapshotAttributeRequest Container for the necessary parameters to execute the ResetSnapshotAttribute
 *           service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ResetSnapshotAttributeRequest
 * @see EC2ResetSnapshotAttributeResponse
 */
-(EC2ResetSnapshotAttributeResponse *)resetSnapshotAttribute:(EC2ResetSnapshotAttributeRequest *)resetSnapshotAttributeRequest;


/**
 *
 * @param importVolumeRequest Container for the necessary parameters to execute the ImportVolume service method on
 *           AmazonEC2.
 *
 * @return The response from the ImportVolume service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ImportVolumeRequest
 * @see EC2ImportVolumeResponse
 */
-(EC2ImportVolumeResponse *)importVolume:(EC2ImportVolumeRequest *)importVolumeRequest;


/**
 * <p>
 * The DescribeSecurityGroups operation returns information about security groups that you own.
 * </p>
 * <p>
 * If you specify security group names, information about those security group is returned. Otherwise, information for all
 * security group is returned. If you specify a group that does not exist, a fault is returned.
 * </p>
 *
 * @param describeSecurityGroupsRequest Container for the necessary parameters to execute the DescribeSecurityGroups
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeSecurityGroups service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeSecurityGroupsRequest
 * @see EC2DescribeSecurityGroupsResponse
 */
-(EC2DescribeSecurityGroupsResponse *)describeSecurityGroups:(EC2DescribeSecurityGroupsRequest *)describeSecurityGroupsRequest;


/**
 * <p>
 * The DeregisterImage operation deregisters an AMI. Once deregistered, instances of the AMI can no longer be launched.
 * </p>
 *
 * @param deregisterImageRequest Container for the necessary parameters to execute the DeregisterImage service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeregisterImageRequest
 * @see EC2DeregisterImageResponse
 */
-(EC2DeregisterImageResponse *)deregisterImage:(EC2DeregisterImageRequest *)deregisterImageRequest;


/**
 * <p>
 * Describes the data feed for Spot Instances.
 * </p>
 * <p>
 * For conceptual information about Spot Instances, refer to the Amazon Elastic Compute Cloud Developer Guide or Amazon
 * Elastic Compute Cloud User Guide .
 *
 * </p>
 *
 * @param describeSpotDatafeedSubscriptionRequest Container for the necessary parameters to execute the
 *           DescribeSpotDatafeedSubscription service method on AmazonEC2.
 *
 * @return The response from the DescribeSpotDatafeedSubscription service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeSpotDatafeedSubscriptionRequest
 * @see EC2DescribeSpotDatafeedSubscriptionResponse
 */
-(EC2DescribeSpotDatafeedSubscriptionResponse *)describeSpotDatafeedSubscription:(EC2DescribeSpotDatafeedSubscriptionRequest *)describeSpotDatafeedSubscriptionRequest;


/**
 * <p>
 * Deletes tags from the specified Amazon EC2 resources.
 * </p>
 *
 * @param deleteTagsRequest Container for the necessary parameters to execute the DeleteTags service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeleteTagsRequest
 * @see EC2DeleteTagsResponse
 */
-(EC2DeleteTagsResponse *)deleteTags:(EC2DeleteTagsRequest *)deleteTagsRequest;


/**
 *
 * @param describeAccountAttributesRequest Container for the necessary parameters to execute the DescribeAccountAttributes
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeAccountAttributes service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeAccountAttributesRequest
 * @see EC2DescribeAccountAttributesResponse
 */
-(EC2DescribeAccountAttributesResponse *)describeAccountAttributes:(EC2DescribeAccountAttributesRequest *)describeAccountAttributesRequest;


/**
 * <p>
 * Enable IO on the volume after an event has occured.
 * </p>
 *
 * @param enableVolumeIORequest Container for the necessary parameters to execute the EnableVolumeIO service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2EnableVolumeIORequest
 * @see EC2EnableVolumeIOResponse
 */
-(EC2EnableVolumeIOResponse *)enableVolumeIO:(EC2EnableVolumeIORequest *)enableVolumeIORequest;


/**
 * <p>
 * Attach a previously created volume to a running instance.
 * </p>
 *
 * @param attachVolumeRequest Container for the necessary parameters to execute the AttachVolume service method on
 *           AmazonEC2.
 *
 * @return The response from the AttachVolume service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2AttachVolumeRequest
 * @see EC2AttachVolumeResponse
 */
-(EC2AttachVolumeResponse *)attachVolume:(EC2AttachVolumeRequest *)attachVolumeRequest;


/**
 * <p>
 * Provides details of a user's registered licenses. Zero or more IDs may be specified on the call. When one or more
 * license IDs are specified, only data for the specified IDs are returned.
 * </p>
 *
 * @param describeLicensesRequest Container for the necessary parameters to execute the DescribeLicenses service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeLicenses service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeLicensesRequest
 * @see EC2DescribeLicensesResponse
 */
-(EC2DescribeLicensesResponse *)describeLicenses:(EC2DescribeLicensesRequest *)describeLicensesRequest;


/**
 * <p>
 * Describes the status of a volume.
 * </p>
 *
 * @param describeVolumeStatusRequest Container for the necessary parameters to execute the DescribeVolumeStatus service
 *           method on AmazonEC2.
 *
 * @return The response from the DescribeVolumeStatus service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeVolumeStatusRequest
 * @see EC2DescribeVolumeStatusResponse
 */
-(EC2DescribeVolumeStatusResponse *)describeVolumeStatus:(EC2DescribeVolumeStatusRequest *)describeVolumeStatusRequest;


/**
 * <p>
 * Activates a specific number of licenses for a 90-day period. Activations can be done against a specific license ID.
 * </p>
 *
 * @param activateLicenseRequest Container for the necessary parameters to execute the ActivateLicense service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ActivateLicenseRequest
 * @see EC2ActivateLicenseResponse
 */
-(EC2ActivateLicenseResponse *)activateLicense:(EC2ActivateLicenseRequest *)activateLicenseRequest;


/**
 * <p>
 * The ResetImageAttribute operation resets an attribute of an AMI to its default value.
 * </p>
 * <p>
 * <b>NOTE:</b> The productCodes attribute cannot be reset.
 * </p>
 *
 * @param resetImageAttributeRequest Container for the necessary parameters to execute the ResetImageAttribute service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ResetImageAttributeRequest
 * @see EC2ResetImageAttributeResponse
 */
-(EC2ResetImageAttributeResponse *)resetImageAttribute:(EC2ResetImageAttributeRequest *)resetImageAttributeRequest;


/**
 * <p>
 * Create a snapshot of the volume identified by volume ID. A volume does not have to be detached at the time the snapshot
 * is taken.
 * </p>
 * <p>
 * <b>NOTE:</b> Snapshot creation requires that the system is in a consistent state. For instance, this means that if
 * taking a snapshot of a database, the tables must be read-only locked to ensure that the snapshot will not contain a
 * corrupted version of the database. Therefore, be careful when using this API to ensure that the system remains in the
 * consistent state until the create snapshot status has returned.
 * </p>
 *
 * @param createSnapshotRequest Container for the necessary parameters to execute the CreateSnapshot service method on
 *           AmazonEC2.
 *
 * @return The response from the CreateSnapshot service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateSnapshotRequest
 * @see EC2CreateSnapshotResponse
 */
-(EC2CreateSnapshotResponse *)createSnapshot:(EC2CreateSnapshotRequest *)createSnapshotRequest;


/**
 * <p>
 * Deletes a previously created volume. Once successfully deleted, a new volume can be created with the same name.
 * </p>
 *
 * @param deleteVolumeRequest Container for the necessary parameters to execute the DeleteVolume service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeleteVolumeRequest
 * @see EC2DeleteVolumeResponse
 */
-(EC2DeleteVolumeResponse *)deleteVolume:(EC2DeleteVolumeRequest *)deleteVolumeRequest;


/**
 * <p>
 * Gives you information about your VPCs. You can filter the results to return information only about VPCs that match
 * criteria you specify.
 * </p>
 * <p>
 * For example, you could ask to get information about a particular VPC or VPCs (or all your VPCs) only if the VPC's state
 * is available. You can specify multiple filters (e.g., the VPC uses one of several sets of DHCP options, and the VPC's
 * state is available). The result includes information for a particular VPC only if the VPC matches all your filters.
 * </p>
 * <p>
 * If there's no match, no special message is returned; the response is simply empty. The following table shows the
 * available filters.
 * </p>
 *
 * @param describeVpcsRequest Container for the necessary parameters to execute the DescribeVpcs service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeVpcs service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeVpcsRequest
 * @see EC2DescribeVpcsResponse
 */
-(EC2DescribeVpcsResponse *)describeVpcs:(EC2DescribeVpcsRequest *)describeVpcsRequest;


/**
 *
 * @param cancelConversionTaskRequest Container for the necessary parameters to execute the CancelConversionTask service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CancelConversionTaskRequest
 * @see EC2CancelConversionTaskResponse
 */
-(EC2CancelConversionTaskResponse *)cancelConversionTask:(EC2CancelConversionTaskRequest *)cancelConversionTaskRequest;


/**
 * <p>
 * The AssociateAddress operation associates an elastic IP address with an instance.
 * </p>
 * <p>
 * If the IP address is currently assigned to another instance, the IP address is assigned to the new instance. This is an
 * idempotent operation. If you enter it more than once, Amazon EC2 does not return an error.
 * </p>
 *
 * @param associateAddressRequest Container for the necessary parameters to execute the AssociateAddress service method on
 *           AmazonEC2.
 *
 * @return The response from the AssociateAddress service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2AssociateAddressRequest
 * @see EC2AssociateAddressResponse
 */
-(EC2AssociateAddressResponse *)associateAddress:(EC2AssociateAddressRequest *)associateAddressRequest;


/**
 * <p>
 * Deactivates a specific number of licenses. Deactivations can be done against a specific license ID after they have
 * persisted for at least a 90-day period.
 * </p>
 *
 * @param deactivateLicenseRequest Container for the necessary parameters to execute the DeactivateLicense service method
 *           on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeactivateLicenseRequest
 * @see EC2DeactivateLicenseResponse
 */
-(EC2DeactivateLicenseResponse *)deactivateLicense:(EC2DeactivateLicenseRequest *)deactivateLicenseRequest;


/**
 *
 * @param describeExportTasksRequest Container for the necessary parameters to execute the DescribeExportTasks service
 *           method on AmazonEC2.
 *
 * @return The response from the DescribeExportTasks service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeExportTasksRequest
 * @see EC2DescribeExportTasksResponse
 */
-(EC2DescribeExportTasksResponse *)describeExportTasks:(EC2DescribeExportTasksRequest *)describeExportTasksRequest;


/**
 * <p>
 * Describes the status of the indicated volume or, in lieu of any specified, all volumes belonging to the caller. Volumes
 * that have been deleted are not described.
 * </p>
 *
 * @param describeVolumesRequest Container for the necessary parameters to execute the DescribeVolumes service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeVolumes service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeVolumesRequest
 * @see EC2DescribeVolumesResponse
 */
-(EC2DescribeVolumesResponse *)describeVolumes:(EC2DescribeVolumesRequest *)describeVolumesRequest;


/**
 *
 * @param describeReservedInstancesListingsRequest Container for the necessary parameters to execute the
 *           DescribeReservedInstancesListings service method on AmazonEC2.
 *
 * @return The response from the DescribeReservedInstancesListings service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeReservedInstancesListingsRequest
 * @see EC2DescribeReservedInstancesListingsResponse
 */
-(EC2DescribeReservedInstancesListingsResponse *)describeReservedInstancesListings:(EC2DescribeReservedInstancesListingsRequest *)describeReservedInstancesListingsRequest;


/**
 *
 * @param reportInstanceStatusRequest Container for the necessary parameters to execute the ReportInstanceStatus service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ReportInstanceStatusRequest
 * @see EC2ReportInstanceStatusResponse
 */
-(EC2ReportInstanceStatusResponse *)reportInstanceStatus:(EC2ReportInstanceStatusRequest *)reportInstanceStatusRequest;


/**
 * <p>
 * Enables monitoring for a running instance.
 * </p>
 *
 * @param monitorInstancesRequest Container for the necessary parameters to execute the MonitorInstances service method on
 *           AmazonEC2.
 *
 * @return The response from the MonitorInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2MonitorInstancesRequest
 * @see EC2MonitorInstancesResponse
 */
-(EC2MonitorInstancesResponse *)monitorInstances:(EC2MonitorInstancesRequest *)monitorInstancesRequest;


/**
 * <p>
 * The DescribeBundleTasks operation describes in-progress and recent bundle tasks. Complete and failed tasks are removed
 * from the list a short time after completion. If no bundle ids are given, all bundle tasks are returned.
 * </p>
 *
 * @param describeBundleTasksRequest Container for the necessary parameters to execute the DescribeBundleTasks service
 *           method on AmazonEC2.
 *
 * @return The response from the DescribeBundleTasks service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeBundleTasksRequest
 * @see EC2DescribeBundleTasksResponse
 */
-(EC2DescribeBundleTasksResponse *)describeBundleTasks:(EC2DescribeBundleTasksRequest *)describeBundleTasksRequest;


/**
 *
 * @param importInstanceRequest Container for the necessary parameters to execute the ImportInstance service method on
 *           AmazonEC2.
 *
 * @return The response from the ImportInstance service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ImportInstanceRequest
 * @see EC2ImportInstanceResponse
 */
-(EC2ImportInstanceResponse *)importInstance:(EC2ImportInstanceRequest *)importInstanceRequest;


/**
 * <p>
 * The RevokeSecurityGroupIngress operation revokes permissions from a security group. The permissions used to revoke must
 * be specified using the same values used to grant the permissions.
 * </p>
 * <p>
 * Permissions are specified by IP protocol (TCP, UDP, or ICMP), the source of the request (by IP range or an Amazon EC2
 * user-group pair), the source and destination port ranges (for TCP and UDP), and the ICMP codes and types (for ICMP).
 * </p>
 * <p>
 * Permission changes are quickly propagated to instances within the security group. However, depending on the number of
 * instances in the group, a small delay might occur.
 * </p>
 *
 * @param revokeSecurityGroupIngressRequest Container for the necessary parameters to execute the
 *           RevokeSecurityGroupIngress service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2RevokeSecurityGroupIngressRequest
 * @see EC2RevokeSecurityGroupIngressResponse
 */
-(EC2RevokeSecurityGroupIngressResponse *)revokeSecurityGroupIngress:(EC2RevokeSecurityGroupIngressRequest *)revokeSecurityGroupIngressRequest;


/**
 * <p>
 * The GetConsoleOutput operation retrieves console output for the specified instance.
 * </p>
 * <p>
 * Instance console output is buffered and posted shortly after instance boot, reboot, and termination. Amazon EC2
 * preserves the most recent 64 KB output which will be available for at least one hour after the most recent post.
 * </p>
 *
 * @param getConsoleOutputRequest Container for the necessary parameters to execute the GetConsoleOutput service method on
 *           AmazonEC2.
 *
 * @return The response from the GetConsoleOutput service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2GetConsoleOutputRequest
 * @see EC2GetConsoleOutputResponse
 */
-(EC2GetConsoleOutputResponse *)getConsoleOutput:(EC2GetConsoleOutputRequest *)getConsoleOutputRequest;


/**
 * <p>
 * The ModifyImageAttribute operation modifies an attribute of an AMI.
 * </p>
 *
 * @param modifyImageAttributeRequest Container for the necessary parameters to execute the ModifyImageAttribute service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ModifyImageAttributeRequest
 * @see EC2ModifyImageAttributeResponse
 */
-(EC2ModifyImageAttributeResponse *)modifyImageAttribute:(EC2ModifyImageAttributeRequest *)modifyImageAttributeRequest;


/**
 * <p>
 * Creates the data feed for Spot Instances, enabling you to view Spot Instance usage logs. You can create one data feed
 * per account.
 * </p>
 * <p>
 * For conceptual information about Spot Instances, refer to the Amazon Elastic Compute Cloud Developer Guide or Amazon
 * Elastic Compute Cloud User Guide .
 *
 * </p>
 *
 * @param createSpotDatafeedSubscriptionRequest Container for the necessary parameters to execute the
 *           CreateSpotDatafeedSubscription service method on AmazonEC2.
 *
 * @return The response from the CreateSpotDatafeedSubscription service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateSpotDatafeedSubscriptionRequest
 * @see EC2CreateSpotDatafeedSubscriptionResponse
 */
-(EC2CreateSpotDatafeedSubscriptionResponse *)createSpotDatafeedSubscription:(EC2CreateSpotDatafeedSubscriptionRequest *)createSpotDatafeedSubscriptionRequest;


/**
 *
 * @param describeConversionTasksRequest Container for the necessary parameters to execute the DescribeConversionTasks
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeConversionTasks service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeConversionTasksRequest
 * @see EC2DescribeConversionTasksResponse
 */
-(EC2DescribeConversionTasksResponse *)describeConversionTasks:(EC2DescribeConversionTasksRequest *)describeConversionTasksRequest;


/**
 * <p>
 * Returns information about an attribute of an instance. Only one attribute can be specified per call.
 * </p>
 *
 * @param describeInstanceAttributeRequest Container for the necessary parameters to execute the DescribeInstanceAttribute
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeInstanceAttribute service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeInstanceAttributeRequest
 * @see EC2DescribeInstanceAttributeResponse
 */
-(EC2DescribeInstanceAttributeResponse *)describeInstanceAttribute:(EC2DescribeInstanceAttributeRequest *)describeInstanceAttributeRequest;


/**
 * <p>
 * Gives you information about your subnets. You can filter the results to return information only about subnets that
 * match criteria you specify.
 * </p>
 * <p>
 * For example, you could ask to get information about a particular subnet (or all) only if the subnet's state is
 * available. You can specify multiple filters (e.g., the subnet is in a particular VPC, and the subnet's state is
 * available).
 * </p>
 * <p>
 * The result includes information for a particular subnet only if the subnet matches all your filters. If there's no
 * match, no special message is returned; the response is simply empty. The following table shows the available filters.
 * </p>
 *
 * @param describeSubnetsRequest Container for the necessary parameters to execute the DescribeSubnets service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeSubnets service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeSubnetsRequest
 * @see EC2DescribeSubnetsResponse
 */
-(EC2DescribeSubnetsResponse *)describeSubnets:(EC2DescribeSubnetsRequest *)describeSubnetsRequest;


/**
 * <p>
 * The RunInstances operation launches a specified number of instances.
 * </p>
 * <p>
 * If Amazon EC2 cannot launch the minimum number AMIs you request, no instances launch. If there is insufficient capacity
 * to launch the maximum number of AMIs you request, Amazon EC2 launches as many as possible to satisfy the requested
 * maximum values.
 * </p>
 * <p>
 * Every instance is launched in a security group. If you do not specify a security group at launch, the instances start
 * in your default security group. For more information on creating security groups, see CreateSecurityGroup.
 * </p>
 * <p>
 * An optional instance type can be specified. For information about instance types, see Instance Types.
 * </p>
 * <p>
 * You can provide an optional key pair ID for each image in the launch request (for more information, see CreateKeyPair).
 * All instances that are created from images that use this key pair will have access to the associated public key at boot.
 * You can use this key to provide secure access to an instance of an image on a per-instance basis. Amazon EC2 public
 * images use this feature to provide secure access without passwords.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> Launching public images without a key pair ID will leave them inaccessible. The public key material is
 * made available to the instance at boot time by placing it in the openssh_id.pub file on a logical device that is exposed
 * to the instance as /dev/sda2 (the ephemeral store). The format of this file is suitable for use as an entry within
 * ~/.ssh/authorized_keys (the OpenSSH format). This can be done at boot (e.g., as part of rc.local) allowing for secure
 * access without passwords. Optional user data can be provided in the launch request. All instances that collectively
 * comprise the launch request have access to this data For more information, see Instance Metadata.
 * </p>
 * <p>
 * <b>NOTE:</b> If any of the AMIs have a product code attached for which the user has not subscribed, the RunInstances
 * call will fail.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> We strongly recommend using the 2.6.18 Xen stock kernel with the c1.medium and c1.xlarge instances.
 * Although the default Amazon EC2 kernels will work, the new kernels provide greater stability and performance for these
 * instance types. For more information about kernels, see Kernels, RAM Disks, and Block Device Mappings.
 * </p>
 *
 * @param runInstancesRequest Container for the necessary parameters to execute the RunInstances service method on
 *           AmazonEC2.
 *
 * @return The response from the RunInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2RunInstancesRequest
 * @see EC2RunInstancesResponse
 */
-(EC2RunInstancesResponse *)runInstances:(EC2RunInstancesRequest *)runInstancesRequest;


/**
 * <p>
 * Returns information about one or more PlacementGroup instances in a user's account.
 * </p>
 *
 * @param describePlacementGroupsRequest Container for the necessary parameters to execute the DescribePlacementGroups
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribePlacementGroups service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribePlacementGroupsRequest
 * @see EC2DescribePlacementGroupsResponse
 */
-(EC2DescribePlacementGroupsResponse *)describePlacementGroups:(EC2DescribePlacementGroupsRequest *)describePlacementGroupsRequest;


/**
 * <p>
 * The DescribeInstances operation returns information about instances that you own.
 * </p>
 * <p>
 * If you specify one or more instance IDs, Amazon EC2 returns information for those instances. If you do not specify
 * instance IDs, Amazon EC2 returns information for all relevant instances. If you specify an invalid instance ID, a fault
 * is returned. If you specify an instance that you do not own, it will not be included in the returned results.
 * </p>
 * <p>
 * Recently terminated instances might appear in the returned results. This interval is usually less than one hour.
 * </p>
 *
 * @param describeInstancesRequest Container for the necessary parameters to execute the DescribeInstances service method
 *           on AmazonEC2.
 *
 * @return The response from the DescribeInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeInstancesRequest
 * @see EC2DescribeInstancesResponse
 */
-(EC2DescribeInstancesResponse *)describeInstances:(EC2DescribeInstancesRequest *)describeInstancesRequest;


/**
 *
 * @param modifyVolumeAttributeRequest Container for the necessary parameters to execute the ModifyVolumeAttribute service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ModifyVolumeAttributeRequest
 * @see EC2ModifyVolumeAttributeResponse
 */
-(EC2ModifyVolumeAttributeResponse *)modifyVolumeAttribute:(EC2ModifyVolumeAttributeRequest *)modifyVolumeAttributeRequest;


/**
 * <p>
 * The DescribeImages operation returns information about AMIs, AKIs, and ARIs available to the user. Information returned
 * includes image type, product codes, architecture, and kernel and RAM disk IDs. Images available to the user include
 * public images available for any user to launch, private images owned by the user making the request, and private images
 * owned by other users for which the user has explicit launch permissions.
 * </p>
 * <p>
 * Launch permissions fall into three categories:
 * </p>
 *
 * <ul>
 * <li> <b>Public:</b> The owner of the AMI granted launch permissions for the AMI to the all group. All users have launch
 * permissions for these AMIs. </li>
 * <li> <b>Explicit:</b> The owner of the AMI granted launch permissions to a specific user. </li>
 * <li> <b>Implicit:</b> A user has implicit launch permissions for all AMIs he or she owns. </li>
 *
 * </ul>
 * <p>
 * The list of AMIs returned can be modified by specifying AMI IDs, AMI owners, or users with launch permissions. If no
 * options are specified, Amazon EC2 returns all AMIs for which the user has launch permissions.
 * </p>
 * <p>
 * If you specify one or more AMI IDs, only AMIs that have the specified IDs are returned. If you specify an invalid AMI
 * ID, a fault is returned. If you specify an AMI ID for which you do not have access, it will not be included in the
 * returned results.
 * </p>
 * <p>
 * If you specify one or more AMI owners, only AMIs from the specified owners and for which you have access are returned.
 * The results can include the account IDs of the specified owners, amazon for AMIs owned by Amazon or self for AMIs that
 * you own.
 * </p>
 * <p>
 * If you specify a list of executable users, only users that have launch permissions for the AMIs are returned. You can
 * specify account IDs (if you own the AMI(s)), self for AMIs for which you own or have explicit permissions, or all for
 * public AMIs.
 * </p>
 * <p>
 * <b>NOTE:</b> Deregistered images are included in the returned results for an unspecified interval after deregistration.
 * </p>
 *
 * @param describeImagesRequest Container for the necessary parameters to execute the DescribeImages service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeImages service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeImagesRequest
 * @see EC2DescribeImagesResponse
 */
-(EC2DescribeImagesResponse *)describeImages:(EC2DescribeImagesRequest *)describeImagesRequest;


/**
 * <p>
 * Starts an instance that uses an Amazon EBS volume as its root device. Instances that use Amazon EBS volumes as their
 * root devices can be quickly stopped and started. When an instance is stopped, the compute resources are released and you
 * are not billed for hourly instance usage. However, your root partition Amazon EBS volume remains, continues to persist
 * your data, and you are charged for Amazon EBS volume usage. You can restart your instance at any time.
 * </p>
 * <p>
 * <b>NOTE:</b> Performing this operation on an instance that uses an instance store as its root device returns an error.
 * </p>
 *
 * @param startInstancesRequest Container for the necessary parameters to execute the StartInstances service method on
 *           AmazonEC2.
 *
 * @return The response from the StartInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2StartInstancesRequest
 * @see EC2StartInstancesResponse
 */
-(EC2StartInstancesResponse *)startInstances:(EC2StartInstancesRequest *)startInstancesRequest;


/**
 *
 * @param cancelReservedInstancesListingRequest Container for the necessary parameters to execute the
 *           CancelReservedInstancesListing service method on AmazonEC2.
 *
 * @return The response from the CancelReservedInstancesListing service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CancelReservedInstancesListingRequest
 * @see EC2CancelReservedInstancesListingResponse
 */
-(EC2CancelReservedInstancesListingResponse *)cancelReservedInstancesListing:(EC2CancelReservedInstancesListingRequest *)cancelReservedInstancesListingRequest;


/**
 * <p>
 * Modifies an attribute of an instance.
 * </p>
 *
 * @param modifyInstanceAttributeRequest Container for the necessary parameters to execute the ModifyInstanceAttribute
 *           service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ModifyInstanceAttributeRequest
 * @see EC2ModifyInstanceAttributeResponse
 */
-(EC2ModifyInstanceAttributeResponse *)modifyInstanceAttribute:(EC2ModifyInstanceAttributeRequest *)modifyInstanceAttributeRequest;


/**
 * <p>
 * The AuthorizeSecurityGroupIngress operation adds permissions to a security group.
 * </p>
 * <p>
 * Permissions are specified by the IP protocol (TCP, UDP or ICMP), the source of the request (by IP range or an Amazon
 * EC2 user-group pair), the source and destination port ranges (for TCP and UDP), and the ICMP codes and types (for ICMP).
 * When authorizing ICMP, -1 can be used as a wildcard in the type and code fields.
 * </p>
 * <p>
 * Permission changes are propagated to instances within the security group as quickly as possible. However, depending on
 * the number of instances, a small delay might occur.
 * </p>
 *
 * @param authorizeSecurityGroupIngressRequest Container for the necessary parameters to execute the
 *           AuthorizeSecurityGroupIngress service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2AuthorizeSecurityGroupIngressRequest
 * @see EC2AuthorizeSecurityGroupIngressResponse
 */
-(EC2AuthorizeSecurityGroupIngressResponse *)authorizeSecurityGroupIngress:(EC2AuthorizeSecurityGroupIngressRequest *)authorizeSecurityGroupIngressRequest;


/**
 * <p>
 * Describes Spot Instance requests. Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum
 * price that you specify exceeds the current Spot Price. Amazon EC2 periodically sets the Spot Price based on available
 * Spot Instance capacity and current spot instance requests. For conceptual information about Spot Instances, refer to the
 * <a href="http://docs.amazonwebservices.com/AWSEC2/2010-08-31/DeveloperGuide/"> Amazon Elastic Compute Cloud Developer
 * Guide </a> or <a href="http://docs.amazonwebservices.com/AWSEC2/2010-08-31/UserGuide/"> Amazon Elastic Compute Cloud
 * User Guide </a> .
 * </p>
 * <p>
 * You can filter the results to return information only about Spot Instance requests that match criteria you specify. For
 * example, you could get information about requests where the Spot Price you specified is a certain value (you can't use
 * greater than or less than comparison, but you can use * and ? wildcards). You can specify multiple values for a filter.
 * A Spot Instance request must match at least one of the specified values for it to be included in the results.
 * </p>
 * <p>
 * You can specify multiple filters (e.g., the Spot Price is equal to a particular value, and the instance type is
 * m1.small ). The result includes information for a particular request only if it matches all your filters. If there's no
 * match, no special message is returned; the response is simply empty.
 * </p>
 * <p>
 * You can use wildcards with the filter values: an asterisk matches zero or more characters, and ? matches exactly one
 * character. You can escape special characters using a backslash before the character. For example, a value of
 * \*amazon\?\\ searches for the literal string *amazon?\ .
 *
 * </p>
 *
 * @param describeSpotInstanceRequestsRequest Container for the necessary parameters to execute the
 *           DescribeSpotInstanceRequests service method on AmazonEC2.
 *
 * @return The response from the DescribeSpotInstanceRequests service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeSpotInstanceRequestsRequest
 * @see EC2DescribeSpotInstanceRequestsResponse
 */
-(EC2DescribeSpotInstanceRequestsResponse *)describeSpotInstanceRequests:(EC2DescribeSpotInstanceRequestsRequest *)describeSpotInstanceRequestsRequest;


/**
 *
 * @param cancelExportTaskRequest Container for the necessary parameters to execute the CancelExportTask service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CancelExportTaskRequest
 * @see EC2CancelExportTaskResponse
 */
-(EC2CancelExportTaskResponse *)cancelExportTask:(EC2CancelExportTaskRequest *)cancelExportTaskRequest;


/**
 *
 * @param copyImageRequest Container for the necessary parameters to execute the CopyImage service method on AmazonEC2.
 *
 * @return The response from the CopyImage service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CopyImageRequest
 * @see EC2CopyImageResponse
 */
-(EC2CopyImageResponse *)doCopyImage:(EC2CopyImageRequest *)copyImageRequest;


/**
 * <p>
 * Creates a Spot Instance request.
 * </p>
 * <p>
 * Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum price that you specify exceeds the
 * current Spot Price. Amazon EC2 periodically sets the Spot Price based on available Spot Instance capacity and current
 * spot instance requests.
 * </p>
 * <p>
 * For conceptual information about Spot Instances, refer to the Amazon Elastic Compute Cloud Developer Guide or Amazon
 * Elastic Compute Cloud User Guide.
 * </p>
 *
 * @param requestSpotInstancesRequest Container for the necessary parameters to execute the RequestSpotInstances service
 *           method on AmazonEC2.
 *
 * @return The response from the RequestSpotInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2RequestSpotInstancesRequest
 * @see EC2RequestSpotInstancesResponse
 */
-(EC2RequestSpotInstancesResponse *)requestSpotInstances:(EC2RequestSpotInstancesRequest *)requestSpotInstancesRequest;


/**
 * <p>
 * Adds or overwrites tags for the specified resources. Each resource can have a maximum of 10 tags. Each tag consists of
 * a key-value pair. Tag keys must be unique per resource.
 * </p>
 *
 * @param createTagsRequest Container for the necessary parameters to execute the CreateTags service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateTagsRequest
 * @see EC2CreateTagsResponse
 */
-(EC2CreateTagsResponse *)createTags:(EC2CreateTagsRequest *)createTagsRequest;


/**
 *
 * @param describeVolumeAttributeRequest Container for the necessary parameters to execute the DescribeVolumeAttribute
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeVolumeAttribute service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeVolumeAttributeRequest
 * @see EC2DescribeVolumeAttributeResponse
 */
-(EC2DescribeVolumeAttributeResponse *)describeVolumeAttribute:(EC2DescribeVolumeAttributeRequest *)describeVolumeAttributeRequest;


/**
 * <p>
 * Describes the tags for the specified resources.
 * </p>
 *
 * @param describeTagsRequest Container for the necessary parameters to execute the DescribeTags service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeTags service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeTagsRequest
 * @see EC2DescribeTagsResponse
 */
-(EC2DescribeTagsResponse *)describeTags:(EC2DescribeTagsRequest *)describeTagsRequest;


/**
 * <p>
 * CancelBundleTask operation cancels a pending or in-progress bundling task. This is an asynchronous call and it make
 * take a while for the task to be canceled. If a task is canceled while it is storing items, there may be parts of the
 * incomplete AMI stored in S3. It is up to the caller to clean up these parts from S3.
 * </p>
 *
 * @param cancelBundleTaskRequest Container for the necessary parameters to execute the CancelBundleTask service method on
 *           AmazonEC2.
 *
 * @return The response from the CancelBundleTask service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CancelBundleTaskRequest
 * @see EC2CancelBundleTaskResponse
 */
-(EC2CancelBundleTaskResponse *)cancelBundleTask:(EC2CancelBundleTaskRequest *)cancelBundleTaskRequest;


/**
 * <p>
 * Cancels one or more Spot Instance requests.
 * </p>
 * <p>
 * Spot Instances are instances that Amazon EC2 starts on your behalf when the maximum price that you specify exceeds the
 * current Spot Price. Amazon EC2 periodically sets the Spot Price based on available Spot Instance capacity and current
 * spot instance requests.
 * </p>
 * <p>
 * For conceptual information about Spot Instances, refer to the Amazon Elastic Compute Cloud Developer Guide or Amazon
 * Elastic Compute Cloud User Guide .
 *
 * </p>
 *
 * @param cancelSpotInstanceRequestsRequest Container for the necessary parameters to execute the
 *           CancelSpotInstanceRequests service method on AmazonEC2.
 *
 * @return The response from the CancelSpotInstanceRequests service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CancelSpotInstanceRequestsRequest
 * @see EC2CancelSpotInstanceRequestsResponse
 */
-(EC2CancelSpotInstanceRequestsResponse *)cancelSpotInstanceRequests:(EC2CancelSpotInstanceRequestsRequest *)cancelSpotInstanceRequestsRequest;


/**
 * <p>
 * The PurchaseReservedInstancesOffering operation purchases a Reserved Instance for use with your account. With Amazon
 * EC2 Reserved Instances, you purchase the right to launch Amazon EC2 instances for a period of time (without getting
 * insufficient capacity errors) and pay a lower usage rate for the actual time used.
 * </p>
 *
 * @param purchaseReservedInstancesOfferingRequest Container for the necessary parameters to execute the
 *           PurchaseReservedInstancesOffering service method on AmazonEC2.
 *
 * @return The response from the PurchaseReservedInstancesOffering service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2PurchaseReservedInstancesOfferingRequest
 * @see EC2PurchaseReservedInstancesOfferingResponse
 */
-(EC2PurchaseReservedInstancesOfferingResponse *)purchaseReservedInstancesOffering:(EC2PurchaseReservedInstancesOfferingRequest *)purchaseReservedInstancesOfferingRequest;


/**
 * <p>
 * Adds or remove permission settings for the specified snapshot.
 * </p>
 *
 * @param modifySnapshotAttributeRequest Container for the necessary parameters to execute the ModifySnapshotAttribute
 *           service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ModifySnapshotAttributeRequest
 * @see EC2ModifySnapshotAttributeResponse
 */
-(EC2ModifySnapshotAttributeResponse *)modifySnapshotAttribute:(EC2ModifySnapshotAttributeRequest *)modifySnapshotAttributeRequest;


/**
 * <p>
 * The TerminateInstances operation shuts down one or more instances. This operation is idempotent; if you terminate an
 * instance more than once, each call will succeed.
 * </p>
 * <p>
 * Terminated instances will remain visible after termination (approximately one hour).
 * </p>
 *
 * @param terminateInstancesRequest Container for the necessary parameters to execute the TerminateInstances service method
 *           on AmazonEC2.
 *
 * @return The response from the TerminateInstances service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2TerminateInstancesRequest
 * @see EC2TerminateInstancesResponse
 */
-(EC2TerminateInstancesResponse *)terminateInstances:(EC2TerminateInstancesRequest *)terminateInstancesRequest;


/**
 * <p>
 * Deletes the data feed for Spot Instances.
 * </p>
 * <p>
 * For conceptual information about Spot Instances, refer to the Amazon Elastic Compute Cloud Developer Guide or Amazon
 * Elastic Compute Cloud User Guide .
 *
 * </p>
 *
 * @param deleteSpotDatafeedSubscriptionRequest Container for the necessary parameters to execute the
 *           DeleteSpotDatafeedSubscription service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeleteSpotDatafeedSubscriptionRequest
 * @see EC2DeleteSpotDatafeedSubscriptionResponse
 */
-(EC2DeleteSpotDatafeedSubscriptionResponse *)deleteSpotDatafeedSubscription:(EC2DeleteSpotDatafeedSubscriptionRequest *)deleteSpotDatafeedSubscriptionRequest;


/**
 * <p>
 * Returns information about an attribute of a snapshot. Only one attribute can be specified per call.
 * </p>
 *
 * @param describeSnapshotAttributeRequest Container for the necessary parameters to execute the DescribeSnapshotAttribute
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeSnapshotAttribute service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeSnapshotAttributeRequest
 * @see EC2DescribeSnapshotAttributeResponse
 */
-(EC2DescribeSnapshotAttributeResponse *)describeSnapshotAttribute:(EC2DescribeSnapshotAttributeRequest *)describeSnapshotAttributeRequest;


/**
 * <p>
 * The DescribeAddresses operation lists elastic IP addresses assigned to your account.
 * </p>
 *
 * @param describeAddressesRequest Container for the necessary parameters to execute the DescribeAddresses service method
 *           on AmazonEC2.
 *
 * @return The response from the DescribeAddresses service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeAddressesRequest
 * @see EC2DescribeAddressesResponse
 */
-(EC2DescribeAddressesResponse *)describeAddresses:(EC2DescribeAddressesRequest *)describeAddressesRequest;


/**
 * <p>
 * The DescribeImageAttribute operation returns information about an attribute of an AMI. Only one attribute can be
 * specified per call.
 * </p>
 *
 * @param describeImageAttributeRequest Container for the necessary parameters to execute the DescribeImageAttribute
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeImageAttribute service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeImageAttributeRequest
 * @see EC2DescribeImageAttributeResponse
 */
-(EC2DescribeImageAttributeResponse *)describeImageAttribute:(EC2DescribeImageAttributeRequest *)describeImageAttributeRequest;


/**
 * <p>
 * The DescribeKeyPairs operation returns information about key pairs available to you. If you specify key pairs,
 * information about those key pairs is returned. Otherwise, information for all registered key pairs is returned.
 * </p>
 *
 * @param describeKeyPairsRequest Container for the necessary parameters to execute the DescribeKeyPairs service method on
 *           AmazonEC2.
 *
 * @return The response from the DescribeKeyPairs service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeKeyPairsRequest
 * @see EC2DescribeKeyPairsResponse
 */
-(EC2DescribeKeyPairsResponse *)describeKeyPairs:(EC2DescribeKeyPairsRequest *)describeKeyPairsRequest;


/**
 * <p>
 * The ConfirmProductInstance operation returns true if the specified product code is attached to the specified instance.
 * The operation returns false if the product code is not attached to the instance.
 * </p>
 * <p>
 * The ConfirmProductInstance operation can only be executed by the owner of the AMI. This feature is useful when an AMI
 * owner is providing support and wants to verify whether a user's instance is eligible.
 * </p>
 *
 * @param confirmProductInstanceRequest Container for the necessary parameters to execute the ConfirmProductInstance
 *           service method on AmazonEC2.
 *
 * @return The response from the ConfirmProductInstance service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ConfirmProductInstanceRequest
 * @see EC2ConfirmProductInstanceResponse
 */
-(EC2ConfirmProductInstanceResponse *)confirmProductInstance:(EC2ConfirmProductInstanceRequest *)confirmProductInstanceRequest;


/**
 * <p>
 * Initializes an empty volume of a given size.
 * </p>
 *
 * @param createVolumeRequest Container for the necessary parameters to execute the CreateVolume service method on
 *           AmazonEC2.
 *
 * @return The response from the CreateVolume service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateVolumeRequest
 * @see EC2CreateVolumeResponse
 */
-(EC2CreateVolumeResponse *)createVolume:(EC2CreateVolumeRequest *)createVolumeRequest;


/**
 * <p>
 * Describes the status of an Amazon Elastic Compute Cloud (Amazon EC2) instance. Instance status provides information
 * about two types of scheduled events for an instance that may require your attention:
 * </p>
 *
 * <ul>
 * <li> Scheduled Reboot: When Amazon EC2 determines that an instance must be rebooted, the instance's status will return
 * one of two event codes: system-reboot or instance-reboot . System reboot commonly occurs if certain maintenance or
 * upgrade operations require a reboot of the underlying host that supports an instance. Instance reboot commonly occurs if
 * the instance must be rebooted, rather than the underlying host. Rebooting events include a scheduled start and end time.
 * </li>
 * <li> Scheduled Retirement: When Amazon EC2 determines that an instance must be shut down, the instance's status will
 * return an event code called instance-retirement . Retirement commonly occurs when the underlying host is degraded and
 * must be replaced. Retirement events include a scheduled start and end time. You're also notified by email if one of your
 * instances is set to retiring. The email message indicates when your instance will be permanently retired. </li>
 *
 * </ul>
 * <p>
 * If your instance is permanently retired, it will not be restarted. You can avoid retirement by manually restarting your
 * instance when its event code is instance-retirement . This ensures that your instance is started on a healthy host.
 * </p>
 * <p>
 * DescribeInstanceStatus returns information only for instances in the running state.
 * </p>
 * <p>
 * You can filter the results to return information only about instances that match criteria you specify. For example, you
 * could get information about instances in a specific Availability Zone. You can specify multiple values for a filter
 * (e.g., more than one Availability Zone). An instance must match at least one of the specified values for it to be
 * included in the results.
 * </p>
 * <p>
 * You can specify multiple filters. An instance must match all the filters for it to be included in the results. If
 * there's no match, no special message is returned; the response is simply empty.
 * </p>
 * <p>
 * You can use wildcards with the filter values: * matches zero or more characters, and ? matches exactly one character.
 * You can escape special characters using a backslash before the character. For example, a value of \*amazon\?\\ searches
 * for the literal string *amazon?\ .
 *
 * </p>
 * <p>
 * The following filters are available:
 * </p>
 *
 * <ul>
 * <li> availability-zone - Filter on an instance's availability zone. </li>
 * <li> instance-state-name - Filter on the intended state of the instance, e.g., running. </li>
 * <li> instance-state-code - Filter on the intended state code of the instance, e.g., 16. </li>
 *
 * </ul>
 *
 * @param describeInstanceStatusRequest Container for the necessary parameters to execute the DescribeInstanceStatus
 *           service method on AmazonEC2.
 *
 * @return The response from the DescribeInstanceStatus service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeInstanceStatusRequest
 * @see EC2DescribeInstanceStatusResponse
 */
-(EC2DescribeInstanceStatusResponse *)describeInstanceStatus:(EC2DescribeInstanceStatusRequest *)describeInstanceStatusRequest;


/**
 * <p>
 * The DescribeReservedInstancesOfferings operation describes Reserved Instance offerings that are available for purchase.
 * With Amazon EC2 Reserved Instances, you purchase the right to launch Amazon EC2 instances for a period of time (without
 * getting insufficient capacity errors) and pay a lower usage rate for the actual time used.
 * </p>
 *
 * @param describeReservedInstancesOfferingsRequest Container for the necessary parameters to execute the
 *           DescribeReservedInstancesOfferings service method on AmazonEC2.
 *
 * @return The response from the DescribeReservedInstancesOfferings service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeReservedInstancesOfferingsRequest
 * @see EC2DescribeReservedInstancesOfferingsResponse
 */
-(EC2DescribeReservedInstancesOfferingsResponse *)describeReservedInstancesOfferings:(EC2DescribeReservedInstancesOfferingsRequest *)describeReservedInstancesOfferingsRequest;


/**
 * <p>
 * Deletes the snapshot identified by snapshotId .
 *
 * </p>
 *
 * @param deleteSnapshotRequest Container for the necessary parameters to execute the DeleteSnapshot service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeleteSnapshotRequest
 * @see EC2DeleteSnapshotResponse
 */
-(EC2DeleteSnapshotResponse *)deleteSnapshot:(EC2DeleteSnapshotRequest *)deleteSnapshotRequest;


/**
 * <p>
 * The DisassociateAddress operation disassociates the specified elastic IP address from the instance to which it is
 * assigned. This is an idempotent operation. If you enter it more than once, Amazon EC2 does not return an error.
 * </p>
 *
 * @param disassociateAddressRequest Container for the necessary parameters to execute the DisassociateAddress service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DisassociateAddressRequest
 * @see EC2DisassociateAddressResponse
 */
-(EC2DisassociateAddressResponse *)disassociateAddress:(EC2DisassociateAddressRequest *)disassociateAddressRequest;


/**
 * <p>
 * Creates a PlacementGroup into which multiple Amazon EC2 instances can be launched. Users must give the group a name
 * unique within the scope of the user account.
 * </p>
 *
 * @param createPlacementGroupRequest Container for the necessary parameters to execute the CreatePlacementGroup service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreatePlacementGroupRequest
 * @see EC2CreatePlacementGroupResponse
 */
-(EC2CreatePlacementGroupResponse *)createPlacementGroup:(EC2CreatePlacementGroupRequest *)createPlacementGroupRequest;


/**
 * <p>
 * The BundleInstance operation request that an instance is bundled the next time it boots. The bundling process creates a
 * new image from a running instance and stores the AMI data in S3. Once bundled, the image must be registered in the
 * normal way using the RegisterImage API.
 * </p>
 *
 * @param bundleInstanceRequest Container for the necessary parameters to execute the BundleInstance service method on
 *           AmazonEC2.
 *
 * @return The response from the BundleInstance service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2BundleInstanceRequest
 * @see EC2BundleInstanceResponse
 */
-(EC2BundleInstanceResponse *)bundleInstance:(EC2BundleInstanceRequest *)bundleInstanceRequest;


/**
 * <p>
 * Deletes a PlacementGroup from a user's account. Terminate all Amazon EC2 instances in the placement group before
 * deletion.
 * </p>
 *
 * @param deletePlacementGroupRequest Container for the necessary parameters to execute the DeletePlacementGroup service
 *           method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DeletePlacementGroupRequest
 * @see EC2DeletePlacementGroupResponse
 */
-(EC2DeletePlacementGroupResponse *)deletePlacementGroup:(EC2DeletePlacementGroupRequest *)deletePlacementGroupRequest;


/**
 *
 * @param copySnapshotRequest Container for the necessary parameters to execute the CopySnapshot service method on
 *           AmazonEC2.
 *
 * @return The response from the CopySnapshot service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CopySnapshotRequest
 * @see EC2CopySnapshotResponse
 */
-(EC2CopySnapshotResponse *)doCopySnapshot:(EC2CopySnapshotRequest *)copySnapshotRequest;


/**
 * <p>
 * The AllocateAddress operation acquires an elastic IP address for use with your account.
 * </p>
 *
 * @param allocateAddressRequest Container for the necessary parameters to execute the AllocateAddress service method on
 *           AmazonEC2.
 *
 * @return The response from the AllocateAddress service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2AllocateAddressRequest
 * @see EC2AllocateAddressResponse
 */
-(EC2AllocateAddressResponse *)allocateAddress:(EC2AllocateAddressRequest *)allocateAddressRequest;


/**
 * <p>
 * The ReleaseAddress operation releases an elastic IP address associated with your account.
 * </p>
 * <p>
 * <b>NOTE:</b> Releasing an IP address automatically disassociates it from any instance with which it is associated. For
 * more information, see DisassociateAddress.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> After releasing an elastic IP address, it is released to the IP address pool and might no longer be
 * available to your account. Make sure to update your DNS records and any servers or devices that communicate with the
 * address. If you run this operation on an elastic IP address that is already released, the address might be assigned to
 * another account which will cause Amazon EC2 to return an error.
 * </p>
 *
 * @param releaseAddressRequest Container for the necessary parameters to execute the ReleaseAddress service method on
 *           AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ReleaseAddressRequest
 * @see EC2ReleaseAddressResponse
 */
-(EC2ReleaseAddressResponse *)releaseAddress:(EC2ReleaseAddressRequest *)releaseAddressRequest;


/**
 * <p>
 * Resets an attribute of an instance to its default value.
 * </p>
 *
 * @param resetInstanceAttributeRequest Container for the necessary parameters to execute the ResetInstanceAttribute
 *           service method on AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2ResetInstanceAttributeRequest
 * @see EC2ResetInstanceAttributeResponse
 */
-(EC2ResetInstanceAttributeResponse *)resetInstanceAttribute:(EC2ResetInstanceAttributeRequest *)resetInstanceAttributeRequest;


/**
 * <p>
 * The CreateKeyPair operation creates a new 2048 bit RSA key pair and returns a unique ID that can be used to reference
 * this key pair when launching new instances. For more information, see RunInstances.
 * </p>
 *
 * @param createKeyPairRequest Container for the necessary parameters to execute the CreateKeyPair service method on
 *           AmazonEC2.
 *
 * @return The response from the CreateKeyPair service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2CreateKeyPairRequest
 * @see EC2CreateKeyPairResponse
 */
-(EC2CreateKeyPairResponse *)createKeyPair:(EC2CreateKeyPairRequest *)createKeyPairRequest;


/**
 * <p>
 * Returns information about the Amazon EBS snapshots available to you. Snapshots available to you include public
 * snapshots available for any AWS account to launch, private snapshots you own, and private snapshots owned by another AWS
 * account but for which you've been given explicit create volume permissions.
 * </p>
 *
 * @param describeSnapshotsRequest Container for the necessary parameters to execute the DescribeSnapshots service method
 *           on AmazonEC2.
 *
 * @return The response from the DescribeSnapshots service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2DescribeSnapshotsRequest
 * @see EC2DescribeSnapshotsResponse
 */
-(EC2DescribeSnapshotsResponse *)describeSnapshots:(EC2DescribeSnapshotsRequest *)describeSnapshotsRequest;


/**
 * <p>
 * The RegisterImage operation registers an AMI with Amazon EC2. Images must be registered before they can be launched.
 * For more information, see RunInstances.
 * </p>
 * <p>
 * Each AMI is associated with an unique ID which is provided by the Amazon EC2 service through the RegisterImage
 * operation. During registration, Amazon EC2 retrieves the specified image manifest from Amazon S3 and verifies that the
 * image is owned by the user registering the image.
 * </p>
 * <p>
 * The image manifest is retrieved once and stored within the Amazon EC2. Any modifications to an image in Amazon S3
 * invalidates this registration. If you make changes to an image, deregister the previous image and register the new
 * image. For more information, see DeregisterImage.
 * </p>
 *
 * @param registerImageRequest Container for the necessary parameters to execute the RegisterImage service method on
 *           AmazonEC2.
 *
 * @return The response from the RegisterImage service method, as returned by AmazonEC2.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonEC2 indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see EC2RegisterImageRequest
 * @see EC2RegisterImageResponse
 */
-(EC2RegisterImageResponse *)registerImage:(EC2RegisterImageRequest *)registerImageRequest;



@end

