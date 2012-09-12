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


#import "DynamoDBUpdateItemRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBUpdateItemRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBUpdateItemRequest *)updateItemRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[updateItemRequest delegate]];
    [request setCredentials:[updateItemRequest credentials]];
    [request setEndpoint:[updateItemRequest requestEndpoint]];
    [request setRequestTag:[updateItemRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.UpdateItem" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (updateItemRequest.tableName != nil) {
        [json setValue:updateItemRequest.tableName forKey:@"TableName"];
    }
    if (updateItemRequest != nil) {
        DynamoDBKey *key = updateItemRequest.key;
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
    if (updateItemRequest.attributeUpdates != nil) {
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
    if (updateItemRequest.expected != nil) {
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



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

