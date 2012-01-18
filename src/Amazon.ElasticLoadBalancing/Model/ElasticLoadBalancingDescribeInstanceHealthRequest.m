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

#import "ElasticLoadBalancingDescribeInstanceHealthRequest.h"


@implementation ElasticLoadBalancingDescribeInstanceHealthRequest

@synthesize loadBalancerName;
@synthesize instances;


-(id)init
{
    if (self = [super init]) {
        loadBalancerName = nil;
        instances        = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithLoadBalancerName:(NSString *)theLoadBalancerName
{
    if (self = [self init]) {
        self.loadBalancerName = theLoadBalancerName;
    }

    return self;
}


-(void)addInstance:(ElasticLoadBalancingInstance *)instanceObject
{
    if (instances == nil) {
        instances = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instances addObject:instanceObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerName: %@,", loadBalancerName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Instances: %@,", instances] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [loadBalancerName release];
    [instances release];

    [super dealloc];
}


@end
