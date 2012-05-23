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
#import "SimpleDBSelectResponse.h"
#import "SimpleDBSelectResponseUnmarshaller.h"
#import "SimpleDBSelectRequest.h"
#import "SimpleDBSelectRequestMarshaller.h"
#import "SimpleDBPutAttributesResponse.h"
#import "SimpleDBPutAttributesResponseUnmarshaller.h"
#import "SimpleDBPutAttributesRequest.h"
#import "SimpleDBPutAttributesRequestMarshaller.h"
#import "SimpleDBBatchDeleteAttributesResponse.h"
#import "SimpleDBBatchDeleteAttributesResponseUnmarshaller.h"
#import "SimpleDBBatchDeleteAttributesRequest.h"
#import "SimpleDBBatchDeleteAttributesRequestMarshaller.h"
#import "SimpleDBDeleteDomainResponse.h"
#import "SimpleDBDeleteDomainResponseUnmarshaller.h"
#import "SimpleDBDeleteDomainRequest.h"
#import "SimpleDBDeleteDomainRequestMarshaller.h"
#import "SimpleDBCreateDomainResponse.h"
#import "SimpleDBCreateDomainResponseUnmarshaller.h"
#import "SimpleDBCreateDomainRequest.h"
#import "SimpleDBCreateDomainRequestMarshaller.h"
#import "SimpleDBDeleteAttributesResponse.h"
#import "SimpleDBDeleteAttributesResponseUnmarshaller.h"
#import "SimpleDBDeleteAttributesRequest.h"
#import "SimpleDBDeleteAttributesRequestMarshaller.h"
#import "SimpleDBListDomainsResponse.h"
#import "SimpleDBListDomainsResponseUnmarshaller.h"
#import "SimpleDBListDomainsRequest.h"
#import "SimpleDBListDomainsRequestMarshaller.h"
#import "SimpleDBGetAttributesResponse.h"
#import "SimpleDBGetAttributesResponseUnmarshaller.h"
#import "SimpleDBGetAttributesRequest.h"
#import "SimpleDBGetAttributesRequestMarshaller.h"
#import "SimpleDBBatchPutAttributesResponse.h"
#import "SimpleDBBatchPutAttributesResponseUnmarshaller.h"
#import "SimpleDBBatchPutAttributesRequest.h"
#import "SimpleDBBatchPutAttributesRequestMarshaller.h"
#import "SimpleDBDomainMetadataResponse.h"
#import "SimpleDBDomainMetadataResponseUnmarshaller.h"
#import "SimpleDBDomainMetadataRequest.h"
#import "SimpleDBDomainMetadataRequestMarshaller.h"

#import "../AmazonWebServiceClient.h"

/** \defgroup SimpleDB Amazon SimpleDB */

/** <summary>
 * Interface for accessing AmazonSimpleDB.
 *
 *  Amazon SimpleDB <p>
 * Amazon SimpleDB is a web service providing the core database functions of data indexing and querying in the cloud. By offloading the time and effort associated with building and operating a web-scale
 * database, SimpleDB provides developers the freedom to focus on application development.
 * </p>
 * <p>
 * A traditional, clustered relational database requires a sizable upfront capital outlay, is complex to design, and often requires extensive and repetitive database administration. Amazon SimpleDB is
 * dramatically simpler, requiring no schema, automatically indexing your data and providing a simple API for storage and access. This approach eliminates the administrative burden of data modeling,
 * index maintenance, and performance tuning. Developers gain access to this functionality within Amazon's proven computing environment, are able to scale instantly, and pay only for what they use.
 * </p>
 * <p>
 * Visit <a href="http://aws.amazon.com/simpledb/"> http://aws.amazon.com/simpledb/ </a> for more information.
 * </p>
 * </summary>
 *
 */
@interface AmazonSimpleDBClient:AmazonWebServiceClient
{
}


/**
 * <p>
 * The Select operation returns a set of attributes for ItemNames that match the select expression. Select is similar to
 * the standard SQL SELECT statement.
 * </p>
 * <p>
 * The total size of the response cannot exceed 1 MB in total size. Amazon SimpleDB automatically adjusts the number of
 * items returned per page to enforce this limit. For example, if the client asks to retrieve 2500 items, but each
 * individual item is 10 kB in size, the system returns 100 items and an appropriate NextToken so the client can access the
 * next page of results.
 * </p>
 * <p>
 * For information on how to construct select expressions, see Using Select to Create Amazon SimpleDB Queries in the
 * Developer Guide.
 * </p>
 *
 * @param selectRequest Container for the necessary parameters to execute the Select service method on AmazonSimpleDB.
 *
 * @return The response from the Select service method, as returned by AmazonSimpleDB.
 *
 * @exception SimpleDBInvalidParameterValueException For more information see <SimpleDBInvalidParameterValueException>
 * @exception SimpleDBInvalidQueryExpressionException For more information see <SimpleDBInvalidQueryExpressionException>
 * @exception SimpleDBRequestTimeoutException For more information see <SimpleDBRequestTimeoutException>
 * @exception SimpleDBInvalidNumberPredicatesException For more information see <SimpleDBInvalidNumberPredicatesException>
 * @exception SimpleDBNoSuchDomainException For more information see <SimpleDBNoSuchDomainException>
 * @exception SimpleDBInvalidNextTokenException For more information see <SimpleDBInvalidNextTokenException>
 * @exception SimpleDBTooManyRequestedAttributesException For more information see <SimpleDBTooManyRequestedAttributesException>
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 * @exception SimpleDBInvalidNumberValueTestsException For more information see <SimpleDBInvalidNumberValueTestsException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBSelectRequest
 * @see SimpleDBSelectResponse
 */
-(SimpleDBSelectResponse *)select:(SimpleDBSelectRequest *)selectRequest;


/**
 * <p>
 * The PutAttributes operation creates or replaces attributes in an item. The client may specify new attributes using a
 * combination of the Attribute.X.Name and Attribute.X.Value parameters. The client specifies the first attribute by the
 * parameters Attribute.0.Name and Attribute.0.Value ,
 * the second attribute by the parameters Attribute.1.Name and Attribute.1.Value , and so on.
 * </p>
 * <p>
 * Attributes are uniquely identified in an item by their name/value combination. For example, a single item can have the
 * attributes { "first_name", "first_value" } and { "first_name", second_value" } . However, it cannot have two attribute
 * instances where both the Attribute.X.Name and Attribute.X.Value are the same.
 * </p>
 * <p>
 * Optionally, the requestor can supply the Replace parameter for each individual attribute. Setting this value to true
 * causes the new attribute value to replace the existing attribute value(s). For example, if an item has the attributes {
 * 'a', '1' } ,
 *
 * { 'b', '2'} and { 'b', '3' } and the requestor calls PutAttributes using the attributes { 'b', '4' }
 * with the Replace parameter set to true, the final attributes of the item are changed to { 'a', '1' } and { 'b', '4' } ,
 * which replaces the previous values of the 'b' attribute with the new value.
 * </p>
 * <p>
 * <b>NOTE:</b> Using PutAttributes to replace attribute values that do not exist will not result in an error response.
 * </p>
 * <p>
 * You cannot specify an empty string as an attribute name.
 * </p>
 * <p>
 * Because Amazon SimpleDB makes multiple copies of client data and uses an eventual consistency update model, an
 * immediate GetAttributes or Select operation (read) immediately after a PutAttributes or DeleteAttributes operation
 * (write) might not return the updated data.
 * </p>
 * <p>
 * The following limitations are enforced for this operation:
 * <ul>
 * <li>256 total attribute name-value pairs per item</li>
 * <li>One billion attributes per domain</li>
 * <li>10 GB of total user data storage per domain</li>
 *
 * </ul>
 *
 * </p>
 *
 * @param putAttributesRequest Container for the necessary parameters to execute the PutAttributes service method on
 *           AmazonSimpleDB.
 *
 * @exception SimpleDBInvalidParameterValueException For more information see <SimpleDBInvalidParameterValueException>
 * @exception SimpleDBNumberDomainBytesExceededException For more information see <SimpleDBNumberDomainBytesExceededException>
 * @exception SimpleDBNumberDomainAttributesExceededException For more information see <SimpleDBNumberDomainAttributesExceededException>
 * @exception SimpleDBNoSuchDomainException For more information see <SimpleDBNoSuchDomainException>
 * @exception SimpleDBNumberItemAttributesExceededException For more information see <SimpleDBNumberItemAttributesExceededException>
 * @exception SimpleDBAttributeDoesNotExistException For more information see <SimpleDBAttributeDoesNotExistException>
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBPutAttributesRequest
 * @see SimpleDBPutAttributesResponse
 */
-(SimpleDBPutAttributesResponse *)putAttributes:(SimpleDBPutAttributesRequest *)putAttributesRequest;


/**
 * <p>
 * Performs multiple DeleteAttributes operations in a single call, which reduces round trips and latencies. This enables
 * Amazon SimpleDB to optimize requests, which generally yields better throughput.
 * </p>
 * <p>
 * <b>NOTE:</b> If you specify BatchDeleteAttributes without attributes or values, all the attributes for the item are
 * deleted. BatchDeleteAttributes is an idempotent operation; running it multiple times on the same item or attribute
 * doesn't result in an error. The BatchDeleteAttributes operation succeeds or fails in its entirety. There are no partial
 * deletes. You can execute multiple BatchDeleteAttributes operations and other operations in parallel. However, large
 * numbers of concurrent BatchDeleteAttributes calls can result in Service Unavailable (503) responses. This operation is
 * vulnerable to exceeding the maximum URL size when making a REST request using the HTTP GET method. This operation does
 * not support conditions using Expected.X.Name, Expected.X.Value, or Expected.X.Exists.
 * </p>
 * <p>
 * The following limitations are enforced for this operation:
 * <ul>
 * <li>1 MB request size</li>
 * <li>25 item limit per BatchDeleteAttributes operation</li>
 *
 * </ul>
 *
 * </p>
 *
 * @param batchDeleteAttributesRequest Container for the necessary parameters to execute the BatchDeleteAttributes service
 *           method on AmazonSimpleDB.
 *
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBBatchDeleteAttributesRequest
 * @see SimpleDBBatchDeleteAttributesResponse
 */
-(SimpleDBBatchDeleteAttributesResponse *)batchDeleteAttributes:(SimpleDBBatchDeleteAttributesRequest *)batchDeleteAttributesRequest;


/**
 * <p>
 * The DeleteDomain operation deletes a domain. Any items (and their attributes) in the domain are deleted as well. The
 * DeleteDomain operation might take 10 or more seconds to complete.
 * </p>
 * <p>
 * <b>NOTE:</b> Running DeleteDomain on a domain that does not exist or running the function multiple times using the same
 * domain name will not result in an error response.
 * </p>
 *
 * @param deleteDomainRequest Container for the necessary parameters to execute the DeleteDomain service method on
 *           AmazonSimpleDB.
 *
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBDeleteDomainRequest
 * @see SimpleDBDeleteDomainResponse
 */
-(SimpleDBDeleteDomainResponse *)deleteDomain:(SimpleDBDeleteDomainRequest *)deleteDomainRequest;


/**
 * <p>
 * The CreateDomain operation creates a new domain. The domain name should be unique among the domains associated with the
 * Access Key ID provided in the request. The CreateDomain operation may take 10 or more seconds to complete.
 * </p>
 * <p>
 * <b>NOTE:</b> CreateDomain is an idempotent operation; running it multiple times using the same domain name will not
 * result in an error response.
 * </p>
 * <p>
 * The client can create up to 100 domains per account.
 * </p>
 * <p>
 * If the client requires additional domains, go to <a href="http://aws.amazon.com/contact-us/simpledb-limit-request/">
 * http://aws.amazon.com/contact-us/simpledb-limit-request/ </a> .
 * </p>
 *
 * @param createDomainRequest Container for the necessary parameters to execute the CreateDomain service method on
 *           AmazonSimpleDB.
 *
 * @exception SimpleDBInvalidParameterValueException For more information see <SimpleDBInvalidParameterValueException>
 * @exception SimpleDBNumberDomainsExceededException For more information see <SimpleDBNumberDomainsExceededException>
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBCreateDomainRequest
 * @see SimpleDBCreateDomainResponse
 */
-(SimpleDBCreateDomainResponse *)createDomain:(SimpleDBCreateDomainRequest *)createDomainRequest;


/**
 * <p>
 * Deletes one or more attributes associated with an item. If all attributes of the item are deleted, the item is deleted.
 * </p>
 * <p>
 * <b>NOTE:</b> If DeleteAttributes is called without being passed any attributes or values specified, all the attributes
 * for the item are deleted.
 * </p>
 * <p>
 * DeleteAttributes is an idempotent operation; running it multiple times on the same item or attribute does not result in
 * an error response.
 * </p>
 * <p>
 * Because Amazon SimpleDB makes multiple copies of item data and uses an eventual consistency update model, performing a
 * GetAttributes or Select operation (read) immediately after a DeleteAttributes or PutAttributes operation (write) might
 * not return updated item data.
 * </p>
 *
 * @param deleteAttributesRequest Container for the necessary parameters to execute the DeleteAttributes service method on
 *           AmazonSimpleDB.
 *
 * @exception SimpleDBInvalidParameterValueException For more information see <SimpleDBInvalidParameterValueException>
 * @exception SimpleDBNoSuchDomainException For more information see <SimpleDBNoSuchDomainException>
 * @exception SimpleDBAttributeDoesNotExistException For more information see <SimpleDBAttributeDoesNotExistException>
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBDeleteAttributesRequest
 * @see SimpleDBDeleteAttributesResponse
 */
-(SimpleDBDeleteAttributesResponse *)deleteAttributes:(SimpleDBDeleteAttributesRequest *)deleteAttributesRequest;


/**
 * <p>
 * The ListDomains operation lists all domains associated with the Access Key ID. It returns domain names up to the limit
 * set by MaxNumberOfDomains. A NextToken is returned if there are more than MaxNumberOfDomains domains. Calling
 * ListDomains successive times with the NextToken provided by the operation returns up to MaxNumberOfDomains more domain
 * names with each successive operation call.
 * </p>
 *
 * @param listDomainsRequest Container for the necessary parameters to execute the ListDomains service method on
 *           AmazonSimpleDB.
 *
 * @return The response from the ListDomains service method, as returned by AmazonSimpleDB.
 *
 * @exception SimpleDBInvalidParameterValueException For more information see <SimpleDBInvalidParameterValueException>
 * @exception SimpleDBInvalidNextTokenException For more information see <SimpleDBInvalidNextTokenException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBListDomainsRequest
 * @see SimpleDBListDomainsResponse
 */
-(SimpleDBListDomainsResponse *)listDomains:(SimpleDBListDomainsRequest *)listDomainsRequest;


/**
 * <p>
 * Returns all of the attributes associated with the specified item. Optionally, the attributes returned can be limited to
 * one or more attributes by specifying an attribute name parameter.
 * </p>
 * <p>
 * If the item does not exist on the replica that was accessed for this operation, an empty set is returned. The system
 * does not return an error as it cannot guarantee the item does not exist on other replicas.
 * </p>
 * <p>
 * <b>NOTE:</b> If GetAttributes is called without being passed any attribute names, all the attributes for the item are
 * returned.
 * </p>
 *
 * @param getAttributesRequest Container for the necessary parameters to execute the GetAttributes service method on
 *           AmazonSimpleDB.
 *
 * @return The response from the GetAttributes service method, as returned by AmazonSimpleDB.
 *
 * @exception SimpleDBInvalidParameterValueException For more information see <SimpleDBInvalidParameterValueException>
 * @exception SimpleDBNoSuchDomainException For more information see <SimpleDBNoSuchDomainException>
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBGetAttributesRequest
 * @see SimpleDBGetAttributesResponse
 */
-(SimpleDBGetAttributesResponse *)getAttributes:(SimpleDBGetAttributesRequest *)getAttributesRequest;


/**
 * <p>
 * The BatchPutAttributes operation creates or replaces attributes within one or more items. By using this operation, the
 * client can perform multiple PutAttribute operation with a single call. This helps yield savings in round trips and
 * latencies, enabling Amazon SimpleDB to optimize requests and generally produce better throughput.
 * </p>
 * <p>
 * The client may specify the item name with the Item.X.ItemName parameter. The client may specify new attributes using a
 * combination of the Item.X.Attribute.Y.Name and Item.X.Attribute.Y.Value parameters. The client may specify the first
 * attribute for the first item using the parameters Item.0.Attribute.0.Name and Item.0.Attribute.0.Value ,
 * and for the second attribute for the first item by the parameters Item.0.Attribute.1.Name and Item.0.Attribute.1.Value
 * ,
 * and so on.
 * </p>
 * <p>
 * Attributes are uniquely identified within an item by their name/value combination. For example, a single item can have
 * the attributes { "first_name", "first_value" } and { "first_name", "second_value" } .
 * However, it cannot have two attribute instances where both the Item.X.Attribute.Y.Name and Item.X.Attribute.Y.Value
 * are the same.
 * </p>
 * <p>
 * Optionally, the requester can supply the Replace parameter for each individual value. Setting this value to true will
 * cause the new attribute values to replace the existing attribute values. For example, if an item I has the attributes {
 * 'a', '1' }, { 'b', '2'} and { 'b', '3' } and the requester does a BatchPutAttributes of {'I', 'b', '4' } with the
 * Replace parameter set to true, the final attributes of the item will be { 'a', '1' } and { 'b', '4' } ,
 * replacing the previous values of the 'b' attribute with the new value.
 * </p>
 * <p>
 * <b>NOTE:</b> You cannot specify an empty string as an item or as an attribute name. The BatchPutAttributes operation
 * succeeds or fails in its entirety. There are no partial puts.
 * </p>
 * <p>
 * <b>IMPORTANT:</b> This operation is vulnerable to exceeding the maximum URL size when making a REST request using the
 * HTTP GET method. This operation does not support conditions using Expected.X.Name, Expected.X.Value, or
 * Expected.X.Exists.
 * </p>
 * <p>
 * You can execute multiple BatchPutAttributes operations and other operations in parallel. However, large numbers of
 * concurrent BatchPutAttributes calls can result in Service Unavailable (503) responses.
 * </p>
 * <p>
 * The following limitations are enforced for this operation:
 * <ul>
 * <li>256 attribute name-value pairs per item</li>
 * <li>1 MB request size</li>
 * <li>1 billion attributes per domain</li>
 * <li>10 GB of total user data storage per domain</li>
 * <li>25 item limit per BatchPutAttributes operation</li>
 *
 * </ul>
 *
 * </p>
 *
 * @param batchPutAttributesRequest Container for the necessary parameters to execute the BatchPutAttributes service method
 *           on AmazonSimpleDB.
 *
 * @exception SimpleDBDuplicateItemNameException For more information see <SimpleDBDuplicateItemNameException>
 * @exception SimpleDBInvalidParameterValueException For more information see <SimpleDBInvalidParameterValueException>
 * @exception SimpleDBNumberDomainBytesExceededException For more information see <SimpleDBNumberDomainBytesExceededException>
 * @exception SimpleDBNumberSubmittedItemsExceededException For more information see <SimpleDBNumberSubmittedItemsExceededException>
 * @exception SimpleDBNumberSubmittedAttributesExceededException For more information see <SimpleDBNumberSubmittedAttributesExceededException>
 * @exception SimpleDBNumberDomainAttributesExceededException For more information see <SimpleDBNumberDomainAttributesExceededException>
 * @exception SimpleDBNoSuchDomainException For more information see <SimpleDBNoSuchDomainException>
 * @exception SimpleDBNumberItemAttributesExceededException For more information see <SimpleDBNumberItemAttributesExceededException>
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBBatchPutAttributesRequest
 * @see SimpleDBBatchPutAttributesResponse
 */
-(SimpleDBBatchPutAttributesResponse *)batchPutAttributes:(SimpleDBBatchPutAttributesRequest *)batchPutAttributesRequest;


/**
 * <p>
 * Returns information about the domain, including when the domain was created, the number of items and attributes in the
 * domain, and the size of the attribute names and values.
 * </p>
 *
 * @param domainMetadataRequest Container for the necessary parameters to execute the DomainMetadata service method on
 *           AmazonSimpleDB.
 *
 * @return The response from the DomainMetadata service method, as returned by AmazonSimpleDB.
 *
 * @exception SimpleDBNoSuchDomainException For more information see <SimpleDBNoSuchDomainException>
 * @exception SimpleDBMissingParameterException For more information see <SimpleDBMissingParameterException>
 *
 * @exception AmazonClientException If any internal errors are encountered inside the client while
 * attempting to make the request or handle the response.  For example
 * if a network connection is not available.  For more information see <AmazonClientException>.
 * @exception AmazonServiceException If an error response is returned by AmazonSimpleDB indicating
 * either a problem with the data in the request, or a server side issue.  For more information see <AmazonServiceException>.
 *
 * @see SimpleDBDomainMetadataRequest
 * @see SimpleDBDomainMetadataResponse
 */
-(SimpleDBDomainMetadataResponse *)domainMetadata:(SimpleDBDomainMetadataRequest *)domainMetadataRequest;



@end

