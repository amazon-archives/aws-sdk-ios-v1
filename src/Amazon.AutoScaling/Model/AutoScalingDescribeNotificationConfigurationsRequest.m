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

#import "AutoScalingDescribeNotificationConfigurationsRequest.h"


@implementation AutoScalingDescribeNotificationConfigurationsRequest

@synthesize autoScalingGroupNames;
@synthesize nextToken;
@synthesize maxRecords;


-(id)init
{
    if (self = [super init]) {
        autoScalingGroupNames = [[NSMutableArray alloc] initWithCapacity:1];
        nextToken             = nil;
        maxRecords            = nil;
    }

    return self;
}


-(void)addAutoScalingGroupName:(NSString *)autoScalingGroupNameObject
{
    if (autoScalingGroupNames == nil) {
        autoScalingGroupNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [autoScalingGroupNames addObject:autoScalingGroupNameObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AutoScalingGroupNames: %@,", autoScalingGroupNames] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NextToken: %@,", nextToken] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MaxRecords: %@,", maxRecords] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [autoScalingGroupNames release];
    [nextToken release];
    [maxRecords release];

    [super dealloc];
}


@end
