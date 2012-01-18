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

#import "SNSSubscribeRequest.h"


@implementation SNSSubscribeRequest

@synthesize topicArn;
@synthesize protocol;
@synthesize endpoint;


-(id)init
{
    if (self = [super init]) {
        topicArn = nil;
        protocol = nil;
        endpoint = nil;
    }

    return self;
}

-(id)initWithTopicArn:(NSString *)theTopicArn andProtocol:(NSString *)theProtocol andEndpoint:(NSString *)theEndpoint
{
    if (self = [self init]) {
        self.topicArn = theTopicArn;
        self.protocol = theProtocol;
        self.endpoint = theEndpoint;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TopicArn: %@,", topicArn] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Protocol: %@,", protocol] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Endpoint: %@,", endpoint] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [topicArn release];
    [protocol release];
    [endpoint release];

    [super dealloc];
}


@end
