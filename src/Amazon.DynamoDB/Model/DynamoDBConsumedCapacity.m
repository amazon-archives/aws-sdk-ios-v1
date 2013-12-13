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

#import "DynamoDBConsumedCapacity.h"


@implementation DynamoDBConsumedCapacity

@synthesize tableName;
@synthesize capacityUnits;
@synthesize table;
@synthesize localSecondaryIndexes;
@synthesize globalSecondaryIndexes;


-(id)init
{
    if (self = [super init]) {
        tableName              = nil;
        capacityUnits          = nil;
        table                  = nil;
        localSecondaryIndexes  = [[NSMutableDictionary alloc] initWithCapacity:1];
        globalSecondaryIndexes = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    return self;
}


-(void)setLocalSecondaryIndexesValue:(DynamoDBCapacity *)theValue forKey:(NSString *)theKey
{
    if (localSecondaryIndexes == nil) {
        localSecondaryIndexes = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [localSecondaryIndexes setValue:theValue forKey:theKey];
}

-(void)setGlobalSecondaryIndexesValue:(DynamoDBCapacity *)theValue forKey:(NSString *)theKey
{
    if (globalSecondaryIndexes == nil) {
        globalSecondaryIndexes = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [globalSecondaryIndexes setValue:theValue forKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableName: %@,", tableName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CapacityUnits: %@,", capacityUnits] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Table: %@,", table] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LocalSecondaryIndexes: %@,", localSecondaryIndexes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"GlobalSecondaryIndexes: %@,", globalSecondaryIndexes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [tableName release];
    [capacityUnits release];
    [table release];
    [localSecondaryIndexes release];
    [globalSecondaryIndexes release];

    [super dealloc];
}


@end
