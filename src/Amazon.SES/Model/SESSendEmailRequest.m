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

#import "SESSendEmailRequest.h"


@implementation SESSendEmailRequest

@synthesize source;
@synthesize destination;
@synthesize message;
@synthesize replyToAddresses;
@synthesize returnPath;


-(id)init
{
    if (self = [super init]) {
        source           = nil;
        destination      = nil;
        message          = nil;
        replyToAddresses = [[NSMutableArray alloc] initWithCapacity:1];
        returnPath       = nil;
    }

    return self;
}


-(void)addReplyToAddresse:(NSString *)replyToAddresseObject
{
    if (replyToAddresses == nil) {
        replyToAddresses = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [replyToAddresses addObject:replyToAddresseObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Source: %@,", source] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Destination: %@,", destination] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Message: %@,", message] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReplyToAddresses: %@,", replyToAddresses] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReturnPath: %@,", returnPath] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [source release];
    [destination release];
    [message release];
    [replyToAddresses release];
    [returnPath release];

    [super dealloc];
}


@end
