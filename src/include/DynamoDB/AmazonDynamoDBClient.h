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
#import "DynamoDBListTablesResponse.h"
#import "DynamoDBListTablesResponseUnmarshaller.h"
#import "DynamoDBListTablesRequest.h"
#import "DynamoDBListTablesRequestMarshaller.h"
#import "DynamoDBQueryResponse.h"
#import "DynamoDBQueryResponseUnmarshaller.h"
#import "DynamoDBQueryRequest.h"
#import "DynamoDBQueryRequestMarshaller.h"
#import "DynamoDBBatchWriteItemResponse.h"
#import "DynamoDBBatchWriteItemResponseUnmarshaller.h"
#import "DynamoDBBatchWriteItemRequest.h"
#import "DynamoDBBatchWriteItemRequestMarshaller.h"
#import "DynamoDBUpdateItemResponse.h"
#import "DynamoDBUpdateItemResponseUnmarshaller.h"
#import "DynamoDBUpdateItemRequest.h"
#import "DynamoDBUpdateItemRequestMarshaller.h"
#import "DynamoDBPutItemResponse.h"
#import "DynamoDBPutItemResponseUnmarshaller.h"
#import "DynamoDBPutItemRequest.h"
#import "DynamoDBPutItemRequestMarshaller.h"
#import "DynamoDBDescribeTableResponse.h"
#import "DynamoDBDescribeTableResponseUnmarshaller.h"
#import "DynamoDBDescribeTableRequest.h"
#import "DynamoDBDescribeTableRequestMarshaller.h"
#import "DynamoDBScanResponse.h"
#import "DynamoDBScanResponseUnmarshaller.h"
#import "DynamoDBScanRequest.h"
#import "DynamoDBScanRequestMarshaller.h"
#import "DynamoDBCreateTableResponse.h"
#import "DynamoDBCreateTableResponseUnmarshaller.h"
#import "DynamoDBCreateTableRequest.h"
#import "DynamoDBCreateTableRequestMarshaller.h"
#import "DynamoDBUpdateTableResponse.h"
#import "DynamoDBUpdateTableResponseUnmarshaller.h"
#import "DynamoDBUpdateTableRequest.h"
#import "DynamoDBUpdateTableRequestMarshaller.h"
#import "DynamoDBDeleteTableResponse.h"
#import "DynamoDBDeleteTableResponseUnmarshaller.h"
#import "DynamoDBDeleteTableRequest.h"
#import "DynamoDBDeleteTableRequestMarshaller.h"
#import "DynamoDBDeleteItemResponse.h"
#import "DynamoDBDeleteItemResponseUnmarshaller.h"
#import "DynamoDBDeleteItemRequest.h"
#import "DynamoDBDeleteItemRequestMarshaller.h"
#import "DynamoDBGetItemResponse.h"
#import "DynamoDBGetItemResponseUnmarshaller.h"
#import "DynamoDBGetItemRequest.h"
#import "DynamoDBGetItemRequestMarshaller.h"
#import "DynamoDBBatchGetItemResponse.h"
#import "DynamoDBBatchGetItemResponseUnmarshaller.h"
#import "DynamoDBBatchGetItemRequest.h"
#import "DynamoDBBatchGetItemRequestMarshaller.h"

#import "DynamoDBWebServiceClient.h"

/** \defgroup DynamoDB AmazonDynamoDB */

/** <summary>
 * Interface for accessing AmazonDynamoDB.
 *
 *  <p>
 * Amazon DynamoDB is a fast, highly scalable, highly available, cost-effective non-relational database service.
 * </p>
 * <p>
 * Amazon DynamoDB removes traditional scalability limitations on data storage while maintaining low latency and predictable performance.
 * </p>
 * </summary>
 *
 */
@interface AmazonDynamoDBClient:DynamoDBWebServiceClient
{
}


/**
 * <p>
 * Retrieves a paginated list of table names created by the AWS Account of the caller in the AWS Region (e.g. us-east-1 ).
 * </p>
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
 * <p>
 * Gets the values of one or more items and its attributes by primary key (composite primary key, only).
 * </p>
 * <p>
 * Narrow the scope of the query using comparison operators on the RangeKeyValue of the composite key. Use the
 * ScanIndexForward parameter to get results in forward or reverse order by range key.
 * </p>
 *
 * @param queryRequest Container for the necessary parameters to execute the Query service method on AmazonDynamoDB.
 *
 * @return The response from the Query service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Allows to execute a batch of Put and/or Delete Requests for many tables in a single call. A total of 25 requests are
 * allowed.
 * </p>
 * <p>
 * There are no transaction guarantees provided by this API. It does not allow conditional puts nor does it support return
 * values.
 * </p>
 *
 * @param batchWriteItemRequest Container for the necessary parameters to execute the BatchWriteItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the BatchWriteItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Edits an existing item's attributes.
 * </p>
 * <p>
 * You can perform a conditional update (insert a new attribute name-value pair if it doesn't exist, or replace an existing
 * name-value pair if it has certain expected attribute values).
 * </p>
 *
 * @param updateItemRequest Container for the necessary parameters to execute the UpdateItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the UpdateItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBConditionalCheckFailedException For more information see <DynamoDBConditionalCheckFailedException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Creates a new item, or replaces an old item with a new item (including all the attributes).
 * </p>
 * <p>
 * If an item already exists in the specified table with the same primary key, the new item completely replaces the
 * existing item. You can perform a conditional put (insert a new item if one with the specified primary key doesn't
 * exist), or replace an existing item if it has certain attribute values.
 * </p>
 *
 * @param putItemRequest Container for the necessary parameters to execute the PutItem service method on AmazonDynamoDB.
 *
 * @return The response from the PutItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBConditionalCheckFailedException For more information see <DynamoDBConditionalCheckFailedException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Retrieves information about the table, including the current status of the table, the primary key schema and when the
 * table was created.
 * </p>
 * <p>
 * If the table does not exist, Amazon DynamoDB returns a ResourceNotFoundException .
 * </p>
 *
 * @param describeTableRequest Container for the necessary parameters to execute the DescribeTable service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the DescribeTable service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Retrieves one or more items and its attributes by performing a full scan of a table.
 * </p>
 * <p>
 * Provide a ScanFilter to get more specific results.
 * </p>
 *
 * @param scanRequest Container for the necessary parameters to execute the Scan service method on AmazonDynamoDB.
 *
 * @return The response from the Scan service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Adds a new table to your account.
 * </p>
 * <p>
 * The table name must be unique among those associated with the AWS Account issuing the request, and the AWS Region that
 * receives the request (e.g. us-east-1 ).
 * </p>
 * <p>
 * The CreateTable operation triggers an asynchronous workflow to begin creating the table. Amazon DynamoDB immediately
 * returns the state of the table ( CREATING ) until the table is in the ACTIVE state. Once the table is in the ACTIVE
 * state, you can perform data plane operations.
 * </p>
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
 * <p>
 * Updates the provisioned throughput for the given table.
 * </p>
 * <p>
 * Setting the throughput for a table helps you manage performance and is part of the Provisioned Throughput feature of
 * Amazon DynamoDB.
 * </p>
 *
 * @param updateTableRequest Container for the necessary parameters to execute the UpdateTable service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the UpdateTable service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceInUseException For more information see <DynamoDBResourceInUseException>
 * @exception DynamoDBLimitExceededException For more information see <DynamoDBLimitExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Deletes a table and all of its items.
 * </p>
 * <p>
 * If the table is in the ACTIVE state, you can delete it. If a table is in CREATING or UPDATING states then Amazon
 * DynamoDB returns a ResourceInUseException . If the specified table does not exist, Amazon DynamoDB returns a
 * ResourceNotFoundException .
 * </p>
 *
 * @param deleteTableRequest Container for the necessary parameters to execute the DeleteTable service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the DeleteTable service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBResourceInUseException For more information see <DynamoDBResourceInUseException>
 * @exception DynamoDBLimitExceededException For more information see <DynamoDBLimitExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Deletes a single item in a table by primary key.
 * </p>
 * <p>
 * You can perform a conditional delete operation that deletes the item if it exists, or if it has an expected attribute
 * value.
 * </p>
 *
 * @param deleteItemRequest Container for the necessary parameters to execute the DeleteItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the DeleteItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBConditionalCheckFailedException For more information see <DynamoDBConditionalCheckFailedException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Retrieves a set of Attributes for an item that matches the primary key.
 * </p>
 * <p>
 * The GetItem operation provides an eventually-consistent read by default. If eventually-consistent reads are not
 * acceptable for your application, use ConsistentRead . Although this operation might take longer than a standard read, it
 * always returns the last updated value.
 * </p>
 *
 * @param getItemRequest Container for the necessary parameters to execute the GetItem service method on AmazonDynamoDB.
 *
 * @return The response from the GetItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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
 * <p>
 * Retrieves the attributes for multiple items from multiple tables using their primary keys.
 * </p>
 * <p>
 * The maximum number of item attributes that can be retrieved for a single operation is 100. Also, the number of items
 * retrieved is constrained by a 1 MB the size limit. If the response size limit is exceeded or a partial result is
 * returned due to an internal processing failure, Amazon DynamoDB returns an UnprocessedKeys value so you can retry the
 * operation starting with the next item to get.
 * </p>
 * <p>
 * Amazon DynamoDB automatically adjusts the number of items returned per page to enforce this limit. For example, even if
 * you ask to retrieve 100 items, but each individual item is 50k in size, the system returns 20 items and an appropriate
 * UnprocessedKeys value so you can get the next page of results. If necessary, your application needs its own logic to
 * assemble the pages of results into one set.
 * </p>
 *
 * @param batchGetItemRequest Container for the necessary parameters to execute the BatchGetItem service method on
 *           AmazonDynamoDB.
 *
 * @return The response from the BatchGetItem service method, as returned by AmazonDynamoDB.
 *
 * @exception DynamoDBProvisionedThroughputExceededException For more information see <DynamoDBProvisionedThroughputExceededException>
 * @exception DynamoDBInternalServerErrorException For more information see <DynamoDBInternalServerErrorException>
 * @exception DynamoDBResourceNotFoundException For more information see <DynamoDBResourceNotFoundException>
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

