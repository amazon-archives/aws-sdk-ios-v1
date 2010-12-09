/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AmazonSimpleDBClient.h"
#import "../AmazonServiceRequest.h"


@implementation AmazonSimpleDBClient

-(id)initWithAccessKey:(NSString*)theAccessKey withSecretKey:(NSString*)theSecretKey {
    if ( self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey] ) {
        self.endpoint = @"https://sdb.amazonaws.com";
        [AmazonSimpleDBClient initializeResponseObjects];
    }
    return self;
}

-(SimpleDBSelectResponse*)select:(SimpleDBSelectRequest*)selectRequest {                 
        AmazonServiceRequest* request = [SimpleDBSelectRequestMarshaller createRequest:selectRequest];
        return (SimpleDBSelectResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBSelectResponseUnmarshaller class]];
        }

-(SimpleDBPutAttributesResponse*)putAttributes:(SimpleDBPutAttributesRequest*)putAttributesRequest {                 
        AmazonServiceRequest* request = [SimpleDBPutAttributesRequestMarshaller createRequest:putAttributesRequest];
        return (SimpleDBPutAttributesResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBPutAttributesResponseUnmarshaller class]];
        }

-(SimpleDBBatchDeleteAttributesResponse*)batchDeleteAttributes:(SimpleDBBatchDeleteAttributesRequest*)batchDeleteAttributesRequest {                 
        AmazonServiceRequest* request = [SimpleDBBatchDeleteAttributesRequestMarshaller createRequest:batchDeleteAttributesRequest];
        return (SimpleDBBatchDeleteAttributesResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBBatchDeleteAttributesResponseUnmarshaller class]];
        }

-(SimpleDBDeleteDomainResponse*)deleteDomain:(SimpleDBDeleteDomainRequest*)deleteDomainRequest {                 
        AmazonServiceRequest* request = [SimpleDBDeleteDomainRequestMarshaller createRequest:deleteDomainRequest];
        return (SimpleDBDeleteDomainResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBDeleteDomainResponseUnmarshaller class]];
        }

-(SimpleDBCreateDomainResponse*)createDomain:(SimpleDBCreateDomainRequest*)createDomainRequest {                 
        AmazonServiceRequest* request = [SimpleDBCreateDomainRequestMarshaller createRequest:createDomainRequest];
        return (SimpleDBCreateDomainResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBCreateDomainResponseUnmarshaller class]];
        }

-(SimpleDBDeleteAttributesResponse*)deleteAttributes:(SimpleDBDeleteAttributesRequest*)deleteAttributesRequest {                 
        AmazonServiceRequest* request = [SimpleDBDeleteAttributesRequestMarshaller createRequest:deleteAttributesRequest];
        return (SimpleDBDeleteAttributesResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBDeleteAttributesResponseUnmarshaller class]];
        }

-(SimpleDBListDomainsResponse*)listDomains:(SimpleDBListDomainsRequest*)listDomainsRequest {                 
        AmazonServiceRequest* request = [SimpleDBListDomainsRequestMarshaller createRequest:listDomainsRequest];
        return (SimpleDBListDomainsResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBListDomainsResponseUnmarshaller class]];
        }

-(SimpleDBGetAttributesResponse*)getAttributes:(SimpleDBGetAttributesRequest*)getAttributesRequest {                 
        AmazonServiceRequest* request = [SimpleDBGetAttributesRequestMarshaller createRequest:getAttributesRequest];
        return (SimpleDBGetAttributesResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBGetAttributesResponseUnmarshaller class]];
        }

-(SimpleDBBatchPutAttributesResponse*)batchPutAttributes:(SimpleDBBatchPutAttributesRequest*)batchPutAttributesRequest {                 
        AmazonServiceRequest* request = [SimpleDBBatchPutAttributesRequestMarshaller createRequest:batchPutAttributesRequest];
        return (SimpleDBBatchPutAttributesResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBBatchPutAttributesResponseUnmarshaller class]];
        }

-(SimpleDBDomainMetadataResponse*)domainMetadata:(SimpleDBDomainMetadataRequest*)domainMetadataRequest {                 
        AmazonServiceRequest* request = [SimpleDBDomainMetadataRequestMarshaller createRequest:domainMetadataRequest];
        return (SimpleDBDomainMetadataResponse*)[self parseResponseBody:[[self invoke:request] body] withDelegateType:[SimpleDBDomainMetadataResponseUnmarshaller class]];
        }


+(void)initializeResponseObjects 
{
        [SimpleDBSelectResponse class];
    [SimpleDBPutAttributesResponse class];
    [SimpleDBBatchDeleteAttributesResponse class];
    [SimpleDBDeleteDomainResponse class];
    [SimpleDBCreateDomainResponse class];
    [SimpleDBDeleteAttributesResponse class];
    [SimpleDBListDomainsResponse class];
    [SimpleDBGetAttributesResponse class];
    [SimpleDBBatchPutAttributesResponse class];
    [SimpleDBDomainMetadataResponse class];

}


@end
	
	