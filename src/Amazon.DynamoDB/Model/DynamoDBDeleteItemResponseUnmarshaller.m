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

#import "DynamoDBDeleteItemResponseUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBAttributeValueUnmarshaller.h"
#import "DynamoDBAttributeValueUnmarshaller.h"


@implementation DynamoDBDeleteItemResponseUnmarshaller


+(DynamoDBDeleteItemResponse *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBDeleteItemResponse *deleteItemResult = [[[DynamoDBDeleteItemResponse alloc] init] autorelease];


    if ([jsonObject valueForKey:@"__type"] != nil) {
        [deleteItemResult setException:[DynamoDBExceptionUnmarshaller unmarshall:jsonObject]];
    }
    else {
        NSDictionary *attributesObject = [jsonObject valueForKey:@"Attributes"];
        for (NSString *key in [attributesObject allKeys]) {
            NSDictionary *value = [attributesObject valueForKey:key];
            [deleteItemResult.attributes setValue:[DynamoDBAttributeValueUnmarshaller unmarshall:value] forKey:key];
        }


        if ([jsonObject valueForKey:@"ConsumedCapacityUnits"] != nil) {
            deleteItemResult.consumedCapacityUnits = [jsonObject valueForKey:@"ConsumedCapacityUnits"];
        }
    }

    return deleteItemResult;
}

@end
