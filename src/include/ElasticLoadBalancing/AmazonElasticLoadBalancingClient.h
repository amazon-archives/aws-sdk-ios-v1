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
#import "ElasticLoadBalancingDeleteLoadBalancerListenersResponse.h"
#import "ElasticLoadBalancingDeleteLoadBalancerListenersResponseUnmarshaller.h"
#import "ElasticLoadBalancingDeleteLoadBalancerListenersRequest.h"
#import "ElasticLoadBalancingDeleteLoadBalancerListenersRequestMarshaller.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponse.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponseUnmarshaller.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequestMarshaller.h"
#import "ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponse.h"
#import "ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponseUnmarshaller.h"
#import "ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequest.h"
#import "ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequestMarshaller.h"
#import "ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponse.h"
#import "ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponseUnmarshaller.h"
#import "ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequest.h"
#import "ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequestMarshaller.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPoliciesResponse.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPoliciesResponseUnmarshaller.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPoliciesRequest.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPoliciesRequestMarshaller.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPolicyTypesResponse.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPolicyTypesResponseUnmarshaller.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequest.h"
#import "ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequestMarshaller.h"
#import "ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponse.h"
#import "ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponseUnmarshaller.h"
#import "ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequest.h"
#import "ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequestMarshaller.h"
#import "ElasticLoadBalancingCreateLBCookieStickinessPolicyResponse.h"
#import "ElasticLoadBalancingCreateLBCookieStickinessPolicyResponseUnmarshaller.h"
#import "ElasticLoadBalancingCreateLBCookieStickinessPolicyRequest.h"
#import "ElasticLoadBalancingCreateLBCookieStickinessPolicyRequestMarshaller.h"
#import "ElasticLoadBalancingDeleteLoadBalancerPolicyResponse.h"
#import "ElasticLoadBalancingDeleteLoadBalancerPolicyResponseUnmarshaller.h"
#import "ElasticLoadBalancingDeleteLoadBalancerPolicyRequest.h"
#import "ElasticLoadBalancingDeleteLoadBalancerPolicyRequestMarshaller.h"
#import "ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponse.h"
#import "ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponseUnmarshaller.h"
#import "ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequest.h"
#import "ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequestMarshaller.h"
#import "ElasticLoadBalancingConfigureHealthCheckResponse.h"
#import "ElasticLoadBalancingConfigureHealthCheckResponseUnmarshaller.h"
#import "ElasticLoadBalancingConfigureHealthCheckRequest.h"
#import "ElasticLoadBalancingConfigureHealthCheckRequestMarshaller.h"
#import "ElasticLoadBalancingDescribeLoadBalancersResponse.h"
#import "ElasticLoadBalancingDescribeLoadBalancersResponseUnmarshaller.h"
#import "ElasticLoadBalancingDescribeLoadBalancersRequest.h"
#import "ElasticLoadBalancingDescribeLoadBalancersRequestMarshaller.h"
#import "ElasticLoadBalancingDescribeInstanceHealthResponse.h"
#import "ElasticLoadBalancingDescribeInstanceHealthResponseUnmarshaller.h"
#import "ElasticLoadBalancingDescribeInstanceHealthRequest.h"
#import "ElasticLoadBalancingDescribeInstanceHealthRequestMarshaller.h"
#import "ElasticLoadBalancingAttachLoadBalancerToSubnetsResponse.h"
#import "ElasticLoadBalancingAttachLoadBalancerToSubnetsResponseUnmarshaller.h"
#import "ElasticLoadBalancingAttachLoadBalancerToSubnetsRequest.h"
#import "ElasticLoadBalancingAttachLoadBalancerToSubnetsRequestMarshaller.h"
#import "ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponse.h"
#import "ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponseUnmarshaller.h"
#import "ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequest.h"
#import "ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequestMarshaller.h"
#import "ElasticLoadBalancingCreateLoadBalancerListenersResponse.h"
#import "ElasticLoadBalancingCreateLoadBalancerListenersResponseUnmarshaller.h"
#import "ElasticLoadBalancingCreateLoadBalancerListenersRequest.h"
#import "ElasticLoadBalancingCreateLoadBalancerListenersRequestMarshaller.h"
#import "ElasticLoadBalancingCreateLoadBalancerPolicyResponse.h"
#import "ElasticLoadBalancingCreateLoadBalancerPolicyResponseUnmarshaller.h"
#import "ElasticLoadBalancingCreateLoadBalancerPolicyRequest.h"
#import "ElasticLoadBalancingCreateLoadBalancerPolicyRequestMarshaller.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerResponse.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerResponseUnmarshaller.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequest.h"
#import "ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequestMarshaller.h"
#import "ElasticLoadBalancingDetachLoadBalancerFromSubnetsResponse.h"
#import "ElasticLoadBalancingDetachLoadBalancerFromSubnetsResponseUnmarshaller.h"
#import "ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequest.h"
#import "ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequestMarshaller.h"
#import "ElasticLoadBalancingApplySecurityGroupsToLoadBalancerResponse.h"
#import "ElasticLoadBalancingApplySecurityGroupsToLoadBalancerResponseUnmarshaller.h"
#import "ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequest.h"
#import "ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequestMarshaller.h"
#import "ElasticLoadBalancingDeleteLoadBalancerResponse.h"
#import "ElasticLoadBalancingDeleteLoadBalancerResponseUnmarshaller.h"
#import "ElasticLoadBalancingDeleteLoadBalancerRequest.h"
#import "ElasticLoadBalancingDeleteLoadBalancerRequestMarshaller.h"
#import "ElasticLoadBalancingCreateLoadBalancerResponse.h"
#import "ElasticLoadBalancingCreateLoadBalancerResponseUnmarshaller.h"
#import "ElasticLoadBalancingCreateLoadBalancerRequest.h"
#import "ElasticLoadBalancingCreateLoadBalancerRequestMarshaller.h"
#import "ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse.h"
#import "ElasticLoadBalancingCreateAppCookieStickinessPolicyResponseUnmarshaller.h"
#import "ElasticLoadBalancingCreateAppCookieStickinessPolicyRequest.h"
#import "ElasticLoadBalancingCreateAppCookieStickinessPolicyRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"

/** \defgroup ElasticLoadBalancing Elastic Load Balancing */

/** <summary>
 * Interface for accessing AmazonElasticLoadBalancing.
 *
 *  Elastic Load Balancing <p>
 * Elastic Load Balancing is a cost-effective and easy to use web service to help you improve availability and scalability of your application. It makes it easy for you to distribute application loads
 * between two or more EC2 instances. Elastic Load Balancing enables availability through redundancy and supports traffic growth of your application.
 * </p>
 * </summary>
 *
 */
@interface AmazonElasticLoadBalancingClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * Deletes listeners from the LoadBalancer for the specified port.
 * </p>
 *
 * @param deleteLoadBalancerListenersRequest Container for the necessary parameters to execute the
 *           DeleteLoadBalancerListeners service method on AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDeleteLoadBalancerListenersRequest
 * @see ElasticLoadBalancingDeleteLoadBalancerListenersResponse
 */
-(ElasticLoadBalancingDeleteLoadBalancerListenersResponse *)deleteLoadBalancerListeners:(ElasticLoadBalancingDeleteLoadBalancerListenersRequest *)deleteLoadBalancerListenersRequest;


/**
 * <p>
 * Associates, updates, or disables a policy with a listener on the LoadBalancer. You can associate multiple policies with
 * a listener.
 * </p>
 *
 * @param setLoadBalancerPoliciesOfListenerRequest Container for the necessary parameters to execute the
 *           SetLoadBalancerPoliciesOfListener service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the SetLoadBalancerPoliciesOfListener service method, as returned by
 *         AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingListenerNotFoundException For more information see <ElasticLoadBalancingListenerNotFoundException>
 * @exception ElasticLoadBalancingPolicyNotFoundException For more information see <ElasticLoadBalancingPolicyNotFoundException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest
 * @see ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponse
 */
-(ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponse *)setLoadBalancerPoliciesOfListener:(ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest *)setLoadBalancerPoliciesOfListenerRequest;


/**
 * <p>
 * Adds one or more EC2 Availability Zones to the LoadBalancer.
 * </p>
 * <p>
 * The LoadBalancer evenly distributes requests across all its registered Availability Zones that contain instances. As a
 * result, the client must ensure that its LoadBalancer is appropriately scaled for each registered Availability Zone.
 * </p>
 * <p>
 * <b>NOTE:</b> The new EC2 Availability Zones to be added must be in the same EC2 Region as the Availability Zones for
 * which the LoadBalancer was created.
 * </p>
 *
 * @param enableAvailabilityZonesForLoadBalancerRequest Container for the necessary parameters to execute the
 *           EnableAvailabilityZonesForLoadBalancer service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the EnableAvailabilityZonesForLoadBalancer service method, as returned by
 *         AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequest
 * @see ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponse
 */
-(ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponse *)enableAvailabilityZonesForLoadBalancer:(ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequest *)enableAvailabilityZonesForLoadBalancerRequest;


/**
 * <p>
 * Deregisters instances from the LoadBalancer. Once the instance is deregistered, it will stop receiving traffic from the
 * LoadBalancer.
 * </p>
 * <p>
 * In order to successfully call this API, the same account credentials as those used to create the LoadBalancer must be
 * provided.
 * </p>
 *
 * @param deregisterInstancesFromLoadBalancerRequest Container for the necessary parameters to execute the
 *           DeregisterInstancesFromLoadBalancer service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DeregisterInstancesFromLoadBalancer service method, as returned by
 *         AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingInvalidInstanceException For more information see <ElasticLoadBalancingInvalidInstanceException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequest
 * @see ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponse
 */
-(ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponse *)deregisterInstancesFromLoadBalancer:(ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequest *)deregisterInstancesFromLoadBalancerRequest;


/**
 * <p>
 * Returns detailed descriptions of the policies. If you specify a LoadBalancer name, the operation returns either the
 * descriptions of the specified policies, or descriptions of all the policies created for the LoadBalancer. If you don't
 * specify a LoadBalancer name, the operation returns descriptions of the specified sample policies, or descriptions of all
 * the sample policies. The names of the sample policies have the ELBSample- prefix.
 * </p>
 *
 * @param describeLoadBalancerPoliciesRequest Container for the necessary parameters to execute the
 *           DescribeLoadBalancerPolicies service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DescribeLoadBalancerPolicies service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingPolicyNotFoundException For more information see <ElasticLoadBalancingPolicyNotFoundException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDescribeLoadBalancerPoliciesRequest
 * @see ElasticLoadBalancingDescribeLoadBalancerPoliciesResponse
 */
-(ElasticLoadBalancingDescribeLoadBalancerPoliciesResponse *)describeLoadBalancerPolicies:(ElasticLoadBalancingDescribeLoadBalancerPoliciesRequest *)describeLoadBalancerPoliciesRequest;


/**
 * <p>
 * Returns meta-information on the specified LoadBalancer policies defined by the Elastic Load Balancing service. The
 * policy types that are returned from this action can be used in a CreateLoadBalancerPolicy action to instantiate specific
 * policy configurations that will be applied to an Elastic LoadBalancer.
 * </p>
 *
 * @param describeLoadBalancerPolicyTypesRequest Container for the necessary parameters to execute the
 *           DescribeLoadBalancerPolicyTypes service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DescribeLoadBalancerPolicyTypes service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingPolicyTypeNotFoundException For more information see <ElasticLoadBalancingPolicyTypeNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequest
 * @see ElasticLoadBalancingDescribeLoadBalancerPolicyTypesResponse
 */
-(ElasticLoadBalancingDescribeLoadBalancerPolicyTypesResponse *)describeLoadBalancerPolicyTypes:(ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequest *)describeLoadBalancerPolicyTypesRequest;


/**
 * <p>
 * Sets the certificate that terminates the specified listener's SSL connections. The specified certificate replaces any
 * prior certificate that was used on the same LoadBalancer and port.
 * </p>
 *
 * @param setLoadBalancerListenerSSLCertificateRequest Container for the necessary parameters to execute the
 *           SetLoadBalancerListenerSSLCertificate service method on AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingListenerNotFoundException For more information see <ElasticLoadBalancingListenerNotFoundException>
 * @exception ElasticLoadBalancingCertificateNotFoundException For more information see <ElasticLoadBalancingCertificateNotFoundException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequest
 * @see ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponse
 */
-(ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponse *)setLoadBalancerListenerSSLCertificate:(ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequest *)setLoadBalancerListenerSSLCertificateRequest;


/**
 * <p>
 * Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of the browser (user-agent) or a
 * specified expiration period. This policy can be associated only with HTTP/HTTPS listeners.
 * </p>
 * <p>
 * When a LoadBalancer implements this policy, the LoadBalancer uses a special cookie to track the backend server instance
 * for each request. When the LoadBalancer receives a request, it first checks to see if this cookie is present in the
 * request. If so, the LoadBalancer sends the request to the application server specified in the cookie. If not, the
 * LoadBalancer sends the request to a server that is chosen based on the existing load balancing algorithm.
 * </p>
 * <p>
 * A cookie is inserted into the response for binding subsequent requests from the same user to that server. The validity
 * of the cookie is based on the cookie expiration time, which is specified in the policy configuration.
 * </p>
 *
 * @param createLBCookieStickinessPolicyRequest Container for the necessary parameters to execute the
 *           CreateLBCookieStickinessPolicy service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the CreateLBCookieStickinessPolicy service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingTooManyPoliciesException For more information see <ElasticLoadBalancingTooManyPoliciesException>
 * @exception ElasticLoadBalancingDuplicatePolicyNameException For more information see <ElasticLoadBalancingDuplicatePolicyNameException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingCreateLBCookieStickinessPolicyRequest
 * @see ElasticLoadBalancingCreateLBCookieStickinessPolicyResponse
 */
-(ElasticLoadBalancingCreateLBCookieStickinessPolicyResponse *)createLBCookieStickinessPolicy:(ElasticLoadBalancingCreateLBCookieStickinessPolicyRequest *)createLBCookieStickinessPolicyRequest;


/**
 * <p>
 * Deletes a policy from the LoadBalancer. The specified policy must not be enabled for any listeners.
 * </p>
 *
 * @param deleteLoadBalancerPolicyRequest Container for the necessary parameters to execute the DeleteLoadBalancerPolicy
 *           service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DeleteLoadBalancerPolicy service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDeleteLoadBalancerPolicyRequest
 * @see ElasticLoadBalancingDeleteLoadBalancerPolicyResponse
 */
-(ElasticLoadBalancingDeleteLoadBalancerPolicyResponse *)deleteLoadBalancerPolicy:(ElasticLoadBalancingDeleteLoadBalancerPolicyRequest *)deleteLoadBalancerPolicyRequest;


/**
 * <p>
 * Adds new instances to the LoadBalancer.
 * </p>
 * <p>
 * Once the instance is registered, it starts receiving traffic and requests from the LoadBalancer. Any instance that is
 * not in any of the Availability Zones registered for the LoadBalancer will be moved to the <i>OutOfService</i> state. It
 * will move to the <i>InService</i> state when the Availability Zone is added to the LoadBalancer.
 * </p>
 * <p>
 * <b>NOTE:</b> In order for this call to be successful, the client must have created the LoadBalancer. The client must
 * provide the same account credentials as those that were used to create the LoadBalancer.
 * </p>
 * <p>
 * <b>NOTE:</b> Completion of this API does not guarantee that operation has completed. Rather, it means that the request
 * has been registered and the changes will happen shortly.
 * </p>
 *
 * @param registerInstancesWithLoadBalancerRequest Container for the necessary parameters to execute the
 *           RegisterInstancesWithLoadBalancer service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the RegisterInstancesWithLoadBalancer service method, as returned by
 *         AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingInvalidInstanceException For more information see <ElasticLoadBalancingInvalidInstanceException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequest
 * @see ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponse
 */
-(ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponse *)registerInstancesWithLoadBalancer:(ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequest *)registerInstancesWithLoadBalancerRequest;


/**
 * <p>
 * Enables the client to define an application healthcheck for the instances.
 * </p>
 *
 * @param configureHealthCheckRequest Container for the necessary parameters to execute the ConfigureHealthCheck service
 *           method on AmazonElasticLoadBalancing.
 *
 * @return The response from the ConfigureHealthCheck service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingConfigureHealthCheckRequest
 * @see ElasticLoadBalancingConfigureHealthCheckResponse
 */
-(ElasticLoadBalancingConfigureHealthCheckResponse *)configureHealthCheck:(ElasticLoadBalancingConfigureHealthCheckRequest *)configureHealthCheckRequest;


/**
 * <p>
 * Returns detailed configuration information for the specified LoadBalancers. If no LoadBalancers are specified, the
 * operation returns configuration information for all LoadBalancers created by the caller.
 * </p>
 * <p>
 * <b>NOTE:</b> The client must have created the specified input LoadBalancers in order to retrieve this information; the
 * client must provide the same account credentials as those that were used to create the LoadBalancer.
 * </p>
 *
 * @param describeLoadBalancersRequest Container for the necessary parameters to execute the DescribeLoadBalancers service
 *           method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DescribeLoadBalancers service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDescribeLoadBalancersRequest
 * @see ElasticLoadBalancingDescribeLoadBalancersResponse
 */
-(ElasticLoadBalancingDescribeLoadBalancersResponse *)describeLoadBalancers:(ElasticLoadBalancingDescribeLoadBalancersRequest *)describeLoadBalancersRequest;


/**
 * <p>
 * Returns the current state of the instances of the specified LoadBalancer. If no instances are specified, the state of
 * all the instances for the LoadBalancer is returned.
 * </p>
 * <p>
 * <b>NOTE:</b> The client must have created the specified input LoadBalancer in order to retrieve this information; the
 * client must provide the same account credentials as those that were used to create the LoadBalancer.
 * </p>
 *
 * @param describeInstanceHealthRequest Container for the necessary parameters to execute the DescribeInstanceHealth
 *           service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DescribeInstanceHealth service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingInvalidInstanceException For more information see <ElasticLoadBalancingInvalidInstanceException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDescribeInstanceHealthRequest
 * @see ElasticLoadBalancingDescribeInstanceHealthResponse
 */
-(ElasticLoadBalancingDescribeInstanceHealthResponse *)describeInstanceHealth:(ElasticLoadBalancingDescribeInstanceHealthRequest *)describeInstanceHealthRequest;


/**
 * <p>
 * Adds one or more subnets to the set of configured subnets in the VPC for the LoadBalancer.
 * </p>
 * <p>
 * The Loadbalancers evenly distribute requests across all of the registered subnets.
 * </p>
 *
 * @param attachLoadBalancerToSubnetsRequest Container for the necessary parameters to execute the
 *           AttachLoadBalancerToSubnets service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the AttachLoadBalancerToSubnets service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingInvalidSubnetException For more information see <ElasticLoadBalancingInvalidSubnetException>
 * @exception ElasticLoadBalancingSubnetNotFoundException For more information see <ElasticLoadBalancingSubnetNotFoundException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingAttachLoadBalancerToSubnetsRequest
 * @see ElasticLoadBalancingAttachLoadBalancerToSubnetsResponse
 */
-(ElasticLoadBalancingAttachLoadBalancerToSubnetsResponse *)attachLoadBalancerToSubnets:(ElasticLoadBalancingAttachLoadBalancerToSubnetsRequest *)attachLoadBalancerToSubnetsRequest;


/**
 * <p>
 * Removes the specified EC2 Availability Zones from the set of configured Availability Zones for the LoadBalancer.
 * </p>
 * <p>
 * There must be at least one Availability Zone registered with a LoadBalancer at all times. A client cannot remove all
 * the Availability Zones from a LoadBalancer. Once an Availability Zone is removed, all the instances registered with the
 * LoadBalancer that are in the removed Availability Zone go into the OutOfService state. Upon Availability Zone removal,
 * the LoadBalancer attempts to equally balance the traffic among its remaining usable Availability Zones. Trying to remove
 * an Availability Zone that was not associated with the LoadBalancer does nothing.
 * </p>
 * <p>
 * <b>NOTE:</b> In order for this call to be successful, the client must have created the LoadBalancer. The client must
 * provide the same account credentials as those that were used to create the LoadBalancer.
 * </p>
 *
 * @param disableAvailabilityZonesForLoadBalancerRequest Container for the necessary parameters to execute the
 *           DisableAvailabilityZonesForLoadBalancer service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DisableAvailabilityZonesForLoadBalancer service method, as returned by
 *         AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequest
 * @see ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponse
 */
-(ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponse *)disableAvailabilityZonesForLoadBalancer:(ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequest *)disableAvailabilityZonesForLoadBalancerRequest;


/**
 * <p>
 * Creates one or more listeners on a LoadBalancer for the specified port. If a listener with the given port does not
 * already exist, it will be created; otherwise, the properties of the new listener must match the properties of the
 * existing listener.
 * </p>
 *
 * @param createLoadBalancerListenersRequest Container for the necessary parameters to execute the
 *           CreateLoadBalancerListeners service method on AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingCertificateNotFoundException For more information see <ElasticLoadBalancingCertificateNotFoundException>
 * @exception ElasticLoadBalancingDuplicateListenerException For more information see <ElasticLoadBalancingDuplicateListenerException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingCreateLoadBalancerListenersRequest
 * @see ElasticLoadBalancingCreateLoadBalancerListenersResponse
 */
-(ElasticLoadBalancingCreateLoadBalancerListenersResponse *)createLoadBalancerListeners:(ElasticLoadBalancingCreateLoadBalancerListenersRequest *)createLoadBalancerListenersRequest;


/**
 * <p>
 * Creates a new policy that contains the necessary attributes depending on the policy type. Policies are settings that
 * are saved for your Elastic LoadBalancer and that can be applied to the front-end listener, or the back-end application
 * server, depending on your policy type.
 * </p>
 *
 * @param createLoadBalancerPolicyRequest Container for the necessary parameters to execute the CreateLoadBalancerPolicy
 *           service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the CreateLoadBalancerPolicy service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingPolicyTypeNotFoundException For more information see <ElasticLoadBalancingPolicyTypeNotFoundException>
 * @exception ElasticLoadBalancingTooManyPoliciesException For more information see <ElasticLoadBalancingTooManyPoliciesException>
 * @exception ElasticLoadBalancingDuplicatePolicyNameException For more information see <ElasticLoadBalancingDuplicatePolicyNameException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingCreateLoadBalancerPolicyRequest
 * @see ElasticLoadBalancingCreateLoadBalancerPolicyResponse
 */
-(ElasticLoadBalancingCreateLoadBalancerPolicyResponse *)createLoadBalancerPolicy:(ElasticLoadBalancingCreateLoadBalancerPolicyRequest *)createLoadBalancerPolicyRequest;


/**
 * <p>
 * Replaces the current set of policies associated with a port on which the back-end server is listening with a new set of
 * policies. After the policies have been created using CreateLoadBalancerPolicy, they can be applied here as a list. At
 * this time, only the back-end server authentication policy type can be applied to the back-end ports; this policy type is
 * composed of multiple public key policies.
 * </p>
 *
 * @param setLoadBalancerPoliciesForBackendServerRequest Container for the necessary parameters to execute the
 *           SetLoadBalancerPoliciesForBackendServer service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the SetLoadBalancerPoliciesForBackendServer service method, as returned by
 *         AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingPolicyNotFoundException For more information see <ElasticLoadBalancingPolicyNotFoundException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequest
 * @see ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerResponse
 */
-(ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerResponse *)setLoadBalancerPoliciesForBackendServer:(ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequest *)setLoadBalancerPoliciesForBackendServerRequest;


/**
 * <p>
 * Removes subnets from the set of configured subnets in the VPC for the LoadBalancer.
 * </p>
 * <p>
 * After a subnet is removed all of the EndPoints registered with the LoadBalancer that are in the removed subnet will go
 * into the <i>OutOfService</i> state. When a subnet is removed, the LoadBalancer will balance the traffic among the
 * remaining routable subnets for the LoadBalancer.
 * </p>
 *
 * @param detachLoadBalancerFromSubnetsRequest Container for the necessary parameters to execute the
 *           DetachLoadBalancerFromSubnets service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the DetachLoadBalancerFromSubnets service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequest
 * @see ElasticLoadBalancingDetachLoadBalancerFromSubnetsResponse
 */
-(ElasticLoadBalancingDetachLoadBalancerFromSubnetsResponse *)detachLoadBalancerFromSubnets:(ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequest *)detachLoadBalancerFromSubnetsRequest;


/**
 * <p>
 * Associates one or more security groups with your LoadBalancer in VPC. The provided security group IDs will override any
 * currently applied security groups.
 * </p>
 *
 * @param applySecurityGroupsToLoadBalancerRequest Container for the necessary parameters to execute the
 *           ApplySecurityGroupsToLoadBalancer service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the ApplySecurityGroupsToLoadBalancer service method, as returned by
 *         AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 * @exception ElasticLoadBalancingInvalidSecurityGroupException For more information see <ElasticLoadBalancingInvalidSecurityGroupException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequest
 * @see ElasticLoadBalancingApplySecurityGroupsToLoadBalancerResponse
 */
-(ElasticLoadBalancingApplySecurityGroupsToLoadBalancerResponse *)applySecurityGroupsToLoadBalancer:(ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequest *)applySecurityGroupsToLoadBalancerRequest;


/**
 * <p>
 * Deletes the specified LoadBalancer.
 * </p>
 * <p>
 * If attempting to recreate the LoadBalancer, the client must reconfigure all the settings. The DNS name associated with
 * a deleted LoadBalancer will no longer be usable. Once deleted, the name and associated DNS record of the LoadBalancer no
 * longer exist and traffic sent to any of its IP addresses will no longer be delivered to client instances. The client
 * will not receive the same DNS name even if a new LoadBalancer with same LoadBalancerName is created.
 * </p>
 * <p>
 * To successfully call this API, the client must provide the same account credentials as were used to create the
 * LoadBalancer.
 * </p>
 * <p>
 * <b>NOTE:</b> By design, if the LoadBalancer does not exist or has already been deleted, DeleteLoadBalancer still
 * succeeds.
 * </p>
 *
 * @param deleteLoadBalancerRequest Container for the necessary parameters to execute the DeleteLoadBalancer service method
 *           on AmazonElasticLoadBalancing.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingDeleteLoadBalancerRequest
 * @see ElasticLoadBalancingDeleteLoadBalancerResponse
 */
-(ElasticLoadBalancingDeleteLoadBalancerResponse *)deleteLoadBalancer:(ElasticLoadBalancingDeleteLoadBalancerRequest *)deleteLoadBalancerRequest;


/**
 * <p>
 * Creates a new LoadBalancer.
 * </p>
 * <p>
 * After the call has completed successfully, a new LoadBalancer is created; however, it will not be usable until at least
 * one instance has been registered. When the LoadBalancer creation is completed, the client can check whether or not it is
 * usable by using the DescribeInstanceHealth API. The LoadBalancer is usable as soon as any registered instance is
 * <i>InService</i> .
 *
 * </p>
 * <p>
 * <b>NOTE:</b> Currently, the client's quota of LoadBalancers is limited to ten per Region.
 * </p>
 * <p>
 * <b>NOTE:</b> LoadBalancer DNS names vary depending on the Region they're created in. For LoadBalancers created in the
 * United States, the DNS name ends with: us-east-1.elb.amazonaws.com (for the US Standard Region)
 * us-west-1.elb.amazonaws.com (for the Northern California Region) For LoadBalancers created in the EU (Ireland) Region,
 * the DNS name ends with: eu-west-1.elb.amazonaws.com
 * </p>
 *
 * @param createLoadBalancerRequest Container for the necessary parameters to execute the CreateLoadBalancer service method
 *           on AmazonElasticLoadBalancing.
 *
 * @return The response from the CreateLoadBalancer service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingInvalidSubnetException For more information see <ElasticLoadBalancingInvalidSubnetException>
 * @exception ElasticLoadBalancingCertificateNotFoundException For more information see <ElasticLoadBalancingCertificateNotFoundException>
 * @exception ElasticLoadBalancingSubnetNotFoundException For more information see <ElasticLoadBalancingSubnetNotFoundException>
 * @exception ElasticLoadBalancingTooManyLoadBalancersException For more information see <ElasticLoadBalancingTooManyLoadBalancersException>
 * @exception ElasticLoadBalancingDuplicateLoadBalancerNameException For more information see <ElasticLoadBalancingDuplicateLoadBalancerNameException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 * @exception ElasticLoadBalancingInvalidSecurityGroupException For more information see <ElasticLoadBalancingInvalidSecurityGroupException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingCreateLoadBalancerRequest
 * @see ElasticLoadBalancingCreateLoadBalancerResponse
 */
-(ElasticLoadBalancingCreateLoadBalancerResponse *)createLoadBalancer:(ElasticLoadBalancingCreateLoadBalancerRequest *)createLoadBalancerRequest;


/**
 * <p>
 * Generates a stickiness policy with sticky session lifetimes that follow that of an application-generated cookie. This
 * policy can be associated only with HTTP/HTTPS listeners.
 * </p>
 * <p>
 * This policy is similar to the policy created by CreateLBCookieStickinessPolicy, except that the lifetime of the special
 * Elastic Load Balancing cookie follows the lifetime of the application-generated cookie specified in the policy
 * configuration. The LoadBalancer only inserts a new stickiness cookie when the application response includes a new
 * application cookie.
 * </p>
 * <p>
 * If the application cookie is explicitly removed or expires, the session stops being sticky until a new application
 * cookie is issued.
 * </p>
 * <p>
 * <b>NOTE:</b> An application client must receive and send two cookies: the application-generated cookie and the special
 * Elastic Load Balancing cookie named AWSELB. This is the default behavior for many common web browsers.
 * </p>
 *
 * @param createAppCookieStickinessPolicyRequest Container for the necessary parameters to execute the
 *           CreateAppCookieStickinessPolicy service method on AmazonElasticLoadBalancing.
 *
 * @return The response from the CreateAppCookieStickinessPolicy service method, as returned by AmazonElasticLoadBalancing.
 *
 * @exception ElasticLoadBalancingTooManyPoliciesException For more information see <ElasticLoadBalancingTooManyPoliciesException>
 * @exception ElasticLoadBalancingDuplicatePolicyNameException For more information see <ElasticLoadBalancingDuplicatePolicyNameException>
 * @exception ElasticLoadBalancingLoadBalancerNotFoundException For more information see <ElasticLoadBalancingLoadBalancerNotFoundException>
 * @exception ElasticLoadBalancingInvalidConfigurationRequestException For more information see <ElasticLoadBalancingInvalidConfigurationRequestException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonElasticLoadBalancing indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see ElasticLoadBalancingCreateAppCookieStickinessPolicyRequest
 * @see ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse
 */
-(ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse *)createAppCookieStickinessPolicy:(ElasticLoadBalancingCreateAppCookieStickinessPolicyRequest *)createAppCookieStickinessPolicyRequest;



@end

