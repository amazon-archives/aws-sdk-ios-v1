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

#import "SQSChangeMessageVisibilityBatchRequestEntry.h"


@implementation SQSChangeMessageVisibilityBatchRequestEntry

@synthesize idValue;
@synthesize receiptHandle;
@synthesize visibilityTimeout;


-(id)init
{
    if (self = [super init]) {
        idValue           = nil;
        receiptHandle     = nil;
        visibilityTimeout = nil;
    }

    return self;
}

-(id)initWithIdValue:(NSString *)theIdValue andReceiptHandle:(NSString *)theReceiptHandle
{
    if (self = [self init]) {
        self.idValue       = theIdValue;
        self.receiptHandle = theReceiptHandle;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Id: %@,", idValue] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReceiptHandle: %@,", receiptHandle] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"VisibilityTimeout: %@,", visibilityTimeout] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [idValue release];
    [receiptHandle release];
    [visibilityTimeout release];

    [super dealloc];
}


@end
