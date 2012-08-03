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

#import "AmazonDynamoDBClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonDynamoDBClient

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = @"https://dynamodb.us-east-1.amazonaws.com/";
    }
    return self;
}

-(DynamoDBListTablesResponse *)listTables:(DynamoDBListTablesRequest *)listTablesRequest
{
    AmazonServiceRequest *request = [DynamoDBListTablesRequestMarshaller createRequest:listTablesRequest];

    return (DynamoDBListTablesResponse *)[self invoke:request rawRequest:listTablesRequest unmarshallerDelegate:[DynamoDBListTablesResponseUnmarshaller class]];
}

-(DynamoDBQueryResponse *)query:(DynamoDBQueryRequest *)queryRequest
{
    AmazonServiceRequest *request = [DynamoDBQueryRequestMarshaller createRequest:queryRequest];

    return (DynamoDBQueryResponse *)[self invoke:request rawRequest:queryRequest unmarshallerDelegate:[DynamoDBQueryResponseUnmarshaller class]];
}

-(DynamoDBBatchWriteItemResponse *)batchWriteItem:(DynamoDBBatchWriteItemRequest *)batchWriteItemRequest
{
    AmazonServiceRequest *request = [DynamoDBBatchWriteItemRequestMarshaller createRequest:batchWriteItemRequest];

    return (DynamoDBBatchWriteItemResponse *)[self invoke:request rawRequest:batchWriteItemRequest unmarshallerDelegate:[DynamoDBBatchWriteItemResponseUnmarshaller class]];
}

-(DynamoDBUpdateItemResponse *)updateItem:(DynamoDBUpdateItemRequest *)updateItemRequest
{
    AmazonServiceRequest *request = [DynamoDBUpdateItemRequestMarshaller createRequest:updateItemRequest];

    return (DynamoDBUpdateItemResponse *)[self invoke:request rawRequest:updateItemRequest unmarshallerDelegate:[DynamoDBUpdateItemResponseUnmarshaller class]];
}

-(DynamoDBPutItemResponse *)putItem:(DynamoDBPutItemRequest *)putItemRequest
{
    AmazonServiceRequest *request = [DynamoDBPutItemRequestMarshaller createRequest:putItemRequest];

    return (DynamoDBPutItemResponse *)[self invoke:request rawRequest:putItemRequest unmarshallerDelegate:[DynamoDBPutItemResponseUnmarshaller class]];
}

-(DynamoDBDescribeTableResponse *)describeTable:(DynamoDBDescribeTableRequest *)describeTableRequest
{
    AmazonServiceRequest *request = [DynamoDBDescribeTableRequestMarshaller createRequest:describeTableRequest];

    return (DynamoDBDescribeTableResponse *)[self invoke:request rawRequest:describeTableRequest unmarshallerDelegate:[DynamoDBDescribeTableResponseUnmarshaller class]];
}

-(DynamoDBScanResponse *)scan:(DynamoDBScanRequest *)scanRequest
{
    AmazonServiceRequest *request = [DynamoDBScanRequestMarshaller createRequest:scanRequest];

    return (DynamoDBScanResponse *)[self invoke:request rawRequest:scanRequest unmarshallerDelegate:[DynamoDBScanResponseUnmarshaller class]];
}

-(DynamoDBCreateTableResponse *)createTable:(DynamoDBCreateTableRequest *)createTableRequest
{
    AmazonServiceRequest *request = [DynamoDBCreateTableRequestMarshaller createRequest:createTableRequest];

    return (DynamoDBCreateTableResponse *)[self invoke:request rawRequest:createTableRequest unmarshallerDelegate:[DynamoDBCreateTableResponseUnmarshaller class]];
}

-(DynamoDBUpdateTableResponse *)updateTable:(DynamoDBUpdateTableRequest *)updateTableRequest
{
    AmazonServiceRequest *request = [DynamoDBUpdateTableRequestMarshaller createRequest:updateTableRequest];

    return (DynamoDBUpdateTableResponse *)[self invoke:request rawRequest:updateTableRequest unmarshallerDelegate:[DynamoDBUpdateTableResponseUnmarshaller class]];
}

-(DynamoDBDeleteTableResponse *)deleteTable:(DynamoDBDeleteTableRequest *)deleteTableRequest
{
    AmazonServiceRequest *request = [DynamoDBDeleteTableRequestMarshaller createRequest:deleteTableRequest];

    return (DynamoDBDeleteTableResponse *)[self invoke:request rawRequest:deleteTableRequest unmarshallerDelegate:[DynamoDBDeleteTableResponseUnmarshaller class]];
}

-(DynamoDBDeleteItemResponse *)deleteItem:(DynamoDBDeleteItemRequest *)deleteItemRequest
{
    AmazonServiceRequest *request = [DynamoDBDeleteItemRequestMarshaller createRequest:deleteItemRequest];

    return (DynamoDBDeleteItemResponse *)[self invoke:request rawRequest:deleteItemRequest unmarshallerDelegate:[DynamoDBDeleteItemResponseUnmarshaller class]];
}

-(DynamoDBGetItemResponse *)getItem:(DynamoDBGetItemRequest *)getItemRequest
{
    AmazonServiceRequest *request = [DynamoDBGetItemRequestMarshaller createRequest:getItemRequest];

    return (DynamoDBGetItemResponse *)[self invoke:request rawRequest:getItemRequest unmarshallerDelegate:[DynamoDBGetItemResponseUnmarshaller class]];
}

-(DynamoDBBatchGetItemResponse *)batchGetItem:(DynamoDBBatchGetItemRequest *)batchGetItemRequest
{
    AmazonServiceRequest *request = [DynamoDBBatchGetItemRequestMarshaller createRequest:batchGetItemRequest];

    return (DynamoDBBatchGetItemResponse *)[self invoke:request rawRequest:batchGetItemRequest unmarshallerDelegate:[DynamoDBBatchGetItemResponseUnmarshaller class]];
}



@end

