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

#import "ElasticLoadBalancingDescribeInstanceHealthResponse.h"


@implementation ElasticLoadBalancingDescribeInstanceHealthResponse

@synthesize instanceStates;


-(id)init
{
    if (self = [super init]) {
        instanceStates = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"InvalidInstance"]) {
        [newException release];
        newException = [[ElasticLoadBalancingInvalidInstanceException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"LoadBalancerNotFound"]) {
        [newException release];
        newException = [[ElasticLoadBalancingLoadBalancerNotFoundException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        [exception release];
        exception = newException;
    }
    else {
        [exception release];
        exception = [theException retain];
    }
}



-(ElasticLoadBalancingInstanceState *)instanceStatesObjectAtIndex:(int)index
{
    return (ElasticLoadBalancingInstanceState *)[instanceStates objectAtIndex:index];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"InstanceStates: %@,", instanceStates] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [instanceStates release];

    [super dealloc];
}


@end
