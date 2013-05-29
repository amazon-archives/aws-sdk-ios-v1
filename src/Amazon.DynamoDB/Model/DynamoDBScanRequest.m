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

#import "DynamoDBScanRequest.h"


@implementation DynamoDBScanRequest

@synthesize tableName;
@synthesize attributesToGet;
@synthesize limit;
@synthesize select;
@synthesize scanFilter;
@synthesize exclusiveStartKey;
@synthesize returnConsumedCapacity;
@synthesize totalSegments;
@synthesize segment;


-(id)init
{
    if (self = [super init]) {
        tableName              = nil;
        attributesToGet        = [[NSMutableArray alloc] initWithCapacity:1];
        limit                  = nil;
        select                 = nil;
        scanFilter             = [[NSMutableDictionary alloc] initWithCapacity:1];
        exclusiveStartKey      = [[NSMutableDictionary alloc] initWithCapacity:1];
        returnConsumedCapacity = nil;
        totalSegments          = nil;
        segment                = nil;
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

-(void)setExclusiveStartKeyValue:(DynamoDBAttributeValue *)theValue forKey:(NSString *)theKey
{
    if (exclusiveStartKey == nil) {
        exclusiveStartKey = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [exclusiveStartKey setValue:theValue forKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableName: %@,", tableName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributesToGet: %@,", attributesToGet] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Limit: %@,", limit] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Select: %@,", select] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ScanFilter: %@,", scanFilter] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ExclusiveStartKey: %@,", exclusiveStartKey] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReturnConsumedCapacity: %@,", returnConsumedCapacity] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TotalSegments: %@,", totalSegments] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Segment: %@,", segment] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [tableName release];
    [attributesToGet release];
    [limit release];
    [select release];
    [scanFilter release];
    [exclusiveStartKey release];
    [returnConsumedCapacity release];
    [totalSegments release];
    [segment release];

    [super dealloc];
}


@end
