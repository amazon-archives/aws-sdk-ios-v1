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


#import "DynamoDBBatchWriteItemRequestMarshaller.h"
#import "DynamoDBAttributeValue.h"
#import "AmazonJSON.h"
#import "AmazonSDKUtil.h"

@implementation DynamoDBBatchWriteItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBBatchWriteItemRequest *)batchWriteItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[batchWriteItemRequest delegate]];
    [request setCredentials:[batchWriteItemRequest credentials]];
    [request setEndpoint:[batchWriteItemRequest requestEndpoint]];
    [request setRequestTag:[batchWriteItemRequest requestTag]];


    [request addValue:@"DynamoDB_20120810.BatchWriteItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];
    if (batchWriteItemRequest.requestItems != nil && [batchWriteItemRequest.requestItems count] > 0) {
        NSMutableDictionary *requestItemsJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:requestItemsJson forKey:@"RequestItems"];
        for (NSString *requestItemsListValue in batchWriteItemRequest.requestItems) {
            NSArray        *requestItemsListValueValue = [batchWriteItemRequest.requestItems valueForKey:requestItemsListValue];
            NSMutableArray *requestItemsListValueJson  = [[[NSMutableArray alloc] init] autorelease];
            [requestItemsJson setValue:requestItemsListValueJson forKey:requestItemsListValue];

            if (requestItemsListValueValue != nil && [requestItemsListValueValue count] > 0) {
                for (DynamoDBWriteRequest *valueValue in requestItemsListValueValue) {
                    NSMutableDictionary *valueArrayObject = [[[NSMutableDictionary alloc] init] autorelease];
                    [requestItemsListValueJson addObject:valueArrayObject];
                    if (valueValue != nil) {
                        DynamoDBPutRequest *putRequest = valueValue.putRequest;
                        if (putRequest != nil) {
                            NSMutableDictionary *putRequestJson = [[[NSMutableDictionary alloc] init] autorelease];
                            [valueArrayObject setValue:putRequestJson forKey:@"PutRequest"];

                            if (putRequest.item != nil && [putRequest.item count] > 0) {
                                NSMutableDictionary *itemJson = [[[NSMutableDictionary alloc] init] autorelease];
                                [putRequestJson setValue:itemJson forKey:@"Item"];
                                for (NSString *itemListValue in putRequest.item) {
                                    NSMutableDictionary    *itemListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
                                    [itemJson setValue:itemListValueJson forKey:itemListValue];
                                    DynamoDBAttributeValue *itemListValueValue = [putRequest.item valueForKey:itemListValue];

                                    if (itemListValueValue.s != nil) {
                                        [itemListValueJson setValue:itemListValueValue.s forKey:@"S"];
                                    }

                                    if (itemListValueValue.n != nil) {
                                        [itemListValueJson setValue:itemListValueValue.n forKey:@"N"];
                                    }

                                    if (itemListValueValue.b != nil) {
                                        [itemListValueJson setValue:[itemListValueValue.b base64EncodedString] forKey:@"B"];
                                    }
                                    if (itemListValueValue != nil) {
                                        NSArray *sSList = itemListValueValue.sS;
                                        if (sSList != nil && [sSList count] > 0) {
                                            NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                                            [itemListValueJson setValue:sSArray forKey:@"SS"];
                                            for (NSString *sSListValue in sSList) {
                                                if (sSListValue != nil) {
                                                    [sSArray addObject:sSListValue];
                                                }
                                            }
                                        }
                                    }
                                    if (itemListValueValue != nil) {
                                        NSArray *nSList = itemListValueValue.nS;
                                        if (nSList != nil && [nSList count] > 0) {
                                            NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                                            [itemListValueJson setValue:nSArray forKey:@"NS"];
                                            for (NSString *nSListValue in nSList) {
                                                if (nSListValue != nil) {
                                                    [nSArray addObject:nSListValue];
                                                }
                                            }
                                        }
                                    }
                                    if (itemListValueValue != nil) {
                                        NSArray *bSList = itemListValueValue.bS;
                                        if (bSList != nil && [bSList count] > 0) {
                                            NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                                            [itemListValueJson setValue:bSArray forKey:@"BS"];
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
                    }
                    if (valueValue != nil) {
                        DynamoDBDeleteRequest *deleteRequest = valueValue.deleteRequest;
                        if (deleteRequest != nil) {
                            NSMutableDictionary *deleteRequestJson = [[[NSMutableDictionary alloc] init] autorelease];
                            [valueArrayObject setValue:deleteRequestJson forKey:@"DeleteRequest"];

                            if (deleteRequest.key != nil && [deleteRequest.key count] > 0) {
                                NSMutableDictionary *keyJson = [[[NSMutableDictionary alloc] init] autorelease];
                                [deleteRequestJson setValue:keyJson forKey:@"Key"];
                                for (NSString *keyListValue in deleteRequest.key) {
                                    NSMutableDictionary    *keyListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
                                    [keyJson setValue:keyListValueJson forKey:keyListValue];
                                    DynamoDBAttributeValue *keyListValueValue = [deleteRequest.key valueForKey:keyListValue];

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
                        }
                    }
                }
            }
        }
    }

    if (batchWriteItemRequest.returnConsumedCapacity != nil) {
        [json setValue:batchWriteItemRequest.returnConsumedCapacity forKey:@"ReturnConsumedCapacity"];
    }

    if (batchWriteItemRequest.returnItemCollectionMetrics != nil) {
        [json setValue:batchWriteItemRequest.returnItemCollectionMetrics forKey:@"ReturnItemCollectionMetrics"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

