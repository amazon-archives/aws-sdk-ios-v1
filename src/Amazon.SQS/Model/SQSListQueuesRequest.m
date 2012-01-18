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

#import "SQSListQueuesRequest.h"


@implementation SQSListQueuesRequest

@synthesize queueNamePrefix;


-(id)init
{
    if (self = [super init]) {
        queueNamePrefix = nil;
    }

    return self;
}

-(id)initWithQueueNamePrefix:(NSString *)theQueueNamePrefix
{
    if (self = [self init]) {
        self.queueNamePrefix = theQueueNamePrefix;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"QueueNamePrefix: %@,", queueNamePrefix] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [queueNamePrefix release];

    [super dealloc];
}


@end
