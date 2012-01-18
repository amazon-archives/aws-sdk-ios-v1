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

#import "SNSAddPermissionRequest.h"


@implementation SNSAddPermissionRequest

@synthesize topicArn;
@synthesize label;
@synthesize aWSAccountIds;
@synthesize actionNames;


-(id)init
{
    if (self = [super init]) {
        topicArn      = nil;
        label         = nil;
        aWSAccountIds = [[NSMutableArray alloc] initWithCapacity:1];
        actionNames   = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithTopicArn:(NSString *)theTopicArn andLabel:(NSString *)theLabel andAWSAccountIds:(NSMutableArray *)theAWSAccountIds andActionNames:(NSMutableArray *)theActionNames
{
    if (self = [self init]) {
        self.topicArn      = theTopicArn;
        self.label         = theLabel;
        self.aWSAccountIds = theAWSAccountIds;
        self.actionNames   = theActionNames;
    }

    return self;
}


-(void)addAWSAccountId:(NSString *)aWSAccountIdObject
{
    if (aWSAccountIds == nil) {
        aWSAccountIds = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [aWSAccountIds addObject:aWSAccountIdObject];
}

-(void)addActionName:(NSString *)actionNameObject
{
    if (actionNames == nil) {
        actionNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [actionNames addObject:actionNameObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TopicArn: %@,", topicArn] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Label: %@,", label] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AWSAccountIds: %@,", aWSAccountIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ActionNames: %@,", actionNames] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [topicArn release];
    [label release];
    [aWSAccountIds release];
    [actionNames release];

    [super dealloc];
}


@end
