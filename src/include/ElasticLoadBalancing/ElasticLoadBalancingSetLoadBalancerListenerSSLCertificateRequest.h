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


#import "../AmazonServiceRequestConfig.h"



/**
 * Set Load Balancer Listener S S L Certificate Request
 */

@interface ElasticLoadBalancingSetLoadBalancerListenerSSLCertificateRequest:AmazonServiceRequestConfig

{
    NSString *loadBalancerName;
    NSNumber *loadBalancerPort;
    NSString *sSLCertificateId;
}



/**
 * The name of the the LoadBalancer.
 */
@property (nonatomic, retain) NSString *loadBalancerName;

/**
 * The port that uses the specified SSL certificate.
 */
@property (nonatomic, retain) NSNumber *loadBalancerPort;

/**
 * The ID of the SSL certificate chain to use. For more information on
 * SSL certificates, see <a
 * .amazonwebservices.com/IAM/latest/UserGuide/ManagingServerCerts.html">
 * Managing Server Certificates </a> in the AWS Identity and Access
 * Management documentation.
 */
@property (nonatomic, retain) NSString *sSLCertificateId;


/**
 * Default constructor for a new SetLoadBalancerListenerSSLCertificateRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new SetLoadBalancerListenerSSLCertificateRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theLoadBalancerName The name of the the LoadBalancer.
 * @param theLoadBalancerPort The port that uses the specified SSL
 * certificate.
 * @param theSSLCertificateId The ID of the SSL certificate chain to use.
 * For more information on SSL certificates, see <a
 * .amazonwebservices.com/IAM/latest/UserGuide/ManagingServerCerts.html">
 * Managing Server Certificates </a> in the AWS Identity and Access
 * Management documentation.
 */
-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andLoadBalancerPort:(NSNumber *)theLoadBalancerPort andSSLCertificateId:(NSString *)theSSLCertificateId;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
