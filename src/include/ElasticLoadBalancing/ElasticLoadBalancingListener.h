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




/**
 * Listener
 */

@interface ElasticLoadBalancingListener:NSObject

{
    NSString *protocol;
    NSNumber *loadBalancerPort;
    NSString *instanceProtocol;
    NSNumber *instancePort;
    NSString *sSLCertificateId;
}



/**
 * Specifies the LoadBalancer transport protocol to use for routing -
 * HTTP, HTTPS, TCP or SSL. This property cannot be modified for the life
 * of the LoadBalancer.
 */
@property (nonatomic, retain) NSString *protocol;

/**
 * Specifies the external LoadBalancer port number. This property cannot
 * be modified for the life of the LoadBalancer.
 */
@property (nonatomic, retain) NSNumber *loadBalancerPort;

/**
 * Specifies the protocol to use for routing traffic to back-end
 * instances - HTTP, HTTPS, TCP, or SSL. This property cannot be modified
 * for the life of the LoadBalancer. <note> If the front-end protocol is
 * HTTP or HTTPS, <code>InstanceProtocol</code> has to be at the same
 * protocol layer, i.e., HTTP or HTTPS. Likewise, if the front-end
 * protocol is TCP or SSL, InstanceProtocol has to be TCP or SSL. </note>
 * <note> If there is another listener with the same
 * <code>InstancePort</code> whose <code>InstanceProtocol</code> is
 * secure, i.e., HTTPS or SSL, the listener's
 * <code>InstanceProtocol</code> has to be secure, i.e., HTTPS or SSL. If
 * there is another listener with the same <code>InstancePort</code>
 * whose <code>InstanceProtocol</code> is HTTP or TCP, the listener's
 * <code>InstanceProtocol</code> must be either HTTP or TCP. </note>
 */
@property (nonatomic, retain) NSString *instanceProtocol;

/**
 * Specifies the TCP port on which the instance server is listening. This
 * property cannot be modified for the life of the LoadBalancer.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 65535<br/>
 */
@property (nonatomic, retain) NSNumber *instancePort;

/**
 * The ARN string of the server certificate. To get the ARN of the server
 * certificate, call the AWS Identity and Access Management <a
 * e/index.html?API_UploadServerCertificate.html">UploadServerCertificate
 * </a> API.
 */
@property (nonatomic, retain) NSString *sSLCertificateId;


/**
 * Default constructor for a new Listener object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new Listener object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theProtocol Specifies the LoadBalancer transport protocol to
 * use for routing - HTTP, HTTPS, TCP or SSL. This property cannot be
 * modified for the life of the LoadBalancer.
 * @param theLoadBalancerPort Specifies the external LoadBalancer port
 * number. This property cannot be modified for the life of the
 * LoadBalancer.
 * @param theInstancePort Specifies the TCP port on which the instance
 * server is listening. This property cannot be modified for the life of
 * the LoadBalancer.
 */
-(id)initWithProtocol:(NSString *)theProtocol andLoadBalancerPort:(NSNumber *)theLoadBalancerPort andInstancePort:(NSNumber *)theInstancePort;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
