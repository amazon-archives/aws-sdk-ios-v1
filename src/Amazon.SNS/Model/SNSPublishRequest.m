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

#import "SNSPublishRequest.h"


@implementation SNSPublishRequest

@synthesize topicArn;
@synthesize message;
@synthesize subject;
@synthesize messageStructure;


-(id)init
{
    if (self = [super init]) {
        topicArn         = nil;
        message          = nil;
        subject          = nil;
        messageStructure = nil;
    }

    return self;
}

-(id)initWithTopicArn:(NSString *)theTopicArn andMessage:(NSString *)theMessage
{
    if (self = [self init]) {
        self.topicArn = theTopicArn;
        self.message  = theMessage;
    }

    return self;
}

-(id)initWithTopicArn:(NSString *)theTopicArn andMessage:(NSString *)theMessage andSubject:(NSString *)theSubject
{
    if (self = [self init]) {
        self.topicArn = theTopicArn;
        self.message  = theMessage;
        self.subject  = theSubject;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TopicArn: %@,", topicArn] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Message: %@,", message] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Subject: %@,", subject] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"MessageStructure: %@,", messageStructure] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [topicArn release];
    [message release];
    [subject release];
    [messageStructure release];

    [super dealloc];
}


@end
