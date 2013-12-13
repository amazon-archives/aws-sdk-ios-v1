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

#import "DynamoDBGlobalSecondaryIndexDescriptionUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"

#import "AmazonSDKUtil.h"
#import "DynamoDBKeySchemaElementUnmarshaller.h"
#import "DynamoDBProjectionUnmarshaller.h"
#import "DynamoDBProvisionedThroughputDescriptionUnmarshaller.h"


@implementation DynamoDBGlobalSecondaryIndexDescriptionUnmarshaller


+(DynamoDBGlobalSecondaryIndexDescription *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBGlobalSecondaryIndexDescription *globalSecondaryIndexDescription = [[[DynamoDBGlobalSecondaryIndexDescription alloc] init] autorelease];



    if ([jsonObject valueForKey:@"IndexName"] != nil) {
        globalSecondaryIndexDescription.indexName = [jsonObject valueForKey:@"IndexName"];
    }


    NSArray *keySchemaArray = [jsonObject valueForKey:@"KeySchema"];
    for (NSDictionary *memberObject in keySchemaArray) {
        [globalSecondaryIndexDescription.keySchema addObject:[DynamoDBKeySchemaElementUnmarshaller unmarshall:memberObject]];
    }


    if ([jsonObject valueForKey:@"Projection"] != nil) {
        globalSecondaryIndexDescription.projection = [DynamoDBProjectionUnmarshaller unmarshall:[jsonObject valueForKey:@"Projection"]];
    }


    if ([jsonObject valueForKey:@"IndexStatus"] != nil) {
        globalSecondaryIndexDescription.indexStatus = [jsonObject valueForKey:@"IndexStatus"];
    }


    if ([jsonObject valueForKey:@"ProvisionedThroughput"] != nil) {
        globalSecondaryIndexDescription.provisionedThroughput = [DynamoDBProvisionedThroughputDescriptionUnmarshaller unmarshall:[jsonObject valueForKey:@"ProvisionedThroughput"]];
    }


    if ([jsonObject valueForKey:@"IndexSizeBytes"] != nil) {
        globalSecondaryIndexDescription.indexSizeBytes = [jsonObject valueForKey:@"IndexSizeBytes"];
    }


    if ([jsonObject valueForKey:@"ItemCount"] != nil) {
        globalSecondaryIndexDescription.itemCount = [jsonObject valueForKey:@"ItemCount"];
    }

    return globalSecondaryIndexDescription;
}

@end
