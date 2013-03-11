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

#import "EC2AccountAttribute.h"


@implementation EC2AccountAttribute

@synthesize attributeName;
@synthesize attributeValues;


-(id)init
{
    if (self = [super init]) {
        attributeName   = nil;
        attributeValues = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addAttributeValue:(EC2AccountAttributeValue *)attributeValueObject
{
    if (attributeValues == nil) {
        attributeValues = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [attributeValues addObject:attributeValueObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeName: %@,", attributeName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeValues: %@,", attributeValues] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [attributeName release];
    [attributeValues release];

    [super dealloc];
}


@end
