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


#import "DynamoDBPutItemRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBPutItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBPutItemRequest *)putItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[putItemRequest delegate]];
    [request setCredentials:[putItemRequest credentials]];
    [request setEndpoint:[putItemRequest requestEndpoint]];
    [request setRequestTag:[putItemRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.PutItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (putItemRequest.tableName != nil) {
        [json setValue:putItemRequest.tableName forKey:@"TableName"];
    }
    if (putItemRequest.item != nil) {
        NSMutableDictionary *itemJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:itemJson forKey:@"Item"];
        for (NSString *itemListValue in putItemRequest.item) {
            NSMutableDictionary    *itemListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [itemJson setValue:itemListValueJson forKey:itemListValue];
            DynamoDBAttributeValue *itemListValueValue = [putItemRequest.item valueForKey:itemListValue];

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
    if (putItemRequest.expected != nil) {
        NSMutableDictionary *expectedJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:expectedJson forKey:@"Expected"];
        for (NSString *expectedListValue in putItemRequest.expected) {
            NSMutableDictionary            *expectedListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [expectedJson setValue:expectedListValueJson forKey:expectedListValue];
            DynamoDBExpectedAttributeValue *expectedListValueValue = [putItemRequest.expected valueForKey:expectedListValue];
            if (expectedListValueValue != nil) {
                DynamoDBAttributeValue *value = expectedListValueValue.value;
                if (value != nil) {
                    NSMutableDictionary *valueJson = [[[NSMutableDictionary alloc] init] autorelease];
                    [expectedListValueJson setValue:valueJson forKey:@"Value"];


                    if (value.s != nil) {
                        [valueJson setValue:value.s forKey:@"S"];
                    }

                    if (value.n != nil) {
                        [valueJson setValue:value.n forKey:@"N"];
                    }

                    if (value.b != nil) {
                        [valueJson setValue:[value.b base64EncodedString] forKey:@"B"];
                    }
                    if (value != nil) {
                        NSArray *sSList = value.sS;
                        if (sSList != nil && [sSList count] > 0) {
                            NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                            [valueJson setValue:sSArray forKey:@"SS"];
                            for (NSString *sSListValue in sSList) {
                                if (sSListValue != nil) {
                                    [sSArray addObject:sSListValue];
                                }
                            }
                        }
                    }
                    if (value != nil) {
                        NSArray *nSList = value.nS;
                        if (nSList != nil && [nSList count] > 0) {
                            NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                            [valueJson setValue:nSArray forKey:@"NS"];
                            for (NSString *nSListValue in nSList) {
                                if (nSListValue != nil) {
                                    [nSArray addObject:nSListValue];
                                }
                            }
                        }
                    }
                    if (value != nil) {
                        NSArray *bSList = value.bS;
                        if (bSList != nil && [bSList count] > 0) {
                            NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                            [valueJson setValue:bSArray forKey:@"BS"];
                            for (NSData *bSListValue in bSList) {
                                if (bSListValue != nil) {
                                    [bSArray addObject:[bSListValue base64EncodedString]];
                                }
                            }
                        }
                    }
                }
            }

            if (expectedListValueValue.existsIsSet) {
                [expectedListValueJson setValue:(expectedListValueValue.exists ? @"true":@"false") forKey:@"Exists"];
            }
        }
    }

    if (putItemRequest.returnValues != nil) {
        [json setValue:putItemRequest.returnValues forKey:@"ReturnValues"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

