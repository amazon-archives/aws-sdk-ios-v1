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

#import "EC2Filter.h"


@implementation EC2Filter

@synthesize name;
@synthesize values;


-(id)init
{
    if (self = [super init]) {
        name   = nil;
        values = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithName:(NSString *)theName andValues:(NSMutableArray *)theValues
{
    if (self = [self init]) {
        self.name   = theName;
        self.values = theValues;
    }

    return self;
}

-(id)initWithName:(NSString *)theName
{
    if (self = [self init]) {
        self.name = theName;
    }

    return self;
}


-(void)addValue:(NSString *)valueObject
{
    if (values == nil) {
        values = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [values addObject:valueObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", name] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Values: %@,", values] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [name release];
    [values release];

    [super dealloc];
}


@end
