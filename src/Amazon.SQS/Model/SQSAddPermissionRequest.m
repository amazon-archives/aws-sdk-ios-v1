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

#import "SQSAddPermissionRequest.h"


@implementation SQSAddPermissionRequest

@synthesize queueUrl;
@synthesize label;
@synthesize aWSAccountIds;
@synthesize actions;


-(id)init
{
    if (self = [super init]) {
        queueUrl      = nil;
        label         = nil;
        aWSAccountIds = [[NSMutableArray alloc] initWithCapacity:1];
        actions       = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithQueueUrl:(NSString *)theQueueUrl andLabel:(NSString *)theLabel andAWSAccountIds:(NSMutableArray *)theAWSAccountIds andActions:(NSMutableArray *)theActions
{
    if (self = [self init]) {
        self.queueUrl      = theQueueUrl;
        self.label         = theLabel;
        self.aWSAccountIds = theAWSAccountIds;
        self.actions       = theActions;
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

-(void)addAction:(NSString *)actionObject
{
    if (actions == nil) {
        actions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [actions addObject:actionObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"QueueUrl: %@,", queueUrl] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Label: %@,", label] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AWSAccountIds: %@,", aWSAccountIds] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Actions: %@,", actions] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [queueUrl release];
    [label release];
    [aWSAccountIds release];
    [actions release];

    [super dealloc];
}


@end
