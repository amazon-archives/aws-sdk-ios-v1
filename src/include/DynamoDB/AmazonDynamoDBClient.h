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
#import "DynamoDBScanResponse.h"
#import "DynamoDBScanRequest.h"
#import "DynamoDBUpdateTableResponse.h"
#import "DynamoDBUpdateTableRequest.h"
#import "DynamoDBDeleteTableResponse.h"
#import "DynamoDBDeleteTableRequest.h"
#import "DynamoDBBatchWriteItemResponse.h"
#import "DynamoDBBatchWriteItemRequest.h"
#import "DynamoDBDescribeTableResponse.h"
#import "DynamoDBDescribeTableRequest.h"
#import "DynamoDBGetItemResponse.h"
#import "DynamoDBGetItemRequest.h"
#import "DynamoDBDeleteItemResponse.h"
#import "DynamoDBDeleteItemRequest.h"
#import "DynamoDBCreateTableResponse.h"
#import "DynamoDBCreateTableRequest.h"
#import "DynamoDBQueryResponse.h"
#import "DynamoDBQueryRequest.h"
#import "DynamoDBPutItemResponse.h"
#import "DynamoDBPutItemRequest.h"
#import "DynamoDBListTablesResponse.h"
#import "DynamoDBListTablesRequest.h"
#import "DynamoDBUpdateItemResponse.h"
#import "DynamoDBUpdateItemRequest.h"
#import "DynamoDBBatchGetItemResponse.h"
#import "DynamoDBBatchGetItemRequest.h"

#import "DynamoDBWebServiceClient.h"

/** \defgroup DynamoDB AmazonDynamoDB */

/** <summary>
 * Interface for accessing AmazonDynamoDB.
 *
 *
 * </summary>
 *
 */
@interface AmazonDynamoDBClient:DynamoDBWebServiceClient
{
}


/**
 *
 * @param scanRequest Container for the necessary parameters to execute the Scan service method on AmazonDynamoDB.
 *
 * @return The response from the Scan service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBScanRequest
 * @see DynamoDBScanResponse
 */
-(DynamoDBScanResponse *)scan:(DynamoDBScanRequest *)scanRequest;


/**
 *
 * @param updateTableRequest Container for the necessary parameters to execute the UpdateTable service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the UpdateTable service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceInUseException For more information see <DynamoDBResourceInUseException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBLimitExceededException For more information see <DynamoDBLimitExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBUpdateTableRequest
 * @see DynamoDBUpdateTableResponse
 */
-(DynamoDBUpdateTableResponse *)updateTable:(DynamoDBUpdateTableRequest *)updateTableRequest;


/**
 *
 * @param deleteTableRequest Container for the necessary parameters to execute the DeleteTable service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the DeleteTable service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceInUseException For more information see <DynamoDBResourceInUseException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBLimitExceededException For more information see <DynamoDBLimitExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBDeleteTableRequest
 * @see DynamoDBDeleteTableResponse
 */
-(DynamoDBDeleteTableResponse *)deleteTable:(DynamoDBDeleteTableRequest *)deleteTableRequest;


/**
 *
 * @param batchWriteItemRequest Container for the necessary parameters to execute the BatchWriteItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the BatchWriteItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBItemCollectionSizeLimitExceededException For more information see <DynamoDBItemCollectionSizeLimitExceededException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBBatchWriteItemRequest
 * @see DynamoDBBatchWriteItemResponse
 */
-(DynamoDBBatchWriteItemResponse *)batchWriteItem:(DynamoDBBatchWriteItemRequest *)batchWriteItemRequest;


/**
 *
 * @param describeTableRequest Container for the necessary parameters to execute the DescribeTable service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the DescribeTable service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBDescribeTableRequest
 * @see DynamoDBDescribeTableResponse
 */
-(DynamoDBDescribeTableResponse *)describeTable:(DynamoDBDescribeTableRequest *)describeTableRequest;


/**
 *
 * @param getItemRequest Container for the necessary parameters to execute the GetItem service method on AmazonDynamoDB.
 *
 * @return The response from the GetItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBGetItemRequest
 * @see DynamoDBGetItemResponse
 */
-(DynamoDBGetItemResponse *)getItem:(DynamoDBGetItemRequest *)getItemRequest;


/**
 *
 * @param deleteItemRequest Container for the necessary parameters to execute the DeleteItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the DeleteItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBItemCollectionSizeLimitExceededException For more information see <DynamoDBItemCollectionSizeLimitExceededException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBConditionalCheckFailedException For more information see <DynamoDBConditionalCheckFailedException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBDeleteItemRequest
 * @see DynamoDBDeleteItemResponse
 */
-(DynamoDBDeleteItemResponse *)deleteItem:(DynamoDBDeleteItemRequest *)deleteItemRequest;


/**
 *
 * @param createTableRequest Container for the necessary parameters to execute the CreateTable service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the CreateTable service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceInUseException For more information see <DynamoDBResourceInUseException>
 * @exception DynamoDBLimitExceededException For more information see <DynamoDBLimitExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBCreateTableRequest
 * @see DynamoDBCreateTableResponse
 */
-(DynamoDBCreateTableResponse *)createTable:(DynamoDBCreateTableRequest *)createTableRequest;


/**
 *
 * @param queryRequest Container for the necessary parameters to execute the Query service method on AmazonDynamoDB.
 *
 * @return The response from the Query service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBQueryRequest
 * @see DynamoDBQueryResponse
 */
-(DynamoDBQueryResponse *)query:(DynamoDBQueryRequest *)queryRequest;


/**
 *
 * @param putItemRequest Container for the necessary parameters to execute the PutItem service method on AmazonDynamoDB.
 *
 * @return The response from the PutItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBItemCollectionSizeLimitExceededException For more information see <DynamoDBItemCollectionSizeLimitExceededException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBConditionalCheckFailedException For more information see <DynamoDBConditionalCheckFailedException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBPutItemRequest
 * @see DynamoDBPutItemResponse
 */
-(DynamoDBPutItemResponse *)putItem:(DynamoDBPutItemRequest *)putItemRequest;


/**
 *
 * @param listTablesRequest Container for the necessary parameters to execute the ListTables service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the ListTables service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBListTablesRequest
 * @see DynamoDBListTablesResponse
 */
-(DynamoDBListTablesResponse *)listTables:(DynamoDBListTablesRequest *)listTablesRequest;


/**
 *
 * @param updateItemRequest Container for the necessary parameters to execute the UpdateItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the UpdateItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBItemCollectionSizeLimitExceededException For more information see <DynamoDBItemCollectionSizeLimitExceededException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBConditionalCheckFailedException For more information see <DynamoDBConditionalCheckFailedException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBUpdateItemRequest
 * @see DynamoDBUpdateItemResponse
 */
-(DynamoDBUpdateItemResponse *)updateItem:(DynamoDBUpdateItemRequest *)updateItemRequest;


/**
 *
 * @param batchGetItemRequest Container for the necessary parameters to execute the BatchGetItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the BatchGetItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonDynamoDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see DynamoDBBatchGetItemRequest
 * @see DynamoDBBatchGetItemResponse
 */
-(DynamoDBBatchGetItemResponse *)batchGetItem:(DynamoDBBatchGetItemRequest *)batchGetItemRequest;



@end

