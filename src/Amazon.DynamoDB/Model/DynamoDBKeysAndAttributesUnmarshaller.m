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

#import "DynamoDBKeysAndAttributesUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBKeyUnmarshaller.h"
#import "DynamoDBAttributeValueUnmarshaller.h"
#import "DynamoDBAttributeValueUnmarshaller.h"


@implementation DynamoDBKeysAndAttributesUnmarshaller


+(DynamoDBKeysAndAttributes *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBKeysAndAttributes *keysAndAttributes = [[[DynamoDBKeysAndAttributes alloc] init] autorelease];



    NSArray *keysArray = [jsonObject valueForKey:@"Keys"];
    for (NSDictionary *memberObject in keysArray) {
        [keysAndAttributes.keys addObject:[DynamoDBKeyUnmarshaller unmarshall:memberObject]];
    }


    NSArray *attributesToGetArray = [jsonObject valueForKey:@"AttributesToGet"];
    for (NSString *memberObject in attributesToGetArray) {
        [keysAndAttributes.attributesToGet addObject:memberObject];
    }

    return keysAndAttributes;
}

@end
