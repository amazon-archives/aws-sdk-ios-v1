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

#import "ElasticLoadBalancingListener.h"


@implementation ElasticLoadBalancingListener

@synthesize protocol;
@synthesize loadBalancerPort;
@synthesize instanceProtocol;
@synthesize instancePort;
@synthesize sSLCertificateId;


-(id)init
{
    if (self = [super init]) {
        protocol         = nil;
        loadBalancerPort = nil;
        instanceProtocol = nil;
        instancePort     = nil;
        sSLCertificateId = nil;
    }

    return self;
}

-(id)initWithProtocol:(NSString *)theProtocol andLoadBalancerPort:(NSNumber *)theLoadBalancerPort andInstancePort:(NSNumber *)theInstancePort
{
    if (self = [self init]) {
        self.protocol         = theProtocol;
        self.loadBalancerPort = theLoadBalancerPort;
        self.instancePort     = theInstancePort;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Protocol: %@,", protocol] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerPort: %@,", loadBalancerPort] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceProtocol: %@,", instanceProtocol] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstancePort: %@,", instancePort] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SSLCertificateId: %@,", sSLCertificateId] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [protocol release];
    [loadBalancerPort release];
    [instanceProtocol release];
    [instancePort release];
    [sSLCertificateId release];

    [super dealloc];
}


@end
