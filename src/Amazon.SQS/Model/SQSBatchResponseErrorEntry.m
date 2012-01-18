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

#import "SQSBatchResponseErrorEntry.h"


@implementation SQSBatchResponseErrorEntry

@synthesize idValue;
@synthesize senderFault;
@synthesize senderFaultIsSet;
@synthesize code;
@synthesize message;


-(id)init
{
    if (self = [super init]) {
        idValue          = nil;
        senderFault      = NO;
        senderFaultIsSet = NO;
        code             = nil;
        message          = nil;
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

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



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Id: %@,", idValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SenderFault: %d,", senderFault] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Code: %@,", code] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Message: %@,", message] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setSenderFault:(bool)theValue
{
    senderFault      = theValue;
    senderFaultIsSet = YES;
}


-(void)dealloc
{
    [idValue release];
    [code release];
    [message release];

    [super dealloc];
}


@end
