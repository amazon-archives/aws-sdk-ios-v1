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

#import "EC2ConversionTask.h"


@implementation EC2ConversionTask

@synthesize conversionTaskId;
@synthesize expirationTime;
@synthesize importInstance;
@synthesize importVolume;
@synthesize state;
@synthesize statusMessage;
@synthesize tags;


-(id)init
{
    if (self = [super init]) {
        conversionTaskId = nil;
        expirationTime   = nil;
        importInstance   = nil;
        importVolume     = nil;
        state            = nil;
        statusMessage    = nil;
        tags             = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addTag:(EC2Tag *)tagObject
{
    if (tags == nil) {
        tags = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [tags addObject:tagObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ConversionTaskId: %@,", conversionTaskId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ExpirationTime: %@,", expirationTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImportInstance: %@,", importInstance] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ImportVolume: %@,", importVolume] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"State: %@,", state] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"StatusMessage: %@,", statusMessage] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Tags: %@,", tags] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [conversionTaskId release];
    [expirationTime release];
    [importInstance release];
    [importVolume release];
    [state release];
    [statusMessage release];
    [tags release];

    [super dealloc];
}


@end
