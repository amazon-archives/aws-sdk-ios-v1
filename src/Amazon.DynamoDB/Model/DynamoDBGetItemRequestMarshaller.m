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


#import "DynamoDBGetItemRequestMarshaller.h"
#import "DynamoDBAttributeValue.h"
#import "AmazonJSON.h"
#import "AmazonSDKUtil.h"

@implementation DynamoDBGetItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBGetItemRequest *)getItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[getItemRequest delegate]];
    [request setCredentials:[getItemRequest credentials]];
    [request setEndpoint:[getItemRequest requestEndpoint]];
    [request setRequestTag:[getItemRequest requestTag]];


    [request addValue:@"DynamoDB_20120810.GetItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (getItemRequest.tableName != nil) {
        [json setValue:getItemRequest.tableName forKey:@"TableName"];
    }
    if (getItemRequest.key != nil && [getItemRequest.key count] > 0) {
        NSMutableDictionary *keyJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:keyJson forKey:@"Key"];
        for (NSString *keyListValue in getItemRequest.key) {
            NSMutableDictionary    *keyListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [keyJson setValue:keyListValueJson forKey:keyListValue];
            DynamoDBAttributeValue *keyListValueValue = [getItemRequest.key valueForKey:keyListValue];

            if (keyListValueValue.s != nil) {
                [keyListValueJson setValue:keyListValueValue.s forKey:@"S"];
            }

            if (keyListValueValue.n != nil) {
                [keyListValueJson setValue:keyListValueValue.n forKey:@"N"];
            }

            if (keyListValueValue.b != nil) {
                [keyListValueJson setValue:[keyListValueValue.b base64EncodedString] forKey:@"B"];
            }
            if (keyListValueValue != nil) {
                NSArray *sSList = keyListValueValue.sS;
                if (sSList != nil && [sSList count] > 0) {
                    NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                    [keyListValueJson setValue:sSArray forKey:@"SS"];
                    for (NSString *sSListValue in sSList) {
                        if (sSListValue != nil) {
                            [sSArray addObject:sSListValue];
                        }
                    }
                }
            }
            if (keyListValueValue != nil) {
                NSArray *nSList = keyListValueValue.nS;
                if (nSList != nil && [nSList count] > 0) {
                    NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                    [keyListValueJson setValue:nSArray forKey:@"NS"];
                    for (NSString *nSListValue in nSList) {
                        if (nSListValue != nil) {
                            [nSArray addObject:nSListValue];
                        }
                    }
                }
            }
            if (keyListValueValue != nil) {
                NSArray *bSList = keyListValueValue.bS;
                if (bSList != nil && [bSList count] > 0) {
                    NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                    [keyListValueJson setValue:bSArray forKey:@"BS"];
                    for (NSData *bSListValue in bSList) {
                        if (bSListValue != nil) {
                            [bSArray addObject:[bSListValue base64EncodedString]];
                        }
                    }
                }
            }
        }
    }
    if (getItemRequest != nil) {
        NSArray *attributesToGetList = getItemRequest.attributesToGet;
        if (attributesToGetList != nil && [attributesToGetList count] > 0) {
            NSMutableArray *attributesToGetArray = [[[NSMutableArray alloc] init] autorelease];
            [json setValue:attributesToGetArray forKey:@"AttributesToGet"];
            for (NSString *attributesToGetListValue in attributesToGetList) {
                if (attributesToGetListValue != nil) {
                    [attributesToGetArray addObject:attributesToGetListValue];
                }
            }
        }
    }

    if (getItemRequest.consistentReadIsSet) {
        [json setValue:(getItemRequest.consistentRead ? @"true":@"false") forKey:@"ConsistentRead"];
    }

    if (getItemRequest.returnConsumedCapacity != nil) {
        [json setValue:getItemRequest.returnConsumedCapacity forKey:@"ReturnConsumedCapacity"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

