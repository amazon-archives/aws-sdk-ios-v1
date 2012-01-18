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

#import "ElasticLoadBalancingHealthCheck.h"


@implementation ElasticLoadBalancingHealthCheck

@synthesize target;
@synthesize interval;
@synthesize timeout;
@synthesize unhealthyThreshold;
@synthesize healthyThreshold;


-(id)init
{
    if (self = [super init]) {
        target             = nil;
        interval           = nil;
        timeout            = nil;
        unhealthyThreshold = nil;
        healthyThreshold   = nil;
    }

    return self;
}

-(id)initWithTarget:(NSString *)theTarget andInterval:(NSNumber *)theInterval andTimeout:(NSNumber *)theTimeout andUnhealthyThreshold:(NSNumber *)theUnhealthyThreshold andHealthyThreshold:(NSNumber *)theHealthyThreshold
{
    if (self = [self init]) {
        self.target             = theTarget;
        self.interval           = theInterval;
        self.timeout            = theTimeout;
        self.unhealthyThreshold = theUnhealthyThreshold;
        self.healthyThreshold   = theHealthyThreshold;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Target: %@,", target] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Interval: %@,", interval] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Timeout: %@,", timeout] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UnhealthyThreshold: %@,", unhealthyThreshold] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HealthyThreshold: %@,", healthyThreshold] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [target release];
    [interval release];
    [timeout release];
    [unhealthyThreshold release];
    [healthyThreshold release];

    [super dealloc];
}


@end
