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

#import "DynamoDBLocalSecondaryIndexDescription.h"


@implementation DynamoDBLocalSecondaryIndexDescription

@synthesize indexName;
@synthesize keySchema;
@synthesize projection;
@synthesize indexSizeBytes;
@synthesize itemCount;


-(id)init
{
    if (self = [super init]) {
        indexName      = nil;
        keySchema      = [[NSMutableArray alloc] initWithCapacity:1];
        projection     = nil;
        indexSizeBytes = nil;
        itemCount      = nil;
    }

    return self;
}


-(void)addKeySchema:(DynamoDBKeySchemaElement *)keySchemaObject
{
    if (keySchema == nil) {
        keySchema = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [keySchema addObject:keySchemaObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IndexName: %@,", indexName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KeySchema: %@,", keySchema] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Projection: %@,", projection] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IndexSizeBytes: %@,", indexSizeBytes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ItemCount: %@,", itemCount] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [indexName release];
    [keySchema release];
    [projection release];
    [indexSizeBytes release];
    [itemCount release];

    [super dealloc];
}


@end
