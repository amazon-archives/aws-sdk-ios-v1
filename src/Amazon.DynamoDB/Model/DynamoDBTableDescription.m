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

#import "DynamoDBTableDescription.h"


@implementation DynamoDBTableDescription

@synthesize attributeDefinitions;
@synthesize tableName;
@synthesize keySchema;
@synthesize tableStatus;
@synthesize creationDateTime;
@synthesize provisionedThroughput;
@synthesize tableSizeBytes;
@synthesize itemCount;
@synthesize localSecondaryIndexes;


-(id)init
{
    if (self = [super init]) {
        attributeDefinitions  = [[NSMutableArray alloc] initWithCapacity:1];
        tableName             = nil;
        keySchema             = [[NSMutableArray alloc] initWithCapacity:1];
        tableStatus           = nil;
        creationDateTime      = nil;
        provisionedThroughput = nil;
        tableSizeBytes        = nil;
        itemCount             = nil;
        localSecondaryIndexes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    return self;
}


-(void)addAttributeDefinition:(DynamoDBAttributeDefinition *)attributeDefinitionObject
{
    if (attributeDefinitions == nil) {
        attributeDefinitions = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [attributeDefinitions addObject:attributeDefinitionObject];
}

-(void)addKeySchema:(DynamoDBKeySchemaElement *)keySchemaObject
{
    if (keySchema == nil) {
        keySchema = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [keySchema addObject:keySchemaObject];
}

-(void)addLocalSecondaryIndexe:(DynamoDBLocalSecondaryIndexDescription *)localSecondaryIndexeObject
{
    if (localSecondaryIndexes == nil) {
        localSecondaryIndexes = [[NSMutableArray alloc] initWithCapacity:1];
    }

    [localSecondaryIndexes addObject:localSecondaryIndexeObject];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"AttributeDefinitions: %@,", attributeDefinitions] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableName: %@,", tableName] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"KeySchema: %@,", keySchema] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableStatus: %@,", tableStatus] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"CreationDateTime: %@,", creationDateTime] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ProvisionedThroughput: %@,", provisionedThroughput] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"TableSizeBytes: %@,", tableSizeBytes] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"ItemCount: %@,", itemCount] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"LocalSecondaryIndexes: %@,", localSecondaryIndexes] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [attributeDefinitions release];
    [tableName release];
    [keySchema release];
    [tableStatus release];
    [creationDateTime release];
    [provisionedThroughput release];
    [tableSizeBytes release];
    [itemCount release];
    [localSecondaryIndexes release];

    [super dealloc];
}


@end
