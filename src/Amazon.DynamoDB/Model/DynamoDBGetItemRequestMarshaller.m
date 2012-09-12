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


#import "DynamoDBGetItemRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBGetItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBGetItemRequest *)getItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[getItemRequest delegate]];
    [request setCredentials:[getItemRequest credentials]];
    [request setEndpoint:[getItemRequest requestEndpoint]];
    [request setRequestTag:[getItemRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.GetItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (getItemRequest.tableName != nil) {
        [json setValue:getItemRequest.tableName forKey:@"TableName"];
    }
    if (getItemRequest != nil) {
        DynamoDBKey *key = getItemRequest.key;
        if (key != nil) {
            NSMutableDictionary *keyJson = [[[NSMutableDictionary alloc] init] autorelease];
            [json setValue:keyJson forKey:@"Key"];

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



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

