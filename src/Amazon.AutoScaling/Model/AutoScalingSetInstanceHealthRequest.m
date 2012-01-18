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

#import "AutoScalingSetInstanceHealthRequest.h"


@implementation AutoScalingSetInstanceHealthRequest

@synthesize instanceId;
@synthesize healthStatus;
@synthesize shouldRespectGracePeriod;
@synthesize shouldRespectGracePeriodIsSet;


-(id)init
{
    if (self = [super init]) {
        instanceId                    = nil;
        healthStatus                  = nil;
        shouldRespectGracePeriod      = NO;
        shouldRespectGracePeriodIsSet = NO;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceId: %@,", instanceId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"HealthStatus: %@,", healthStatus] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ShouldRespectGracePeriod: %d,", shouldRespectGracePeriod] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setShouldRespectGracePeriod:(bool)theValue
{
    shouldRespectGracePeriod      = theValue;
    shouldRespectGracePeriodIsSet = YES;
}


-(void)dealloc
{
    [instanceId release];
    [healthStatus release];

    [super dealloc];
}


@end
