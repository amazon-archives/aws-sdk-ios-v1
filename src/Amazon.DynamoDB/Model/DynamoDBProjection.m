/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "DynamoDBProjection.h"


@implementation DynamoDBProjection

@synthesize projectionType;
@synthesize nonKeyAttributes;


-(id)init
{
    if (self = [super init]) {
        projectionType   = nil;
        nonKeyAttributes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addNonKeyAttribute:(NSString *)nonKeyAttributeObject
{
    if (nonKeyAttributes == nil) {
        nonKeyAttributes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [nonKeyAttributes addObject:nonKeyAttributeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProjectionType: %@,", projectionType] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"NonKeyAttributes: %@,", nonKeyAttributes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [projectionType release];
    [nonKeyAttributes release];

    [super dealloc];
}


@end
