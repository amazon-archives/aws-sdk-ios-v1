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

#import "DynamoDBKeySchemaUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBKeySchemaElementUnmarshaller.h"
#import "DynamoDBKeySchemaElementUnmarshaller.h"


@implementation DynamoDBKeySchemaUnmarshaller


+(DynamoDBKeySchema *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBKeySchema *keySchema = [[[DynamoDBKeySchema alloc] init] autorelease];



    if ([jsonObject valueForKey:@"HashKeyElement"] != nil) {
        keySchema.hashKeyElement = [DynamoDBKeySchemaElementUnmarshaller unmarshall:[jsonObject valueForKey:@"HashKeyElement"]];
    }


    if ([jsonObject valueForKey:@"RangeKeyElement"] != nil) {
        keySchema.rangeKeyElement = [DynamoDBKeySchemaElementUnmarshaller unmarshall:[jsonObject valueForKey:@"RangeKeyElement"]];
    }

    return keySchema;
}

@end
