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




/**
 * Listener
 *
 * \ingroup ElasticLoadBalancing
 */

@interface ElasticLoadBalancingListener:NSObject

{
    NSString *protocol;
    NSNumber *loadBalancerPort;
    NSNumber *instancePort;
    NSString *sSLCertificateId;
}


/**
 * Specifies the LoadBalancer transport protocol to use for routing - TCP
 * or HTTP. This property cannot be modified for the life of the
 * LoadBalancer.
 */
@property (nonatomic, retain) NSString *protocol;

/**
 * Specifies the LoadBalancer transport protocol to use for routing - TCP
 * or HTTP. This property cannot be modified for the life of the
 * LoadBalancer.
 */
@property (nonatomic, retain) NSNumber *loadBalancerPort;

/**
 * Specifies the TCP port on which the instance server is listening. This
 * property cannot be modified for the life of the LoadBalancer.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Range: </b>1 - 65535<br/>
 */
@property (nonatomic, retain) NSNumber *instancePort;

/**
 * The ID of the SSL certificate chain to use. For more information on
 * SSL certificates, see <a
 * ervices.com/IAM/latest/UserGuide/index.html?ManagingCredentials.html">
 * Managing Keys and Certificates </a> in the AWS Identity and Access
 * Management documentation.
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
 * use for routing - TCP or HTTP. This property cannot be modified for
 * the life of the LoadBalancer.
 * @param theLoadBalancerPort Specifies the LoadBalancer transport
 * protocol to use for routing - TCP or HTTP. This property cannot be
 * modified for the life of the LoadBalancer.
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
