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

#import "AmazonElasticLoadBalancingClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonElasticLoadBalancingClient

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = @"https://elasticloadbalancing.amazonaws.com";
    }
    return self;
}

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = @"https://elasticloadbalancing.amazonaws.com";
    }
    return self;
}

-(ElasticLoadBalancingDeleteLoadBalancerListenersResponse *)deleteLoadBalancerListeners:(ElasticLoadBalancingDeleteLoadBalancerListenersRequest *)deleteLoadBalancerListenersRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeleteLoadBalancerListenersRequestMarshaller createRequest:deleteLoadBalancerListenersRequest];

    return (ElasticLoadBalancingDeleteLoadBalancerListenersResponse *)[self invoke:request rawRequest:deleteLoadBalancerListenersRequest unmarshallerDelegate:[ElasticLoadBalancingDeleteLoadBalancerListenersResponseUnmarshaller class]];
}

-(ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponse *)setLoadBalancerPoliciesOfListener:(ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest *)setLoadBalancerPoliciesOfListenerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequestMarshaller createRequest:setLoadBalancerPoliciesOfListenerRequest];

    return (ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponse *)[self invoke:request rawRequest:setLoadBalancerPoliciesOfListenerRequest unmarshallerDelegate:[ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponse *)enableAvailabilityZonesForLoadBalancer:(ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequest *)enableAvailabilityZonesForLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequestMarshaller createRequest:enableAvailabilityZonesForLoadBalancerRequest];

    return (ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponse *)[self invoke:request rawRequest:enableAvailabilityZonesForLoadBalancerRequest unmarshallerDelegate:[ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponse *)deregisterInstancesFromLoadBalancer:(ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequest *)deregisterInstancesFromLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequestMarshaller createRequest:deregisterInstancesFromLoadBalancerRequest];

    return (ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponse *)[self invoke:request rawRequest:deregisterInstancesFromLoadBalancerRequest unmarshallerDelegate:[ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDescribeLoadBalancerPoliciesResponse *)describeLoadBalancerPolicies:(ElasticLoadBalancingDescribeLoadBalancerPoliciesRequest *)describeLoadBalancerPoliciesRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDescribeLoadBalancerPoliciesRequestMarshaller createRequest:describeLoadBalancerPoliciesRequest];

    return (ElasticLoadBalancingDescribeLoadBalancerPoliciesResponse *)[self invoke:request rawRequest:describeLoadBalancerPoliciesRequest unmarshallerDelegate:[ElasticLoadBalancingDescribeLoadBalancerPoliciesResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDescribeLoadBalancerPolicyTypesResponse *)describeLoadBalancerPolicyTypes:(ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequest *)describeLoadBalancerPolicyTypesRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDescribeLoadBalancerPolicyTypesRequestMarshaller createRequest:describeLoadBalancerPolicyTypesRequest];

    return (ElasticLoadBalancingDescribeLoadBalancerPolicyTypesResponse *)[self invoke:request rawRequest:describeLoadBalancerPolicyTypesRequest unmarshallerDelegate:[ElasticLoadBalancingDescribeLoadBalancerPolicyTypesResponseUnmarshaller class]];
}

-(ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponse *)setLoadBalancerListenerSSLCertificate:(ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequest *)setLoadBalancerListenerSSLCertificateRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequestMarshaller createRequest:setLoadBalancerListenerSSLCertificateRequest];

    return (ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponse *)[self invoke:request rawRequest:setLoadBalancerListenerSSLCertificateRequest unmarshallerDelegate:[ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateLBCookieStickinessPolicyResponse *)createLBCookieStickinessPolicy:(ElasticLoadBalancingCreateLBCookieStickinessPolicyRequest *)createLBCookieStickinessPolicyRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateLBCookieStickinessPolicyRequestMarshaller createRequest:createLBCookieStickinessPolicyRequest];

    return (ElasticLoadBalancingCreateLBCookieStickinessPolicyResponse *)[self invoke:request rawRequest:createLBCookieStickinessPolicyRequest unmarshallerDelegate:[ElasticLoadBalancingCreateLBCookieStickinessPolicyResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDeleteLoadBalancerPolicyResponse *)deleteLoadBalancerPolicy:(ElasticLoadBalancingDeleteLoadBalancerPolicyRequest *)deleteLoadBalancerPolicyRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeleteLoadBalancerPolicyRequestMarshaller createRequest:deleteLoadBalancerPolicyRequest];

    return (ElasticLoadBalancingDeleteLoadBalancerPolicyResponse *)[self invoke:request rawRequest:deleteLoadBalancerPolicyRequest unmarshallerDelegate:[ElasticLoadBalancingDeleteLoadBalancerPolicyResponseUnmarshaller class]];
}

-(ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponse *)registerInstancesWithLoadBalancer:(ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequest *)registerInstancesWithLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequestMarshaller createRequest:registerInstancesWithLoadBalancerRequest];

    return (ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponse *)[self invoke:request rawRequest:registerInstancesWithLoadBalancerRequest unmarshallerDelegate:[ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingConfigureHealthCheckResponse *)configureHealthCheck:(ElasticLoadBalancingConfigureHealthCheckRequest *)configureHealthCheckRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingConfigureHealthCheckRequestMarshaller createRequest:configureHealthCheckRequest];

    return (ElasticLoadBalancingConfigureHealthCheckResponse *)[self invoke:request rawRequest:configureHealthCheckRequest unmarshallerDelegate:[ElasticLoadBalancingConfigureHealthCheckResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDescribeLoadBalancersResponse *)describeLoadBalancers:(ElasticLoadBalancingDescribeLoadBalancersRequest *)describeLoadBalancersRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDescribeLoadBalancersRequestMarshaller createRequest:describeLoadBalancersRequest];

    return (ElasticLoadBalancingDescribeLoadBalancersResponse *)[self invoke:request rawRequest:describeLoadBalancersRequest unmarshallerDelegate:[ElasticLoadBalancingDescribeLoadBalancersResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDescribeInstanceHealthResponse *)describeInstanceHealth:(ElasticLoadBalancingDescribeInstanceHealthRequest *)describeInstanceHealthRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDescribeInstanceHealthRequestMarshaller createRequest:describeInstanceHealthRequest];

    return (ElasticLoadBalancingDescribeInstanceHealthResponse *)[self invoke:request rawRequest:describeInstanceHealthRequest unmarshallerDelegate:[ElasticLoadBalancingDescribeInstanceHealthResponseUnmarshaller class]];
}

-(ElasticLoadBalancingAttachLoadBalancerToSubnetsResponse *)attachLoadBalancerToSubnets:(ElasticLoadBalancingAttachLoadBalancerToSubnetsRequest *)attachLoadBalancerToSubnetsRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingAttachLoadBalancerToSubnetsRequestMarshaller createRequest:attachLoadBalancerToSubnetsRequest];

    return (ElasticLoadBalancingAttachLoadBalancerToSubnetsResponse *)[self invoke:request rawRequest:attachLoadBalancerToSubnetsRequest unmarshallerDelegate:[ElasticLoadBalancingAttachLoadBalancerToSubnetsResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponse *)disableAvailabilityZonesForLoadBalancer:(ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequest *)disableAvailabilityZonesForLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequestMarshaller createRequest:disableAvailabilityZonesForLoadBalancerRequest];

    return (ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponse *)[self invoke:request rawRequest:disableAvailabilityZonesForLoadBalancerRequest unmarshallerDelegate:[ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateLoadBalancerListenersResponse *)createLoadBalancerListeners:(ElasticLoadBalancingCreateLoadBalancerListenersRequest *)createLoadBalancerListenersRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateLoadBalancerListenersRequestMarshaller createRequest:createLoadBalancerListenersRequest];

    return (ElasticLoadBalancingCreateLoadBalancerListenersResponse *)[self invoke:request rawRequest:createLoadBalancerListenersRequest unmarshallerDelegate:[ElasticLoadBalancingCreateLoadBalancerListenersResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateLoadBalancerPolicyResponse *)createLoadBalancerPolicy:(ElasticLoadBalancingCreateLoadBalancerPolicyRequest *)createLoadBalancerPolicyRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateLoadBalancerPolicyRequestMarshaller createRequest:createLoadBalancerPolicyRequest];

    return (ElasticLoadBalancingCreateLoadBalancerPolicyResponse *)[self invoke:request rawRequest:createLoadBalancerPolicyRequest unmarshallerDelegate:[ElasticLoadBalancingCreateLoadBalancerPolicyResponseUnmarshaller class]];
}

-(ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerResponse *)setLoadBalancerPoliciesForBackendServer:(ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequest *)setLoadBalancerPoliciesForBackendServerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerRequestMarshaller createRequest:setLoadBalancerPoliciesForBackendServerRequest];

    return (ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerResponse *)[self invoke:request rawRequest:setLoadBalancerPoliciesForBackendServerRequest unmarshallerDelegate:[ElasticLoadBalancingSetLoadBalancerPoliciesForBackendServerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDetachLoadBalancerFromSubnetsResponse *)detachLoadBalancerFromSubnets:(ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequest *)detachLoadBalancerFromSubnetsRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDetachLoadBalancerFromSubnetsRequestMarshaller createRequest:detachLoadBalancerFromSubnetsRequest];

    return (ElasticLoadBalancingDetachLoadBalancerFromSubnetsResponse *)[self invoke:request rawRequest:detachLoadBalancerFromSubnetsRequest unmarshallerDelegate:[ElasticLoadBalancingDetachLoadBalancerFromSubnetsResponseUnmarshaller class]];
}

-(ElasticLoadBalancingApplySecurityGroupsToLoadBalancerResponse *)applySecurityGroupsToLoadBalancer:(ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequest *)applySecurityGroupsToLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingApplySecurityGroupsToLoadBalancerRequestMarshaller createRequest:applySecurityGroupsToLoadBalancerRequest];

    return (ElasticLoadBalancingApplySecurityGroupsToLoadBalancerResponse *)[self invoke:request rawRequest:applySecurityGroupsToLoadBalancerRequest unmarshallerDelegate:[ElasticLoadBalancingApplySecurityGroupsToLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDeleteLoadBalancerResponse *)deleteLoadBalancer:(ElasticLoadBalancingDeleteLoadBalancerRequest *)deleteLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeleteLoadBalancerRequestMarshaller createRequest:deleteLoadBalancerRequest];

    return (ElasticLoadBalancingDeleteLoadBalancerResponse *)[self invoke:request rawRequest:deleteLoadBalancerRequest unmarshallerDelegate:[ElasticLoadBalancingDeleteLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateLoadBalancerResponse *)createLoadBalancer:(ElasticLoadBalancingCreateLoadBalancerRequest *)createLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateLoadBalancerRequestMarshaller createRequest:createLoadBalancerRequest];

    return (ElasticLoadBalancingCreateLoadBalancerResponse *)[self invoke:request rawRequest:createLoadBalancerRequest unmarshallerDelegate:[ElasticLoadBalancingCreateLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse *)createAppCookieStickinessPolicy:(ElasticLoadBalancingCreateAppCookieStickinessPolicyRequest *)createAppCookieStickinessPolicyRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateAppCookieStickinessPolicyRequestMarshaller createRequest:createAppCookieStickinessPolicyRequest];

    return (ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse *)[self invoke:request rawRequest:createAppCookieStickinessPolicyRequest unmarshallerDelegate:[ElasticLoadBalancingCreateAppCookieStickinessPolicyResponseUnmarshaller class]];
}



@end

