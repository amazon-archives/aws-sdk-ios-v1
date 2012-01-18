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

#import "DynamoDBScanRequest.h"


@implementation DynamoDBScanRequest

@synthesize tableName;
@synthesize attributesToGet;
@synthesize limit;
@synthesize count;
@synthesize countIsSet;
@synthesize scanFilter;
@synthesize exclusiveStartKey;


-(id)init
{
    if (self = [super init]) {
        tableName         = nil;
        attributesToGet   = [[NSMutableArray alloc] initWithCapacity:1];
        limit             = nil;
        count             = NO;
        countIsSet        = NO;
        scanFilter        = [[NSMutableDictionary alloc] initWithCapacity:1];
        exclusiveStartKey = nil;
    }

    return self;
}

-(id)initWithTableName:(NSString *)theTableName
{
    if (self = [self init]) {
        self.tableName = theTableName;
    }

    return self;
}


-(void)addAttributesToGet:(NSString *)attributesToGetObject
{
    if (attributesToGet == nil) {
        attributesToGet = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [attributesToGet addObject:attributesToGetObject];
}

-(void)setScanFilterValue:(DynamoDBCondition *)theValue forKey:(NSString *)theKey
{
    if (scanFilter == nil) {
        scanFilter = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [scanFilter setValue:theValue forKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableName: %@,", tableName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributesToGet: %@,", attributesToGet] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Limit: %@,", limit] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Count: %d,", count] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ScanFilter: %@,", scanFilter] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ExclusiveStartKey: %@,", exclusiveStartKey] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setCount:(bool)theValue
{
    count      = theValue;
    countIsSet = YES;
}


-(void)dealloc
{
    [tableName release];
    [attributesToGet release];
    [limit release];
    [scanFilter release];
    [exclusiveStartKey release];

    [super dealloc];
}


@end
