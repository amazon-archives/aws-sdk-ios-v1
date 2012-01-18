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

#import "SimpleDBDeletableItem.h"


@implementation SimpleDBDeletableItem

@synthesize name;
@synthesize attributes;


-(id)init
{
    if (self = [super init]) {
        name       = nil;
        attributes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithName:(NSString *)theName andAttributes:(NSMutableArray *)theAttributes
{
    if (self = [self init]) {
        self.name       = theName;
        self.attributes = theAttributes;
    }

    return self;
}


-(void)addAttribute:(SimpleDBAttribute *)attributeObject
{
    if (attributes == nil) {
        attributes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [attributes addObject:attributeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Name: %@,", name] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Attributes: %@,", attributes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [name release];
    [attributes release];

    [super dealloc];
}


@end
