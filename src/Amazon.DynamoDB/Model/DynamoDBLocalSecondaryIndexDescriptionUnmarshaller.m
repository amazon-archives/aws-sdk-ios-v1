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

#import "DynamoDBLocalSecondaryIndexDescriptionUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"

#import "AmazonSDKUtil.h"
#import "DynamoDBKeySchemaElementUnmarshaller.h"
#import "DynamoDBProjectionUnmarshaller.h"


@implementation DynamoDBLocalSecondaryIndexDescriptionUnmarshaller


+(DynamoDBLocalSecondaryIndexDescription *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBLocalSecondaryIndexDescription *localSecondaryIndexDescription = [[[DynamoDBLocalSecondaryIndexDescription alloc] init] autorelease];



    if ([jsonObject valueForKey:@"IndexName"] != nil) {
        localSecondaryIndexDescription.indexName = [jsonObject valueForKey:@"IndexName"];
    }


    NSArray *keySchemaArray = [jsonObject valueForKey:@"KeySchema"];
    for (NSDictionary *memberObject in keySchemaArray) {
        [localSecondaryIndexDescription.keySchema addObject:[DynamoDBKeySchemaElementUnmarshaller unmarshall:memberObject]];
    }


    if ([jsonObject valueForKey:@"Projection"] != nil) {
        localSecondaryIndexDescription.projection = [DynamoDBProjectionUnmarshaller unmarshall:[jsonObject valueForKey:@"Projection"]];
    }


    if ([jsonObject valueForKey:@"IndexSizeBytes"] != nil) {
        localSecondaryIndexDescription.indexSizeBytes = [jsonObject valueForKey:@"IndexSizeBytes"];
    }


    if ([jsonObject valueForKey:@"ItemCount"] != nil) {
        localSecondaryIndexDescription.itemCount = [jsonObject valueForKey:@"ItemCount"];
    }

    return localSecondaryIndexDescription;
}

@end
