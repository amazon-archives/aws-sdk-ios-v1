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

#import "SQSSetQueueAttributesRequest.h"


@implementation SQSSetQueueAttributesRequest

@synthesize queueUrl;
@synthesize attributes;


-(id)init
{
    if (self = [super init]) {
        queueUrl   = nil;
        attributes = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithQueueUrl:(NSString *)theQueueUrl andAttributes:(NSMutableDictionary *)theAttributes
{
    if (self = [self init]) {
        self.queueUrl   = theQueueUrl;
        self.attributes = theAttributes;
    }

    return self;
}


-(void)setAttributesValue:(NSString *)theValue forKey:(NSString *)theKey
{
    if (attributes == nil) {
        attributes = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [attributes setValue:theValue forKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"QueueUrl: %@,", queueUrl] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attributes: %@,", attributes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [queueUrl release];
    [attributes release];

    [super dealloc];
}


@end
