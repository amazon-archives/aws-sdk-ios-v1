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

#import "EC2Tag.h"


@implementation EC2Tag

@synthesize key;
@synthesize value;


-(id)init
{
    if (self = [super init]) {
        key   = nil;
        value = nil;
    }

    return self;
}

-(id)initWithKey:(NSString *)theKey andValue:(NSString *)theValue
{
    if (self = [self init]) {
        self.key   = theKey;
        self.value = theValue;
    }

    return self;
}

-(id)initWithKey:(NSString *)theKey
{
    if (self = [self init]) {
        self.key = theKey;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Key: %@,", key] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Value: %@,", value] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [key release];
    [value release];

    [super dealloc];
}


@end
