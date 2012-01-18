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

#import "DynamoDBScanResponseUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBAttributeValueUnmarshaller.h"
#import "DynamoDBAttributeValueUnmarshaller.h"
#import "DynamoDBKeyUnmarshaller.h"


@implementation DynamoDBScanResponseUnmarshaller


+(DynamoDBScanResponse *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBScanResponse *scanResult = [[[DynamoDBScanResponse alloc] init] autorelease];


    if ([jsonObject valueForKey:@"__type"] != nil) {
        [scanResult setException:[DynamoDBExceptionUnmarshaller unmarshall:jsonObject]];
    }
    else {
        NSArray *itemsArray = [jsonObject valueForKey:@"Items"];
        for (NSDictionary *mapObject in itemsArray) {
            NSMutableDictionary *member = [[[NSMutableDictionary alloc] init] autorelease];
            for (NSString *key in [mapObject allKeys]) {
                NSDictionary *value = [mapObject valueForKey:key];
                [member setValue:[DynamoDBAttributeValueUnmarshaller unmarshall:value] forKey:key];
            }


            [scanResult.items addObject:member];
        }


        if ([jsonObject valueForKey:@"Count"] != nil) {
            scanResult.count = [jsonObject valueForKey:@"Count"];
        }


        if ([jsonObject valueForKey:@"ScannedCount"] != nil) {
            scanResult.scannedCount = [jsonObject valueForKey:@"ScannedCount"];
        }


        if ([jsonObject valueForKey:@"LastEvaluatedKey"] != nil) {
            scanResult.lastEvaluatedKey = [DynamoDBKeyUnmarshaller unmarshall:[jsonObject valueForKey:@"LastEvaluatedKey"]];
        }


        if ([jsonObject valueForKey:@"ConsumedCapacityUnits"] != nil) {
            scanResult.consumedCapacityUnits = [jsonObject valueForKey:@"ConsumedCapacityUnits"];
        }
    }

    return scanResult;
}

@end
