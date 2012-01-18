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

#import "ElasticLoadBalancingDescribeLoadBalancersRequest.h"


@implementation ElasticLoadBalancingDescribeLoadBalancersRequest

@synthesize loadBalancerNames;
@synthesize marker;


-(id)init
{
    if (self = [super init]) {
        loadBalancerNames = [[NSMutableArray alloc] initWithCapacity:1];
        marker            = nil;
    }

    return self;
}

-(id)initWithLoadBalancerNames:(NSMutableArray *)theLoadBalancerNames
{
    if (self = [self init]) {
        self.loadBalancerNames = theLoadBalancerNames;
    }

    return self;
}


-(void)addLoadBalancerName:(NSString *)loadBalancerNameObject
{
    if (loadBalancerNames == nil) {
        loadBalancerNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [loadBalancerNames addObject:loadBalancerNameObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LoadBalancerNames: %@,", loadBalancerNames] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Marker: %@,", marker] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [loadBalancerNames release];
    [marker release];

    [super dealloc];
}


@end
