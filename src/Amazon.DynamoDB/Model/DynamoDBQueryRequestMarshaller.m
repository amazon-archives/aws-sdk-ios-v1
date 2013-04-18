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


#import "DynamoDBQueryRequestMarshaller.h"
#import "DynamoDBAttributeValue.h"
#import "AmazonJSON.h"
#import "AmazonSDKUtil.h"

@implementation DynamoDBQueryRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBQueryRequest *)queryRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[queryRequest delegate]];
    [request setCredentials:[queryRequest credentials]];
    [request setEndpoint:[queryRequest requestEndpoint]];
    [request setRequestTag:[queryRequest requestTag]];


    [request addValue:@"DynamoDB_20120810.Query" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (queryRequest.tableName != nil) {
        [json setValue:queryRequest.tableName forKey:@"TableName"];
    }

    if (queryRequest.indexName != nil) {
        [json setValue:queryRequest.indexName forKey:@"IndexName"];
    }

    if (queryRequest.select != nil) {
        [json setValue:queryRequest.select forKey:@"Select"];
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
    if (queryRequest.keyConditions != nil && [queryRequest.keyConditions count] > 0) {
        NSMutableDictionary *keyConditionsJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:keyConditionsJson forKey:@"KeyConditions"];
        for (NSString *keyConditionsListValue in queryRequest.keyConditions) {
            NSMutableDictionary *keyConditionsListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [keyConditionsJson setValue:keyConditionsListValueJson forKey:keyConditionsListValue];
            DynamoDBCondition   *keyConditionsListValueValue = [queryRequest.keyConditions valueForKey:keyConditionsListValue];


            if (keyConditionsListValueValue.attributeValueList != nil) {
                NSArray *attributeValueListList = keyConditionsListValueValue.attributeValueList;
                if (attributeValueListList != nil && [attributeValueListList count] > 0) {
                    NSMutableArray *attributeValueListArray = [[[NSMutableArray alloc] init] autorelease];
                    [keyConditionsListValueJson setValue:attributeValueListArray forKey:@"AttributeValueList"];
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

            if (keyConditionsListValueValue.comparisonOperator != nil) {
                [keyConditionsListValueJson setValue:keyConditionsListValueValue.comparisonOperator forKey:@"ComparisonOperator"];
            }
        }
    }

    if (queryRequest.scanIndexForwardIsSet) {
        [json setValue:(queryRequest.scanIndexForward ? @"true":@"false") forKey:@"ScanIndexForward"];
    }
    if (queryRequest.exclusiveStartKey != nil && [queryRequest.exclusiveStartKey count] > 0) {
        NSMutableDictionary *exclusiveStartKeyJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:exclusiveStartKeyJson forKey:@"ExclusiveStartKey"];
        for (NSString *exclusiveStartKeyListValue in queryRequest.exclusiveStartKey) {
            NSMutableDictionary    *exclusiveStartKeyListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [exclusiveStartKeyJson setValue:exclusiveStartKeyListValueJson forKey:exclusiveStartKeyListValue];
            DynamoDBAttributeValue *exclusiveStartKeyListValueValue = [queryRequest.exclusiveStartKey valueForKey:exclusiveStartKeyListValue];

            if (exclusiveStartKeyListValueValue.s != nil) {
                [exclusiveStartKeyListValueJson setValue:exclusiveStartKeyListValueValue.s forKey:@"S"];
            }

            if (exclusiveStartKeyListValueValue.n != nil) {
                [exclusiveStartKeyListValueJson setValue:exclusiveStartKeyListValueValue.n forKey:@"N"];
            }

            if (exclusiveStartKeyListValueValue.b != nil) {
                [exclusiveStartKeyListValueJson setValue:[exclusiveStartKeyListValueValue.b base64EncodedString] forKey:@"B"];
            }
            if (exclusiveStartKeyListValueValue != nil) {
                NSArray *sSList = exclusiveStartKeyListValueValue.sS;
                if (sSList != nil && [sSList count] > 0) {
                    NSMutableArray *sSArray = [[[NSMutableArray alloc] init] autorelease];
                    [exclusiveStartKeyListValueJson setValue:sSArray forKey:@"SS"];
                    for (NSString *sSListValue in sSList) {
                        if (sSListValue != nil) {
                            [sSArray addObject:sSListValue];
                        }
                    }
                }
            }
            if (exclusiveStartKeyListValueValue != nil) {
                NSArray *nSList = exclusiveStartKeyListValueValue.nS;
                if (nSList != nil && [nSList count] > 0) {
                    NSMutableArray *nSArray = [[[NSMutableArray alloc] init] autorelease];
                    [exclusiveStartKeyListValueJson setValue:nSArray forKey:@"NS"];
                    for (NSString *nSListValue in nSList) {
                        if (nSListValue != nil) {
                            [nSArray addObject:nSListValue];
                        }
                    }
                }
            }
            if (exclusiveStartKeyListValueValue != nil) {
                NSArray *bSList = exclusiveStartKeyListValueValue.bS;
                if (bSList != nil && [bSList count] > 0) {
                    NSMutableArray *bSArray = [[[NSMutableArray alloc] init] autorelease];
                    [exclusiveStartKeyListValueJson setValue:bSArray forKey:@"BS"];
                    for (NSData *bSListValue in bSList) {
                        if (bSListValue != nil) {
                            [bSArray addObject:[bSListValue base64EncodedString]];
                        }
                    }
                }
            }
        }
    }

    if (queryRequest.returnConsumedCapacity != nil) {
        [json setValue:queryRequest.returnConsumedCapacity forKey:@"ReturnConsumedCapacity"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

