/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

-(id)initWithAccessKey:(NSString *)theAccessKey withSecretKey:(NSString *)theSecretKey
{
    if (self = [super initWithAccessKey:theAccessKey withSecretKey:theSecretKey]) {
        self.endpoint = @"https://sdb.amazonaws.com";
    }
    return self;
}

-(SimpleDBSelectResponse *)select:(SimpleDBSelectRequest *)selectRequest
{
    AmazonServiceRequest *request = [SimpleDBSelectRequestMarshaller createRequest:selectRequest];

    return (SimpleDBSelectResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBSelectResponseUnmarshaller class]];
}

-(SimpleDBPutAttributesResponse *)putAttributes:(SimpleDBPutAttributesRequest *)putAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBPutAttributesRequestMarshaller createRequest:putAttributesRequest];

    return (SimpleDBPutAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBPutAttributesResponseUnmarshaller class]];
}

-(SimpleDBBatchDeleteAttributesResponse *)batchDeleteAttributes:(SimpleDBBatchDeleteAttributesRequest *)batchDeleteAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBBatchDeleteAttributesRequestMarshaller createRequest:batchDeleteAttributesRequest];

    return (SimpleDBBatchDeleteAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBBatchDeleteAttributesResponseUnmarshaller class]];
}

-(SimpleDBDeleteDomainResponse *)deleteDomain:(SimpleDBDeleteDomainRequest *)deleteDomainRequest
{
    AmazonServiceRequest *request = [SimpleDBDeleteDomainRequestMarshaller createRequest:deleteDomainRequest];

    return (SimpleDBDeleteDomainResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBDeleteDomainResponseUnmarshaller class]];
}

-(SimpleDBCreateDomainResponse *)createDomain:(SimpleDBCreateDomainRequest *)createDomainRequest
{
    AmazonServiceRequest *request = [SimpleDBCreateDomainRequestMarshaller createRequest:createDomainRequest];

    return (SimpleDBCreateDomainResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBCreateDomainResponseUnmarshaller class]];
}

-(SimpleDBDeleteAttributesResponse *)deleteAttributes:(SimpleDBDeleteAttributesRequest *)deleteAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBDeleteAttributesRequestMarshaller createRequest:deleteAttributesRequest];

    return (SimpleDBDeleteAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBDeleteAttributesResponseUnmarshaller class]];
}

-(SimpleDBListDomainsResponse *)listDomains:(SimpleDBListDomainsRequest *)listDomainsRequest
{
    AmazonServiceRequest *request = [SimpleDBListDomainsRequestMarshaller createRequest:listDomainsRequest];

    return (SimpleDBListDomainsResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBListDomainsResponseUnmarshaller class]];
}

-(SimpleDBGetAttributesResponse *)getAttributes:(SimpleDBGetAttributesRequest *)getAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBGetAttributesRequestMarshaller createRequest:getAttributesRequest];

    return (SimpleDBGetAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBGetAttributesResponseUnmarshaller class]];
}

-(SimpleDBBatchPutAttributesResponse *)batchPutAttributes:(SimpleDBBatchPutAttributesRequest *)batchPutAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBBatchPutAttributesRequestMarshaller createRequest:batchPutAttributesRequest];

    return (SimpleDBBatchPutAttributesResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBBatchPutAttributesResponseUnmarshaller class]];
}

-(SimpleDBDomainMetadataResponse *)domainMetadata:(SimpleDBDomainMetadataRequest *)domainMetadataRequest
{
    AmazonServiceRequest *request = [SimpleDBDomainMetadataRequestMarshaller createRequest:domainMetadataRequest];

    return (SimpleDBDomainMetadataResponse *)[self parseResponse:[self invoke:request] withDelegateType:[SimpleDBDomainMetadataResponseUnmarshaller class]];
}



@end

