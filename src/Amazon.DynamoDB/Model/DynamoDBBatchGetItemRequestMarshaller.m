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


#import "DynamoDBBatchGetItemRequestMarshaller.h"
#import "DynamoDBAttributeValue.h"
#import "AmazonJSON.h"
#import "AmazonSDKUtil.h"

@implementation DynamoDBBatchGetItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBBatchGetItemRequest *)batchGetItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[batchGetItemRequest delegate]];
    [request setCredentials:[batchGetItemRequest credentials]];
    [request setEndpoint:[batchGetItemRequest requestEndpoint]];
    [request setRequestTag:[batchGetItemRequest requestTag]];


    [request addValue:@"DynamoDB_20120810.BatchGetItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];
    if (batchGetItemRequest.requestItems != nil && [batchGetItemRequest.requestItems count] > 0) {
        NSMutableDictionary *requestItemsJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:requestItemsJson forKey:@"RequestItems"];
        for (NSString *requestItemsListValue in batchGetItemRequest.requestItems) {
            NSMutableDictionary       *requestItemsListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [requestItemsJson setValue:requestItemsListValueJson forKey:requestItemsListValue];
            DynamoDBKeysAndAttributes *requestItemsListValueValue = [batchGetItemRequest.requestItems valueForKey:requestItemsListValue];


            if (requestItemsListValueValue.keys != nil) {
                NSMutableArray *itemJson = [[[NSMutableArray alloc] init] autorelease];
                [requestItemsListValueJson setValue:itemJson forKey:@"Keys"];
                for (NSMutableDictionary *itemListValue in requestItemsListValueValue.keys) {
                    NSMutableDictionary *keyJson = [NSMutableDictionary dictionary];
                    [itemJson addObject:keyJson];
                    for (NSString *key in [itemListValue allKeys])
                    {
                        NSMutableDictionary    *keysListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
                        [keyJson setValue:keysListValueJson forKey:key];
                        DynamoDBAttributeValue *keysListValueValue = [itemListValue valueForKey:key];

                        if (keysListValueValue.s != nil) {
                            [keysListValueJson setValue:keysListValueValue.s forKey:@"S"];
                        }

                        if (keysListValueValue.n != nil) {
                            [keysListValueJson setValue:keysListValueValue.n forKey:@"N"];
                        }

                        if (keysListValueValue.b != nil) {
                            [keysListValueJson setValue:[keysListValueValue.b base64EncodedString] forKey:@"B"];
                        }
                        if (keysListValueValue != nil) {
                            NSArray *sSList = keysListValueValue.sS;
                            if (sSList != nil && [sSList count] > 0) {
                                NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                                [keysListValueJson setValue:sSArray forKey:@"SS"];
                                for (NSString *sSListValue in sSList) {
                                    if (sSListValue != nil) {
                                        [sSArray addObject:sSListValue];
                                    }
                                }
                            }
                        }
                        if (keysListValueValue != nil) {
                            NSArray *nSList = keysListValueValue.nS;
                            if (nSList != nil && [nSList count] > 0) {
                                NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                                [keysListValueJson setValue:nSArray forKey:@"NS"];
                                for (NSString *nSListValue in nSList) {
                                    if (nSListValue != nil) {
                                        [nSArray addObject:nSListValue];
                                    }
                                }
                            }
                        }
                        if (keysListValueValue != nil) {
                            NSArray *bSList = keysListValueValue.bS;
                            if (bSList != nil && [bSList count] > 0) {
                                NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                                [keysListValueJson setValue:bSArray forKey:@"BS"];
                                for (NSData *bSListValue in bSList) {
                                    if (bSListValue != nil) {
                                        [bSArray addObject:[bSListValue base64EncodedString]];
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (requestItemsListValueValue != nil) {
                NSArray *attributesToGetList = requestItemsListValueValue.attributesToGet;
                if (attributesToGetList != nil && [attributesToGetList count] > 0) {
                    NSMutableArray *attributesToGetArray = [[[NSMutableArray alloc] init] autorelease];
                    [requestItemsListValueJson setValue:attributesToGetArray forKey:@"AttributesToGet"];
                    for (NSString *attributesToGetListValue in attributesToGetList) {
                        if (attributesToGetListValue != nil) {
                            [attributesToGetArray addObject:attributesToGetListValue];
                        }
                    }
                }
            }

            if (requestItemsListValueValue.consistentReadIsSet) {
                [requestItemsListValueJson setValue:(requestItemsListValueValue.consistentRead ? @"true":@"false") forKey:@"ConsistentRead"];
            }
        }
    }

    if (batchGetItemRequest.returnConsumedCapacity != nil) {
        [json setValue:batchGetItemRequest.returnConsumedCapacity forKey:@"ReturnConsumedCapacity"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

