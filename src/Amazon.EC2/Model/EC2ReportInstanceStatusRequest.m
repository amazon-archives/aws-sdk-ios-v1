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

#import "EC2ReportInstanceStatusRequest.h"


@implementation EC2ReportInstanceStatusRequest

@synthesize instances;
@synthesize status;
@synthesize startTime;
@synthesize endTime;
@synthesize reasonCodes;
@synthesize descriptionValue;


-(id)init
{
    if (self = [super init]) {
        instances        = [[NSMutableArray alloc] initWithCapacity:1];
        status           = nil;
        startTime        = nil;
        endTime          = nil;
        reasonCodes      = [[NSMutableArray alloc] initWithCapacity:1];
        descriptionValue = nil;
    }

    return self;
}


-(void)addInstance:(NSString *)instanceObject
{
    if (instances == nil) {
        instances = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [instances addObject:instanceObject];
}

-(void)addReasonCode:(NSString *)reasonCodeObject
{
    if (reasonCodes == nil) {
        reasonCodes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [reasonCodes addObject:reasonCodeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Instances: %@,", instances] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Status: %@,", status] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StartTime: %@,", startTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"EndTime: %@,", endTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReasonCodes: %@,", reasonCodes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Description: %@,", descriptionValue] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [instances release];
    [status release];
    [startTime release];
    [endTime release];
    [reasonCodes release];
    [descriptionValue release];

    [super dealloc];
}


@end
