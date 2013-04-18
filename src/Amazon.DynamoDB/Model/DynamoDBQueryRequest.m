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

#import "DynamoDBQueryRequest.h"


@implementation DynamoDBQueryRequest

@synthesize tableName;
@synthesize indexName;
@synthesize select;
@synthesize attributesToGet;
@synthesize limit;
@synthesize consistentRead;
@synthesize consistentReadIsSet;
@synthesize keyConditions;
@synthesize scanIndexForward;
@synthesize scanIndexForwardIsSet;
@synthesize exclusiveStartKey;
@synthesize returnConsumedCapacity;


-(id)init
{
    if (self = [super init]) {
        tableName              = nil;
        indexName              = nil;
        select                 = nil;
        attributesToGet        = [[NSMutableArray alloc] initWithCapacity:1];
        limit                  = nil;
        consistentRead         = NO;
        consistentReadIsSet    = NO;
        keyConditions          = [[NSMutableDictionary alloc] initWithCapacity:1];
        scanIndexForward       = NO;
        scanIndexForwardIsSet  = NO;
        exclusiveStartKey      = [[NSMutableDictionary alloc] initWithCapacity:1];
        returnConsumedCapacity = nil;
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

-(void)setKeyConditionsValue:(DynamoDBCondition *)theValue forKey:(NSString *)theKey
{
    if (keyConditions == nil) {
        keyConditions = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [keyConditions setValue:theValue forKey:theKey];
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
    [buffer appendString:[[[NSString alloc] initWithFormat:@"IndexName: %@,", indexName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Select: %@,", select] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributesToGet: %@,", attributesToGet] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Limit: %@,", limit] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ConsistentRead: %d,", consistentRead] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KeyConditions: %@,", keyConditions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ScanIndexForward: %d,", scanIndexForward] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ExclusiveStartKey: %@,", exclusiveStartKey] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReturnConsumedCapacity: %@,", returnConsumedCapacity] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}


-(void)setConsistentRead:(bool)theValue
{
    consistentRead      = theValue;
    consistentReadIsSet = YES;
}

-(void)setScanIndexForward:(bool)theValue
{
    scanIndexForward      = theValue;
    scanIndexForwardIsSet = YES;
}


-(void)dealloc
{
    [tableName release];
    [indexName release];
    [select release];
    [attributesToGet release];
    [limit release];
    [keyConditions release];
    [exclusiveStartKey release];
    [returnConsumedCapacity release];

    [super dealloc];
}


@end
