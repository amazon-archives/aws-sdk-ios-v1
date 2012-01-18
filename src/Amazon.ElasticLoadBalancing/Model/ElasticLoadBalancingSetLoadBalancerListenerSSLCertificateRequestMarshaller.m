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

#import "ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequestMarshaller.h"

@implementation ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequestMarshaller

+(AmazonServiceRequest *)createRequest:(ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequest *)setLoadBalancerListenerSSLCertificateRequest
{
    AmazonServiceRequest *request = [[ElasticLoadBalancingRequest alloc] init];

    [request setParameterValue:@"SetLoadBalancerListenerSSLCertificate"           forKey:@"Action"];
    [request setParameterValue:@"2011-11-15"   forKey:@"Version"];

    [request setDelegate:[setLoadBalancerListenerSSLCertificateRequest delegate]];
    [request setCredentials:[setLoadBalancerListenerSSLCertificateRequest credentials]];
    [request setEndpoint:[setLoadBalancerListenerSSLCertificateRequest requestEndpoint]];
    [request setRequestTag:[setLoadBalancerListenerSSLCertificateRequest requestTag]];

    if (setLoadBalancerListenerSSLCertificateRequest != nil) {
        if (setLoadBalancerListenerSSLCertificateRequest.loadBalancerName != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setLoadBalancerListenerSSLCertificateRequest.loadBalancerName] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerName"]];
        }
    }
    if (setLoadBalancerListenerSSLCertificateRequest != nil) {
        if (setLoadBalancerListenerSSLCertificateRequest.loadBalancerPort != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setLoadBalancerListenerSSLCertificateRequest.loadBalancerPort] forKey:[NSString stringWithFormat:@"%@", @"LoadBalancerPort"]];
        }
    }
    if (setLoadBalancerListenerSSLCertificateRequest != nil) {
        if (setLoadBalancerListenerSSLCertificateRequest.sSLCertificateId != nil) {
            [request setParameterValue:[NSString stringWithFormat:@"%@", setLoadBalancerListenerSSLCertificateRequest.sSLCertificateId] forKey:[NSString stringWithFormat:@"%@", @"SSLCertificateId"]];
        }
    }


    return [request autorelease];
}

@end

