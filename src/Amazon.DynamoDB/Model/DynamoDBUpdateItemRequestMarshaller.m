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


#import "DynamoDBUpdateItemRequestMarshaller.h"
#import "DynamoDBAttributeValue.h"
#import "AmazonJSON.h"
#import "AmazonSDKUtil.h"

@implementation DynamoDBUpdateItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBUpdateItemRequest *)updateItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[updateItemRequest delegate]];
    [request setCredentials:[updateItemRequest credentials]];
    [request setEndpoint:[updateItemRequest requestEndpoint]];
    [request setRequestTag:[updateItemRequest requestTag]];


    [request addValue:@"DynamoDB_20120810.UpdateItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (updateItemRequest.tableName != nil) {
        [json setValue:updateItemRequest.tableName forKey:@"TableName"];
    }
    if (updateItemRequest.key != nil && [updateItemRequest.key count] > 0) {
        NSMutableDictionary *keyJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:keyJson forKey:@"Key"];
        for (NSString *keyListValue in updateItemRequest.key) {
            NSMutableDictionary    *keyListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [keyJson setValue:keyListValueJson forKey:keyListValue];
            DynamoDBAttributeValue *keyListValueValue = [updateItemRequest.key valueForKey:keyListValue];

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
    if (updateItemRequest.attributeUpdates != nil && [updateItemRequest.attributeUpdates count] > 0) {
        NSMutableDictionary *attributeUpdatesJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:attributeUpdatesJson forKey:@"AttributeUpdates"];
        for (NSString *attributeUpdatesListValue in updateItemRequest.attributeUpdates) {
            NSMutableDictionary          *attributeUpdatesListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [attributeUpdatesJson setValue:attributeUpdatesListValueJson forKey:attributeUpdatesListValue];
            DynamoDBAttributeValueUpdate *attributeUpdatesListValueValue = [updateItemRequest.attributeUpdates valueForKey:attributeUpdatesListValue];
            if (attributeUpdatesListValueValue != nil) {
                DynamoDBAttributeValue *value = attributeUpdatesListValueValue.value;
                if (value != nil) {
                    NSMutableDictionary *valueJson = [[[NSMutableDictionary alloc] init] autorelease];
                    [attributeUpdatesListValueJson setValue:valueJson forKey:@"Value"];


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

            if (attributeUpdatesListValueValue.action != nil) {
                [attributeUpdatesListValueJson setValue:attributeUpdatesListValueValue.action forKey:@"Action"];
            }
        }
    }
    if (updateItemRequest.expected != nil && [updateItemRequest.expected count] > 0) {
        NSMutableDictionary *expectedJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:expectedJson forKey:@"Expected"];
        for (NSString *expectedListValue in updateItemRequest.expected) {
            NSMutableDictionary            *expectedListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [expectedJson setValue:expectedListValueJson forKey:expectedListValue];
            DynamoDBExpectedAttributeValue *expectedListValueValue = [updateItemRequest.expected valueForKey:expectedListValue];
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

    if (updateItemRequest.returnValues != nil) {
        [json setValue:updateItemRequest.returnValues forKey:@"ReturnValues"];
    }

    if (updateItemRequest.returnConsumedCapacity != nil) {
        [json setValue:updateItemRequest.returnConsumedCapacity forKey:@"ReturnConsumedCapacity"];
    }

    if (updateItemRequest.returnItemCollectionMetrics != nil) {
        [json setValue:updateItemRequest.returnItemCollectionMetrics forKey:@"ReturnItemCollectionMetrics"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

