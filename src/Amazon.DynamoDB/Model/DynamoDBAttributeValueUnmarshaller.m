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

#import "DynamoDBAttributeValueUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"


@implementation DynamoDBAttributeValueUnmarshaller


+(DynamoDBAttributeValue *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBAttributeValue *attributeValue = [[[DynamoDBAttributeValue alloc] init] autorelease];



    if ([jsonObject valueForKey:@"S"] != nil) {
        attributeValue.s = [jsonObject valueForKey:@"S"];
    }


    if ([jsonObject valueForKey:@"N"] != nil) {
        attributeValue.n = [jsonObject valueForKey:@"N"];
    }


    if ([jsonObject valueForKey:@"B"] != nil) {
        attributeValue.b = [NSData dataWithBase64EncodedString:[jsonObject valueForKey:@"B"]];
    }


    NSArray *sSArray = [jsonObject valueForKey:@"SS"];
    for (NSString *memberObject in sSArray) {
        [attributeValue.sS addObject:memberObject];
    }


    NSArray *nSArray = [jsonObject valueForKey:@"NS"];
    for (NSString *memberObject in nSArray) {
        [attributeValue.nS addObject:memberObject];
    }


    NSArray *bSArray = [jsonObject valueForKey:@"BS"];
    for (NSString *memberObject in bSArray) {
        [attributeValue.bS addObject:[NSData dataWithBase64EncodedString:memberObject]];
    }

    return attributeValue;
}

@end
