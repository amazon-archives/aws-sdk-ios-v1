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


#import "DynamoDBCreateTableRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBCreateTableRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBCreateTableRequest *)createTableRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[createTableRequest delegate]];
    [request setCredentials:[createTableRequest credentials]];
    [request setEndpoint:[createTableRequest requestEndpoint]];
    [request setRequestTag:[createTableRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.CreateTable" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (createTableRequest.tableName != nil) {
        [json setValue:createTableRequest.tableName forKey:@"TableName"];
    }
    if (createTableRequest != nil) {
        DynamoDBKeySchema *keySchema = createTableRequest.keySchema;
        if (keySchema != nil) {
            NSMutableDictionary *keySchemaJson = [[[NSMutableDictionary alloc] init] autorelease];
            [json setValue:keySchemaJson forKey:@"KeySchema"];

            if (keySchema != nil) {
                DynamoDBKeySchemaElement *hashKeyElement = keySchema.hashKeyElement;
                if (hashKeyElement != nil) {
                    NSMutableDictionary *hashKeyElementJson = [[[NSMutableDictionary alloc] init] autorelease];
                    [keySchemaJson setValue:hashKeyElementJson forKey:@"HashKeyElement"];


                    if (hashKeyElement.attributeName != nil) {
                        [hashKeyElementJson setValue:hashKeyElement.attributeName forKey:@"AttributeName"];
                    }

                    if (hashKeyElement.attributeType != nil) {
                        [hashKeyElementJson setValue:hashKeyElement.attributeType forKey:@"AttributeType"];
                    }
                }
            }
            if (keySchema != nil) {
                DynamoDBKeySchemaElement *rangeKeyElement = keySchema.rangeKeyElement;
                if (rangeKeyElement != nil) {
                    NSMutableDictionary *rangeKeyElementJson = [[[NSMutableDictionary alloc] init] autorelease];
                    [keySchemaJson setValue:rangeKeyElementJson forKey:@"RangeKeyElement"];


                    if (rangeKeyElement.attributeName != nil) {
                        [rangeKeyElementJson setValue:rangeKeyElement.attributeName forKey:@"AttributeName"];
                    }

                    if (rangeKeyElement.attributeType != nil) {
                        [rangeKeyElementJson setValue:rangeKeyElement.attributeType forKey:@"AttributeType"];
                    }
                }
            }
        }
    }
    if (createTableRequest != nil) {
        DynamoDBProvisionedThroughput *provisionedThroughput = createTableRequest.provisionedThroughput;
        if (provisionedThroughput != nil) {
            NSMutableDictionary *provisionedThroughputJson = [[[NSMutableDictionary alloc] init] autorelease];
            [json setValue:provisionedThroughputJson forKey:@"ProvisionedThroughput"];


            if (provisionedThroughput.readCapacityUnits != nil) {
                [provisionedThroughputJson setValue:provisionedThroughput.readCapacityUnits forKey:@"ReadCapacityUnits"];
            }

            if (provisionedThroughput.writeCapacityUnits != nil) {
                [provisionedThroughputJson setValue:provisionedThroughput.writeCapacityUnits forKey:@"WriteCapacityUnits"];
            }
        }
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

