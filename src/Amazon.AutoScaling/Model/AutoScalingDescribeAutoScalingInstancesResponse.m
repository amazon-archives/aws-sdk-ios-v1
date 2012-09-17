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

#import "AutoScalingDescribeAutoScalingInstancesResponse.h"


@implementation AutoScalingDescribeAutoScalingInstancesResponse

@synthesize autoScalingInstances;
@synthesize nextToken;


-(id)init
{
    if (self = [super init]) {
        autoScalingInstances = [[NSMutableArray alloc] initWithCapacity:1];
        nextToken            = nil;
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"InvalidNextToken"]) {
        [newException release];
        newException = [[AutoScalingInvalidNextTokenException alloc] initWithMessage:@""];
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



-(AutoScalingAutoScalingInstanceDetails *)autoScalingInstancesObjectAtIndex:(int)index
{
    return (AutoScalingAutoScalingInstanceDetails *)[autoScalingInstances objectAtIndex:index];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingInstances: %@,", autoScalingInstances] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [autoScalingInstances release];
    [nextToken release];

    [super dealloc];
}


@end
