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

#import "AutoScalingInstanceMonitoring.h"


@implementation AutoScalingInstanceMonitoring

@synthesize enabled;
@synthesize enabledIsSet;


-(id)init
{
    if (self = [super init]) {
        enabled      = NO;
        enabledIsSet = NO;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Enabled: %d,", enabled] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setEnabled:(bool)theValue
{
    enabled      = theValue;
    enabledIsSet = YES;
}


-(void)dealloc
{
    [super dealloc];
}


@end
