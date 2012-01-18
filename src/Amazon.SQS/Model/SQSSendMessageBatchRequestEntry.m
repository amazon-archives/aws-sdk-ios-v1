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

#import "SQSSendMessageBatchRequestEntry.h"


@implementation SQSSendMessageBatchRequestEntry

@synthesize idValue;
@synthesize messageBody;
@synthesize delaySeconds;


-(id)init
{
    if (self = [super init]) {
        idValue      = nil;
        messageBody  = nil;
        delaySeconds = nil;
    }

    return self;
}

-(id)initWithIdValue:(NSString *)theIdValue andMessageBody:(NSString *)theMessageBody
{
    if (self = [self init]) {
        self.idValue     = theIdValue;
        self.messageBody = theMessageBody;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Id: %@,", idValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MessageBody: %@,", messageBody] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DelaySeconds: %@,", delaySeconds] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [idValue release];
    [messageBody release];
    [delaySeconds release];

    [super dealloc];
}


@end
