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

#import "DynamoDBBatchWriteItemResponseUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBBatchWriteResponseUnmarshaller.h"
#import "DynamoDBBatchWriteResponseUnmarshaller.h"
#import "DynamoDBWriteRequestUnmarshaller.h"
#import "DynamoDBPutRequestUnmarshaller.h"
#import "DynamoDBDeleteRequestUnmarshaller.h"


@implementation DynamoDBBatchWriteItemResponseUnmarshaller


+(DynamoDBBatchWriteItemResponse *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBBatchWriteItemResponse *batchWriteItemResult = [[[DynamoDBBatchWriteItemResponse alloc] init] autorelease];


    if ([jsonObject valueForKey:@"__type"] != nil) {
        [batchWriteItemResult setException:[DynamoDBExceptionUnmarshaller unmarshall:jsonObject]];
    }
    else {
        NSDictionary *responsesObject = [jsonObject valueForKey:@"Responses"];
        for (NSString *key in [responsesObject allKeys]) {
            NSDictionary *value = [responsesObject valueForKey:key];
            [batchWriteItemResult.responses setValue:[DynamoDBBatchWriteResponseUnmarshaller unmarshall:value] forKey:key];
        }


        NSDictionary *unprocessedItemsObject = [jsonObject valueForKey:@"UnprocessedItems"];
        for (NSString *key in [unprocessedItemsObject allKeys]) {
            NSMutableArray *arrayObject = [[[NSMutableArray alloc] init] autorelease];
            [batchWriteItemResult.unprocessedItems setValue:arrayObject forKey:key];



            NSArray *valueArray = [unprocessedItemsObject valueForKey:key];
            for (NSDictionary *memberObject in valueArray) {
                [arrayObject addObject:[DynamoDBWriteRequestUnmarshaller unmarshall:memberObject]];
            }
        }
    }

    return batchWriteItemResult;
}

@end
