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

#import "DynamoDBTableDescriptionUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"

#import "AmazonSDKUtil.h"
#import "DynamoDBAttributeDefinitionUnmarshaller.h"
#import "DynamoDBKeySchemaElementUnmarshaller.h"
#import "DynamoDBProvisionedThroughputDescriptionUnmarshaller.h"
#import "DynamoDBLocalSecondaryIndexDescriptionUnmarshaller.h"
#import "DynamoDBKeySchemaElementUnmarshaller.h"
#import "DynamoDBProjectionUnmarshaller.h"


@implementation DynamoDBTableDescriptionUnmarshaller


+(DynamoDBTableDescription *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBTableDescription *tableDescription = [[[DynamoDBTableDescription alloc] init] autorelease];



    NSArray *attributeDefinitionsArray = [jsonObject valueForKey:@"AttributeDefinitions"];
    for (NSDictionary *memberObject in attributeDefinitionsArray) {
        [tableDescription.attributeDefinitions addObject:[DynamoDBAttributeDefinitionUnmarshaller unmarshall:memberObject]];
    }


    if ([jsonObject valueForKey:@"TableName"] != nil) {
        tableDescription.tableName = [jsonObject valueForKey:@"TableName"];
    }


    NSArray *keySchemaArray = [jsonObject valueForKey:@"KeySchema"];
    for (NSDictionary *memberObject in keySchemaArray) {
        [tableDescription.keySchema addObject:[DynamoDBKeySchemaElementUnmarshaller unmarshall:memberObject]];
    }


    if ([jsonObject valueForKey:@"TableStatus"] != nil) {
        tableDescription.tableStatus = [jsonObject valueForKey:@"TableStatus"];
    }


    if ([jsonObject valueForKey:@"CreationDateTime"] != nil) {
        tableDescription.creationDateTime = [AmazonSDKUtil secondsSinceEpochToDate:[jsonObject valueForKey:@"CreationDateTime"]];
    }


    if ([jsonObject valueForKey:@"ProvisionedThroughput"] != nil) {
        tableDescription.provisionedThroughput = [DynamoDBProvisionedThroughputDescriptionUnmarshaller unmarshall:[jsonObject valueForKey:@"ProvisionedThroughput"]];
    }


    if ([jsonObject valueForKey:@"TableSizeBytes"] != nil) {
        tableDescription.tableSizeBytes = [jsonObject valueForKey:@"TableSizeBytes"];
    }


    if ([jsonObject valueForKey:@"ItemCount"] != nil) {
        tableDescription.itemCount = [jsonObject valueForKey:@"ItemCount"];
    }


    NSArray *localSecondaryIndexesArray = [jsonObject valueForKey:@"LocalSecondaryIndexes"];
    for (NSDictionary *memberObject in localSecondaryIndexesArray) {
        [tableDescription.localSecondaryIndexes addObject:[DynamoDBLocalSecondaryIndexDescriptionUnmarshaller unmarshall:memberObject]];
    }

    return tableDescription;
}

@end
