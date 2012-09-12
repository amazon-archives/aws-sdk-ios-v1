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


#import "DynamoDBQueryRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBQueryRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBQueryRequest *)queryRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[queryRequest delegate]];
    [request setCredentials:[queryRequest credentials]];
    [request setEndpoint:[queryRequest requestEndpoint]];
    [request setRequestTag:[queryRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.Query" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (queryRequest.tableName != nil) {
        [json setValue:queryRequest.tableName forKey:@"TableName"];
    }
    if (queryRequest != nil) {
        NSArray *attributesToGetList = queryRequest.attributesToGet;
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

    if (queryRequest.limit != nil) {
        [json setValue:queryRequest.limit forKey:@"Limit"];
    }

    if (queryRequest.consistentReadIsSet) {
        [json setValue:(queryRequest.consistentRead ? @"true":@"false") forKey:@"ConsistentRead"];
    }

    if (queryRequest.countIsSet) {
        [json setValue:(queryRequest.count ? @"true":@"false") forKey:@"Count"];
    }
    if (queryRequest != nil) {
        DynamoDBAttributeValue *hashKeyValue = queryRequest.hashKeyValue;
        if (hashKeyValue != nil) {
            NSMutableDictionary *hashKeyValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [json setValue:hashKeyValueJson forKey:@"HashKeyValue"];


            if (hashKeyValue.s != nil) {
                [hashKeyValueJson setValue:hashKeyValue.s forKey:@"S"];
            }

            if (hashKeyValue.n != nil) {
                [hashKeyValueJson setValue:hashKeyValue.n forKey:@"N"];
            }

            if (hashKeyValue.b != nil) {
                [hashKeyValueJson setValue:[hashKeyValue.b base64EncodedString] forKey:@"B"];
            }
            if (hashKeyValue != nil) {
                NSArray *sSList = hashKeyValue.sS;
                if (sSList != nil && [sSList count] > 0) {
                    NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                    [hashKeyValueJson setValue:sSArray forKey:@"SS"];
                    for (NSString *sSListValue in sSList) {
                        if (sSListValue != nil) {
                            [sSArray addObject:sSListValue];
                        }
                    }
                }
            }
            if (hashKeyValue != nil) {
                NSArray *nSList = hashKeyValue.nS;
                if (nSList != nil && [nSList count] > 0) {
                    NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                    [hashKeyValueJson setValue:nSArray forKey:@"NS"];
                    for (NSString *nSListValue in nSList) {
                        if (nSListValue != nil) {
                            [nSArray addObject:nSListValue];
                        }
                    }
                }
            }
            if (hashKeyValue != nil) {
                NSArray *bSList = hashKeyValue.bS;
                if (bSList != nil && [bSList count] > 0) {
                    NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                    [hashKeyValueJson setValue:bSArray forKey:@"BS"];
                    for (NSData *bSListValue in bSList) {
                        if (bSListValue != nil) {
                            [bSArray addObject:[bSListValue base64EncodedString]];
                        }
                    }
                }
            }
        }
    }
    if (queryRequest != nil) {
        DynamoDBCondition *rangeKeyCondition = queryRequest.rangeKeyCondition;
        if (rangeKeyCondition != nil) {
            NSMutableDictionary *rangeKeyConditionJson = [[[NSMutableDictionary alloc] init] autorelease];
            [json setValue:rangeKeyConditionJson forKey:@"RangeKeyCondition"];



            if (rangeKeyCondition != nil) {
                NSArray *attributeValueListList = rangeKeyCondition.attributeValueList;
                if (attributeValueListList != nil && [attributeValueListList count] > 0) {
                    NSMutableArray *attributeValueListArray = [[[NSMutableArray alloc] init] autorelease];
                    [rangeKeyConditionJson setValue:attributeValueListArray forKey:@"AttributeValueList"];
                    for (DynamoDBAttributeValue *attributeValueListListValue in attributeValueListList) {
                        NSMutableDictionary *attributeValueListArrayObject = [[[NSMutableDictionary alloc] init] autorelease];
                        [attributeValueListArray addObject:attributeValueListArrayObject];

                        if (attributeValueListListValue.s != nil) {
                            [attributeValueListArrayObject setValue:attributeValueListListValue.s forKey:@"S"];
                        }

                        if (attributeValueListListValue.n != nil) {
                            [attributeValueListArrayObject setValue:attributeValueListListValue.n forKey:@"N"];
                        }

                        if (attributeValueListListValue.b != nil) {
                            [attributeValueListArrayObject setValue:[attributeValueListListValue.b base64EncodedString] forKey:@"B"];
                        }
                        if (attributeValueListListValue != nil) {
                            NSArray *sSList = attributeValueListListValue.sS;
                            if (sSList != nil && [sSList count] > 0) {
                                NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                                [attributeValueListArrayObject setValue:sSArray forKey:@"SS"];
                                for (NSString *sSListValue in sSList) {
                                    if (sSListValue != nil) {
                                        [sSArray addObject:sSListValue];
                                    }
                                }
                            }
                        }
                        if (attributeValueListListValue != nil) {
                            NSArray *nSList = attributeValueListListValue.nS;
                            if (nSList != nil && [nSList count] > 0) {
                                NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                                [attributeValueListArrayObject setValue:nSArray forKey:@"NS"];
                                for (NSString *nSListValue in nSList) {
                                    if (nSListValue != nil) {
                                        [nSArray addObject:nSListValue];
                                    }
                                }
                            }
                        }
                        if (attributeValueListListValue != nil) {
                            NSArray *bSList = attributeValueListListValue.bS;
                            if (bSList != nil && [bSList count] > 0) {
                                NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                                [attributeValueListArrayObject setValue:bSArray forKey:@"BS"];
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

            if (rangeKeyCondition.comparisonOperator != nil) {
                [rangeKeyConditionJson setValue:rangeKeyCondition.comparisonOperator forKey:@"ComparisonOperator"];
            }
        }
    }

    if (queryRequest.scanIndexForwardIsSet) {
        [json setValue:(queryRequest.scanIndexForward ? @"true":@"false") forKey:@"ScanIndexForward"];
    }
    if (queryRequest != nil) {
        DynamoDBKey *exclusiveStartKey = queryRequest.exclusiveStartKey;
        if (exclusiveStartKey != nil) {
            NSMutableDictionary *exclusiveStartKeyJson = [[[NSMutableDictionary alloc] init] autorelease];
            [json setValue:exclusiveStartKeyJson forKey:@"ExclusiveStartKey"];

            if (exclusiveStartKey != nil) {
                DynamoDBAttributeValue *hashKeyElement = exclusiveStartKey.hashKeyElement;
                if (hashKeyElement != nil) {
                    NSMutableDictionary *hashKeyElementJson = [[[NSMutableDictionary alloc] init] autorelease];
                    [exclusiveStartKeyJson setValue:hashKeyElementJson forKey:@"HashKeyElement"];


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
            if (exclusiveStartKey != nil) {
                DynamoDBAttributeValue *rangeKeyElement = exclusiveStartKey.rangeKeyElement;
                if (rangeKeyElement != nil) {
                    NSMutableDictionary *rangeKeyElementJson = [[[NSMutableDictionary alloc] init] autorelease];
                    [exclusiveStartKeyJson setValue:rangeKeyElementJson forKey:@"RangeKeyElement"];


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



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

