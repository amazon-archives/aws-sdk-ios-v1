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

#import "DynamoDBDeleteItemRequest.h"


@implementation DynamoDBDeleteItemRequest

@synthesize tableName;
@synthesize key;
@synthesize expected;
@synthesize returnValues;


-(id)init
{
    if (self = [super init]) {
        tableName    = nil;
        key          = nil;
        expected     = [[NSMutableDictionary alloc] initWithCapacity:1];
        returnValues = nil;
    }

    return self;
}

-(id)initWithTableName:(NSString *)theTableName andKey:(DynamoDBKey *)theKey
{
    if (self = [self init]) {
        self.tableName = theTableName;
        self.key       = theKey;
    }

    return self;
}


-(void)setExpectedValue:(DynamoDBExpectedAttributeValue *)theValue forKey:(NSString *)theKey
{
    if (expected == nil) {
        expected = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    [expected setValue:theValue forKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableName: %@,", tableName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Key: %@,", key] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Expected: %@,", expected] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ReturnValues: %@,", returnValues] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [tableName release];
    [key release];
    [expected release];
    [returnValues release];

    [super dealloc];
}


@end
