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

#import "DynamoDBAttributeValue.h"


@implementation DynamoDBAttributeValue

@synthesize s;
@synthesize n;
@synthesize sS;
@synthesize nS;


-(id)init
{
    if (self = [super init]) {
        s  = nil;
        n  = nil;
        sS = [[NSMutableArray alloc] initWithCapacity:1];
        nS = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithS:(NSString *)theS
{
    if (self = [self init]) {
        self.s = theS;
    }

    return self;
}

-(id)initWithSS:(NSMutableArray *)theSS
{
    if (self = [self init]) {
        self.sS = theSS;
    }

    return self;
}

-(id)initWithN:(NSString *)theN
{
    if (self = [self init]) {
        self.n = theN;
    }

    return self;
}

-(id)initWithNS:(NSMutableArray *)theNS
{
    if (self = [self init]) {
        self.nS = theNS;
    }

    return self;
}


-(void)addSS:(NSString *)sSObject
{
    if (sS == nil) {
        sS = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [sS addObject:sSObject];
}

-(void)addNS:(NSString *)nSObject
{
    if (nS == nil) {
        nS = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [nS addObject:nSObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"S: %@,", s] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"N: %@,", n] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"SS: %@,", sS] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NS: %@,", nS] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [s release];
    [n release];
    [sS release];
    [nS release];

    [super dealloc];
}


@end
