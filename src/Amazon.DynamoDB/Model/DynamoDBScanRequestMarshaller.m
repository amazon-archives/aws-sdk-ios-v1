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


#import "DynamoDBScanRequestMarshaller.h"
#import "DynamoDBAttributeValue.h"
#import "AmazonJSON.h"
#import "AmazonSDKUtil.h"

@implementation DynamoDBScanRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBScanRequest *)scanRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[scanRequest delegate]];
    [request setCredentials:[scanRequest credentials]];
    [request setEndpoint:[scanRequest requestEndpoint]];
    [request setRequestTag:[scanRequest requestTag]];


    [request addValue:@"DynamoDB_20120810.Scan" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (scanRequest.tableName != nil) {
        [json setValue:scanRequest.tableName forKey:@"TableName"];
    }
    if (scanRequest != nil) {
        NSArray *attributesToGetList = scanRequest.attributesToGet;
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

    if (scanRequest.limit != nil) {
        [json setValue:scanRequest.limit forKey:@"Limit"];
    }

    if (scanRequest.select != nil) {
        [json setValue:scanRequest.select forKey:@"Select"];
    }
    if (scanRequest.scanFilter != nil && [scanRequest.scanFilter count] > 0) {
        NSMutableDictionary *scanFilterJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:scanFilterJson forKey:@"ScanFilter"];
        for (NSString *scanFilterListValue in scanRequest.scanFilter) {
            NSMutableDictionary *scanFilterListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [scanFilterJson setValue:scanFilterListValueJson forKey:scanFilterListValue];
            DynamoDBCondition   *scanFilterListValueValue = [scanRequest.scanFilter valueForKey:scanFilterListValue];


            if (scanFilterListValueValue.attributeValueList != nil) {
                NSArray *attributeValueListList = scanFilterListValueValue.attributeValueList;
                if (attributeValueListList != nil && [attributeValueListList count] > 0) {
                    NSMutableArray *attributeValueListArray = [[[NSMutableArray alloc] init] autorelease];
                    [scanFilterListValueJson setValue:attributeValueListArray forKey:@"AttributeValueList"];
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

            if (scanFilterListValueValue.comparisonOperator != nil) {
                [scanFilterListValueJson setValue:scanFilterListValueValue.comparisonOperator forKey:@"ComparisonOperator"];
            }
        }
    }
    if (scanRequest.exclusiveStartKey != nil && [scanRequest.exclusiveStartKey count] > 0) {
        NSMutableDictionary *exclusiveStartKeyJson = [[[NSMutableDictionary alloc] init] autorelease];
        [json setValue:exclusiveStartKeyJson forKey:@"ExclusiveStartKey"];
        for (NSString *exclusiveStartKeyListValue in scanRequest.exclusiveStartKey) {
            NSMutableDictionary    *exclusiveStartKeyListValueJson = [[[NSMutableDictionary alloc] init] autorelease];
            [exclusiveStartKeyJson setValue:exclusiveStartKeyListValueJson forKey:exclusiveStartKeyListValue];
            DynamoDBAttributeValue *exclusiveStartKeyListValueValue = [scanRequest.exclusiveStartKey valueForKey:exclusiveStartKeyListValue];

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

    if (scanRequest.returnConsumedCapacity != nil) {
        [json setValue:scanRequest.returnConsumedCapacity forKey:@"ReturnConsumedCapacity"];
    }

    if (scanRequest.totalSegments != nil) {
        [json setValue:scanRequest.totalSegments forKey:@"TotalSegments"];
    }

    if (scanRequest.segment != nil) {
        [json setValue:scanRequest.segment forKey:@"Segment"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

