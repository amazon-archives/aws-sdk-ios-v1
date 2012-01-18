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

#import "SQSMessage.h"


@implementation SQSMessage

@synthesize messageId;
@synthesize receiptHandle;
@synthesize mD5OfBody;
@synthesize body;
@synthesize attributes;


-(id)init
{
    if (self = [super init]) {
        messageId     = nil;
        receiptHandle = nil;
        mD5OfBody     = nil;
        body          = nil;
        attributes    = [[NSMutableDictionary alloc] initWithCapacity:1];
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MessageId: %@,", messageId] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReceiptHandle: %@,", receiptHandle] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MD5OfBody: %@,", mD5OfBody] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Body: %@,", body] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attributes: %@,", attributes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [messageId release];
    [receiptHandle release];
    [mD5OfBody release];
    [body release];
    [attributes release];

    [super dealloc];
}


@end
