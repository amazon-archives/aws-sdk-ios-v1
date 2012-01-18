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

#import "ElasticLoadBalancingDeleteLoadBalancerListenersRequest.h"


@implementation ElasticLoadBalancingDeleteLoadBalancerListenersRequest

@synthesize loadBalancerName;
@synthesize loadBalancerPorts;


-(id)init
{
    if (self = [super init]) {
        loadBalancerName  = nil;
        loadBalancerPorts = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andLoadBalancerPorts:(NSMutableArray *)theLoadBalancerPorts
{
    if (self = [self init]) {
        self.loadBalancerName  = theLoadBalancerName;
        self.loadBalancerPorts = theLoadBalancerPorts;
    }

    return self;
}


-(void)addLoadBalancerPort:(NSNumber *)loadBalancerPortObject
{
    if (loadBalancerPorts == nil) {
        loadBalancerPorts = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [loadBalancerPorts addObject:loadBalancerPortObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerName: %@,", loadBalancerName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerPorts: %@,", loadBalancerPorts] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [loadBalancerName release];
    [loadBalancerPorts release];

    [super dealloc];
}


@end
