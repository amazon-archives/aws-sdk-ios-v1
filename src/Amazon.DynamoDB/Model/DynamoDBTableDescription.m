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

#import "DynamoDBTableDescription.h"


@implementation DynamoDBTableDescription

@synthesize tableName;
@synthesize keySchema;
@synthesize tableStatus;
@synthesize creationDateTime;
@synthesize provisionedThroughput;
@synthesize tableSizeBytes;
@synthesize itemCount;


-(id)init
{
    if (self = [super init]) {
        tableName             = nil;
        keySchema             = nil;
        tableStatus           = nil;
        creationDateTime      = nil;
        provisionedThroughput = nil;
        tableSizeBytes        = nil;
        itemCount             = nil;
    }

    return self;
}



-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableName: %@,", tableName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KeySchema: %@,", keySchema] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableStatus: %@,", tableStatus] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreationDateTime: %@,", creationDateTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProvisionedThroughput: %@,", provisionedThroughput] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableSizeBytes: %@,", tableSizeBytes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ItemCount: %@,", itemCount] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [tableName release];
    [keySchema release];
    [tableStatus release];
    [creationDateTime release];
    [provisionedThroughput release];
    [tableSizeBytes release];
    [itemCount release];

    [super dealloc];
}


@end
