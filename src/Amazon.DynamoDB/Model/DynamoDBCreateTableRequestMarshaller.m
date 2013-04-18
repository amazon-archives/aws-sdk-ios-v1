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


#import "DynamoDBCreateTableRequestMarshaller.h"
#import "DynamoDBAttributeValue.h"
#import "AmazonJSON.h"
#import "AmazonSDKUtil.h"

@implementation DynamoDBCreateTableRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBCreateTableRequest *)createTableRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[createTableRequest delegate]];
    [request setCredentials:[createTableRequest credentials]];
    [request setEndpoint:[createTableRequest requestEndpoint]];
    [request setRequestTag:[createTableRequest requestTag]];


    [request addValue:@"DynamoDB_20120810.CreateTable" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];


    if (createTableRequest.attributeDefinitions != nil) {
        NSArray *attributeDefinitionsList = createTableRequest.attributeDefinitions;
        if (attributeDefinitionsList != nil && [attributeDefinitionsList count] > 0) {
            NSMutableArray *attributeDefinitionsArray = [[[NSMutableArray alloc] init] autorelease];
            [json setValue:attributeDefinitionsArray forKey:@"AttributeDefinitions"];
            for (DynamoDBAttributeDefinition *attributeDefinitionsListValue in attributeDefinitionsList) {
                NSMutableDictionary *attributeDefinitionsArrayObject = [[[NSMutableDictionary alloc] init] autorelease];
                [attributeDefinitionsArray addObject:attributeDefinitionsArrayObject];

                if (attributeDefinitionsListValue.attributeName != nil) {
                    [attributeDefinitionsArrayObject setValue:attributeDefinitionsListValue.attributeName forKey:@"AttributeName"];
                }

                if (attributeDefinitionsListValue.attributeType != nil) {
                    [attributeDefinitionsArrayObject setValue:attributeDefinitionsListValue.attributeType forKey:@"AttributeType"];
                }
            }
        }
    }

    if (createTableRequest.tableName != nil) {
        [json setValue:createTableRequest.tableName forKey:@"TableName"];
    }


    if (createTableRequest.keySchema != nil) {
        NSArray *keySchemaList = createTableRequest.keySchema;
        if (keySchemaList != nil && [keySchemaList count] > 0) {
            NSMutableArray *keySchemaArray = [[[NSMutableArray alloc] init] autorelease];
            [json setValue:keySchemaArray forKey:@"KeySchema"];
            for (DynamoDBKeySchemaElement *keySchemaListValue in keySchemaList) {
                NSMutableDictionary *keySchemaArrayObject = [[[NSMutableDictionary alloc] init] autorelease];
                [keySchemaArray addObject:keySchemaArrayObject];

                if (keySchemaListValue.attributeName != nil) {
                    [keySchemaArrayObject setValue:keySchemaListValue.attributeName forKey:@"AttributeName"];
                }

                if (keySchemaListValue.keyType != nil) {
                    [keySchemaArrayObject setValue:keySchemaListValue.keyType forKey:@"KeyType"];
                }
            }
        }
    }


    if (createTableRequest.localSecondaryIndexes != nil) {
        NSArray *localSecondaryIndexesList = createTableRequest.localSecondaryIndexes;
        if (localSecondaryIndexesList != nil && [localSecondaryIndexesList count] > 0) {
            NSMutableArray *localSecondaryIndexesArray = [[[NSMutableArray alloc] init] autorelease];
            [json setValue:localSecondaryIndexesArray forKey:@"LocalSecondaryIndexes"];
            for (DynamoDBLocalSecondaryIndex *localSecondaryIndexesListValue in localSecondaryIndexesList) {
                NSMutableDictionary *localSecondaryIndexesArrayObject = [[[NSMutableDictionary alloc] init] autorelease];
                [localSecondaryIndexesArray addObject:localSecondaryIndexesArrayObject];

                if (localSecondaryIndexesListValue.indexName != nil) {
                    [localSecondaryIndexesArrayObject setValue:localSecondaryIndexesListValue.indexName forKey:@"IndexName"];
                }


                if (localSecondaryIndexesListValue.keySchema != nil) {
                    NSArray *keySchemaList = localSecondaryIndexesListValue.keySchema;
                    if (keySchemaList != nil && [keySchemaList count] > 0) {
                        NSMutableArray *keySchemaArray = [[[NSMutableArray alloc] init] autorelease];
                        [localSecondaryIndexesArrayObject setValue:keySchemaArray forKey:@"KeySchema"];
                        for (DynamoDBKeySchemaElement *keySchemaListValue in keySchemaList) {
                            NSMutableDictionary *keySchemaArrayObject = [[[NSMutableDictionary alloc] init] autorelease];
                            [keySchemaArray addObject:keySchemaArrayObject];

                            if (keySchemaListValue.attributeName != nil) {
                                [keySchemaArrayObject setValue:keySchemaListValue.attributeName forKey:@"AttributeName"];
                            }

                            if (keySchemaListValue.keyType != nil) {
                                [keySchemaArrayObject setValue:keySchemaListValue.keyType forKey:@"KeyType"];
                            }
                        }
                    }
                }
                if (localSecondaryIndexesListValue != nil) {
                    DynamoDBProjection *projection = localSecondaryIndexesListValue.projection;
                    if (projection != nil) {
                        NSMutableDictionary *projectionJson = [[[NSMutableDictionary alloc] init] autorelease];
                        [localSecondaryIndexesArrayObject setValue:projectionJson forKey:@"Projection"];


                        if (projection.projectionType != nil) {
                            [projectionJson setValue:projection.projectionType forKey:@"ProjectionType"];
                        }
                        if (projection != nil) {
                            NSArray *nonKeyAttributesList = projection.nonKeyAttributes;
                            if (nonKeyAttributesList != nil && [nonKeyAttributesList count] > 0) {
                                NSMutableArray *nonKeyAttributesArray = [[[NSMutableArray alloc] init] autorelease];
                                [projectionJson setValue:nonKeyAttributesArray forKey:@"NonKeyAttributes"];
                                for (NSString *nonKeyAttributesListValue in nonKeyAttributesList) {
                                    if (nonKeyAttributesListValue != nil) {
                                        [nonKeyAttributesArray addObject:nonKeyAttributesListValue];
                                    }
                                }
                            }
                        }
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

