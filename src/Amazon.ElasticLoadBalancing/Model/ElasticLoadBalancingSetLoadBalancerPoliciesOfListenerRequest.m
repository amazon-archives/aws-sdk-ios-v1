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

#import "ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest.h"


@implementation ElasticLoadBalancingSetLoadBalancerPoliciesOfListenerRequest

@synthesize loadBalancerName;
@synthesize loadBalancerPort;
@synthesize policyNames;


-(id)init
{
    if (self = [super init]) {
        loadBalancerName = nil;
        loadBalancerPort = nil;
        policyNames      = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName andLoadBalancerPort:(NSNumber *)theLoadBalancerPort andPolicyNames:(NSMutableArray *)thePolicyNames
{
    if (self = [self init]) {
        self.loadBalancerName = theLoadBalancerName;
        self.loadBalancerPort = theLoadBalancerPort;
        self.policyNames      = thePolicyNames;
    }

    return self;
}


-(void)addPolicyName:(NSString *)policyNameObject
{
    if (policyNames == nil) {
        policyNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [policyNames addObject:policyNameObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerName: %@,", loadBalancerName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerPort: %@,", loadBalancerPort] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PolicyNames: %@,", policyNames] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [loadBalancerName release];
    [loadBalancerPort release];
    [policyNames release];

    [super dealloc];
}


@end
