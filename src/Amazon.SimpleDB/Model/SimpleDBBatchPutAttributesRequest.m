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

#import "SimpleDBBatchPutAttributesRequest.h"


@implementation SimpleDBBatchPutAttributesRequest

@synthesize domainName;
@synthesize items;


-(id)init
{
    if (self = [super init]) {
        domainName = nil;
        items      = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}

-(id)initWithDomainName:(NSString *)theDomainName andItems:(NSMutableArray *)theItems
{
    if (self = [self init]) {
        self.domainName = theDomainName;
        self.items      = theItems;
    }

    return self;
}


-(void)addItem:(SimpleDBReplaceableItem *)itemObject
{
    if (items == nil) {
        items = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [items addObject:itemObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"DomainName: %@,", domainName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Items: %@,", items] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [domainName release];
    [items release];

    [super dealloc];
}


@end
