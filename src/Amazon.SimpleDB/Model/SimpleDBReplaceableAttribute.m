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

#import "SimpleDBReplaceableAttribute.h"


@implementation SimpleDBReplaceableAttribute

@synthesize name;
@synthesize value;
@synthesize replace;
@synthesize replaceIsSet;


-(id)init
{
    if (self = [super init]) {
        name         = nil;
        value        = nil;
        replace      = NO;
        replaceIsSet = NO;
    }

    return self;
}

-(id)initWithName:(NSString *)theName andValue:(NSString *)theValue andReplace:(bool)theReplace
{
    if (self = [self init]) {
        self.name    = theName;
        self.value   = theValue;
        self.replace = theReplace;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", name] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Value: %@,", value] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Replace: %d,", replace] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setReplace:(bool)theValue
{
    replace      = theValue;
    replaceIsSet = YES;
}


-(void)dealloc
{
    [name release];
    [value release];

    [super dealloc];
}


@end
