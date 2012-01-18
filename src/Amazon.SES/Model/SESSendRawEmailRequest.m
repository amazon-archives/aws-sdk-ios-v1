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

#import "SESSendRawEmailRequest.h"


@implementation SESSendRawEmailRequest

@synthesize source;
@synthesize destinations;
@synthesize rawMessage;


-(id)init
{
    if (self = [super init]) {
        source       = nil;
        destinations = [[NSMutableArray alloc] initWithCapacity:1];
        rawMessage   = nil;
    }

    return self;
}


-(void)addDestination:(NSString *)destinationObject
{
    if (destinations == nil) {
        destinations = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [destinations addObject:destinationObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Source: %@,", source] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Destinations: %@,", destinations] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"RawMessage: %@,", rawMessage] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [source release];
    [destinations release];
    [rawMessage release];

    [super dealloc];
}


@end
