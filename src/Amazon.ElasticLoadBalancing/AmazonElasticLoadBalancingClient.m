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

-(ElasticLoadBalancingCreateLoadBalancerListenersResponse *)createLoadBalancerListeners:(ElasticLoadBalancingCreateLoadBalancerListenersRequest *)createLoadBalancerListenersRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateLoadBalancerListenersRequestMarshaller createRequest:createLoadBalancerListenersRequest];

    return (ElasticLoadBalancingCreateLoadBalancerListenersResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingCreateLoadBalancerListenersResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDeleteLoadBalancerListenersResponse *)deleteLoadBalancerListeners:(ElasticLoadBalancingDeleteLoadBalancerListenersRequest *)deleteLoadBalancerListenersRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeleteLoadBalancerListenersRequestMarshaller createRequest:deleteLoadBalancerListenersRequest];

    return (ElasticLoadBalancingDeleteLoadBalancerListenersResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingDeleteLoadBalancerListenersResponseUnmarshaller class]];
}

-(ElasticLoadBalancingConfigureHealthCheckResponse *)configureHealthCheck:(ElasticLoadBalancingConfigureHealthCheckRequest *)configureHealthCheckRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingConfigureHealthCheckRequestMarshaller createRequest:configureHealthCheckRequest];

    return (ElasticLoadBalancingConfigureHealthCheckResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingConfigureHealthCheckResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDescribeLoadBalancersResponse *)describeLoadBalancers:(ElasticLoadBalancingDescribeLoadBalancersRequest *)describeLoadBalancersRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDescribeLoadBalancersRequestMarshaller createRequest:describeLoadBalancersRequest];

    return (ElasticLoadBalancingDescribeLoadBalancersResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingDescribeLoadBalancersResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateLBCookieStickinessPolicyResponse *)createLBCookieStickinessPolicy:(ElasticLoadBalancingCreateLBCookieStickinessPolicyRequest *)createLBCookieStickinessPolicyRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateLBCookieStickinessPolicyRequestMarshaller createRequest:createLBCookieStickinessPolicyRequest];

    return (ElasticLoadBalancingCreateLBCookieStickinessPolicyResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingCreateLBCookieStickinessPolicyResponseUnmarshaller class]];
}

-(ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponse *)enableAvailabilityZonesForLoadBalancer:(ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequest *)enableAvailabilityZonesForLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerRequestMarshaller createRequest:enableAvailabilityZonesForLoadBalancerRequest];

    return (ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingEnableAvailabilityZonesForLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDescribeInstanceHealthResponse *)describeInstanceHealth:(ElasticLoadBalancingDescribeInstanceHealthRequest *)describeInstanceHealthRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDescribeInstanceHealthRequestMarshaller createRequest:describeInstanceHealthRequest];

    return (ElasticLoadBalancingDescribeInstanceHealthResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingDescribeInstanceHealthResponseUnmarshaller class]];
}

-(ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponse *)setLoadBalancerListenerSSLCertificate:(ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequest *)setLoadBalancerListenerSSLCertificateRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequestMarshaller createRequest:setLoadBalancerListenerSSLCertificateRequest];

    return (ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateResponseUnmarshaller class]];
}

-(ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponse *)setLoadBalancerPoliciesOfListener:(ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest *)setLoadBalancerPoliciesOfListenerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequestMarshaller createRequest:setLoadBalancerPoliciesOfListenerRequest];

    return (ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateLoadBalancerResponse *)createLoadBalancer:(ElasticLoadBalancingCreateLoadBalancerRequest *)createLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateLoadBalancerRequestMarshaller createRequest:createLoadBalancerRequest];

    return (ElasticLoadBalancingCreateLoadBalancerResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingCreateLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponse *)registerInstancesWithLoadBalancer:(ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequest *)registerInstancesWithLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingRegisterInstancesWithLoadBalancerRequestMarshaller createRequest:registerInstancesWithLoadBalancerRequest];

    return (ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingRegisterInstancesWithLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse *)createAppCookieStickinessPolicy:(ElasticLoadBalancingCreateAppCookieStickinessPolicyRequest *)createAppCookieStickinessPolicyRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingCreateAppCookieStickinessPolicyRequestMarshaller createRequest:createAppCookieStickinessPolicyRequest];

    return (ElasticLoadBalancingCreateAppCookieStickinessPolicyResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingCreateAppCookieStickinessPolicyResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDeleteLoadBalancerResponse *)deleteLoadBalancer:(ElasticLoadBalancingDeleteLoadBalancerRequest *)deleteLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeleteLoadBalancerRequestMarshaller createRequest:deleteLoadBalancerRequest];

    return (ElasticLoadBalancingDeleteLoadBalancerResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingDeleteLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponse *)disableAvailabilityZonesForLoadBalancer:(ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequest *)disableAvailabilityZonesForLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerRequestMarshaller createRequest:disableAvailabilityZonesForLoadBalancerRequest];

    return (ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingDisableAvailabilityZonesForLoadBalancerResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDeleteLoadBalancerPolicyResponse *)deleteLoadBalancerPolicy:(ElasticLoadBalancingDeleteLoadBalancerPolicyRequest *)deleteLoadBalancerPolicyRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeleteLoadBalancerPolicyRequestMarshaller createRequest:deleteLoadBalancerPolicyRequest];

    return (ElasticLoadBalancingDeleteLoadBalancerPolicyResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingDeleteLoadBalancerPolicyResponseUnmarshaller class]];
}

-(ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponse *)deregisterInstancesFromLoadBalancer:(ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequest *)deregisterInstancesFromLoadBalancerRequest
{
    AmazonServiceRequest *request = [ElasticLoadBalancingDeregisterInstancesFromLoadBalancerRequestMarshaller createRequest:deregisterInstancesFromLoadBalancerRequest];

    return (ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponse *)[self parseResponse:[self invoke:request] withDelegateType:[ElasticLoadBalancingDeregisterInstancesFromLoadBalancerResponseUnmarshaller class]];
}



@end

