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

#import "ElasticLoadBalancingListenerDescription.h"


@implementation ElasticLoadBalancingListenerDescription

@synthesize listener;
@synthesize policyNames;


-(id)init
{
    if (self = [super init]) {
        listener    = nil;
        policyNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addPolicyName:(NSString *)policyNameObject
{
    if (policyNames == nil) {
        policyNames = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [policyNames addObject:policyNameObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Listener: %@,", listener] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"PolicyNames: %@,", policyNames] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [listener release];
    [policyNames release];

    [super dealloc];
}


@end
