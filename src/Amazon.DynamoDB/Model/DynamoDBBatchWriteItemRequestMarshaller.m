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


#import "DynamoDBBatchWriteItemRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBBatchWriteItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBBatchWriteItemRequest *)batchWriteItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[batchWriteItemRequest delegate]];
    [request setCredentials:[batchWriteItemRequest credentials]];
    [request setEndpoint:[batchWriteItemRequest requestEndpoint]];
    [request setRequestTag:[batchWriteItemRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.BatchWriteItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];
    if (batchWriteItemRequest.requestItems != nil) {
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

                            if (putRequest.item != nil) {
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

                            if (deleteRequest != nil) {
                                DynamoDBKey *key = deleteRequest.key;
                                if (key != nil) {
                                    NSMutableDictionary *keyJson = [[[NSMutableDictionary alloc] init] autorelease];
                                    [deleteRequestJson setValue:keyJson forKey:@"Key"];

                                    if (key != nil) {
                                        DynamoDBAttributeValue *hashKeyElement = key.hashKeyElement;
                                        if (hashKeyElement != nil) {
                                            NSMutableDictionary *hashKeyElementJson = [[[NSMutableDictionary alloc] init] autorelease];
                                            [keyJson setValue:hashKeyElementJson forKey:@"HashKeyElement"];


                                            if (hashKeyElement.s != nil) {
                                                [hashKeyElementJson setValue:hashKeyElement.s forKey:@"S"];
                                            }

                                            if (hashKeyElement.n != nil) {
                                                [hashKeyElementJson setValue:hashKeyElement.n forKey:@"N"];
                                            }

                                            if (hashKeyElement.b != nil) {
                                                [hashKeyElementJson setValue:[hashKeyElement.b base64EncodedString] forKey:@"B"];
                                            }
                                            if (hashKeyElement != nil) {
                                                NSArray *sSList = hashKeyElement.sS;
                                                if (sSList != nil && [sSList count] > 0) {
                                                    NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                                                    [hashKeyElementJson setValue:sSArray forKey:@"SS"];
                                                    for (NSString *sSListValue in sSList) {
                                                        if (sSListValue != nil) {
                                                            [sSArray addObject:sSListValue];
                                                        }
                                                    }
                                                }
                                            }
                                            if (hashKeyElement != nil) {
                                                NSArray *nSList = hashKeyElement.nS;
                                                if (nSList != nil && [nSList count] > 0) {
                                                    NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                                                    [hashKeyElementJson setValue:nSArray forKey:@"NS"];
                                                    for (NSString *nSListValue in nSList) {
                                                        if (nSListValue != nil) {
                                                            [nSArray addObject:nSListValue];
                                                        }
                                                    }
                                                }
                                            }
                                            if (hashKeyElement != nil) {
                                                NSArray *bSList = hashKeyElement.bS;
                                                if (bSList != nil && [bSList count] > 0) {
                                                    NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                                                    [hashKeyElementJson setValue:bSArray forKey:@"BS"];
                                                    for (NSData *bSListValue in bSList) {
                                                        if (bSListValue != nil) {
                                                            [bSArray addObject:[bSListValue base64EncodedString]];
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    if (key != nil) {
                                        DynamoDBAttributeValue *rangeKeyElement = key.rangeKeyElement;
                                        if (rangeKeyElement != nil) {
                                            NSMutableDictionary *rangeKeyElementJson = [[[NSMutableDictionary alloc] init] autorelease];
                                            [keyJson setValue:rangeKeyElementJson forKey:@"RangeKeyElement"];


                                            if (rangeKeyElement.s != nil) {
                                                [rangeKeyElementJson setValue:rangeKeyElement.s forKey:@"S"];
                                            }

                                            if (rangeKeyElement.n != nil) {
                                                [rangeKeyElementJson setValue:rangeKeyElement.n forKey:@"N"];
                                            }

                                            if (rangeKeyElement.b != nil) {
                                                [rangeKeyElementJson setValue:[rangeKeyElement.b base64EncodedString] forKey:@"B"];
                                            }
                                            if (rangeKeyElement != nil) {
                                                NSArray *sSList = rangeKeyElement.sS;
                                                if (sSList != nil && [sSList count] > 0) {
                                                    NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                                                    [rangeKeyElementJson setValue:sSArray forKey:@"SS"];
                                                    for (NSString *sSListValue in sSList) {
                                                        if (sSListValue != nil) {
                                                            [sSArray addObject:sSListValue];
                                                        }
                                                    }
                                                }
                                            }
                                            if (rangeKeyElement != nil) {
                                                NSArray *nSList = rangeKeyElement.nS;
                                                if (nSList != nil && [nSList count] > 0) {
                                                    NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                                                    [rangeKeyElementJson setValue:nSArray forKey:@"NS"];
                                                    for (NSString *nSListValue in nSList) {
                                                        if (nSListValue != nil) {
                                                            [nSArray addObject:nSListValue];
                                                        }
                                                    }
                                                }
                                            }
                                            if (rangeKeyElement != nil) {
                                                NSArray *bSList = rangeKeyElement.bS;
                                                if (bSList != nil && [bSList count] > 0) {
                                                    NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                                                    [rangeKeyElementJson setValue:bSArray forKey:@"BS"];
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
        }
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

