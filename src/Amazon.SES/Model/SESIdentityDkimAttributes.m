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

#import "SESIdentityDkimAttributes.h"


@implementation SESIdentityDkimAttributes

@synthesize dkimEnabled;
@synthesize dkimEnabledIsSet;
@synthesize dkimVerificationStatus;
@synthesize dkimTokens;


-(id)init
{
    if (self = [super init]) {
        dkimEnabled            = NO;
        dkimEnabledIsSet       = NO;
        dkimVerificationStatus = nil;
        dkimTokens             = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addDkimToken:(NSString *)dkimTokenObject
{
    if (dkimTokens == nil) {
        dkimTokens = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [dkimTokens addObject:dkimTokenObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DkimEnabled: %d,", dkimEnabled] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DkimVerificationStatus: %@,", dkimVerificationStatus] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DkimTokens: %@,", dkimTokens] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setDkimEnabled:(bool)theValue
{
    dkimEnabled      = theValue;
    dkimEnabledIsSet = YES;
}


-(void)dealloc
{
    [dkimVerificationStatus release];
    [dkimTokens release];

    [super dealloc];
}


@end
