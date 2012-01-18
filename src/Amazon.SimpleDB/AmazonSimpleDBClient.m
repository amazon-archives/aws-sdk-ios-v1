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

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [super initWithCredentials:theCredentials]) {
        self.endpoint = @"https://sdb.amazonaws.com";
    }
    return self;
}

-(SimpleDBSelectResponse *)select:(SimpleDBSelectRequest *)selectRequest
{
    AmazonServiceRequest *request = [SimpleDBSelectRequestMarshaller createRequest:selectRequest];

    return (SimpleDBSelectResponse *)[self invoke:request rawRequest:selectRequest unmarshallerDelegate:[SimpleDBSelectResponseUnmarshaller class]];
}

-(SimpleDBPutAttributesResponse *)putAttributes:(SimpleDBPutAttributesRequest *)putAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBPutAttributesRequestMarshaller createRequest:putAttributesRequest];

    return (SimpleDBPutAttributesResponse *)[self invoke:request rawRequest:putAttributesRequest unmarshallerDelegate:[SimpleDBPutAttributesResponseUnmarshaller class]];
}

-(SimpleDBBatchDeleteAttributesResponse *)batchDeleteAttributes:(SimpleDBBatchDeleteAttributesRequest *)batchDeleteAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBBatchDeleteAttributesRequestMarshaller createRequest:batchDeleteAttributesRequest];

    return (SimpleDBBatchDeleteAttributesResponse *)[self invoke:request rawRequest:batchDeleteAttributesRequest unmarshallerDelegate:[SimpleDBBatchDeleteAttributesResponseUnmarshaller class]];
}

-(SimpleDBDeleteDomainResponse *)deleteDomain:(SimpleDBDeleteDomainRequest *)deleteDomainRequest
{
    AmazonServiceRequest *request = [SimpleDBDeleteDomainRequestMarshaller createRequest:deleteDomainRequest];

    return (SimpleDBDeleteDomainResponse *)[self invoke:request rawRequest:deleteDomainRequest unmarshallerDelegate:[SimpleDBDeleteDomainResponseUnmarshaller class]];
}

-(SimpleDBCreateDomainResponse *)createDomain:(SimpleDBCreateDomainRequest *)createDomainRequest
{
    AmazonServiceRequest *request = [SimpleDBCreateDomainRequestMarshaller createRequest:createDomainRequest];

    return (SimpleDBCreateDomainResponse *)[self invoke:request rawRequest:createDomainRequest unmarshallerDelegate:[SimpleDBCreateDomainResponseUnmarshaller class]];
}

-(SimpleDBDeleteAttributesResponse *)deleteAttributes:(SimpleDBDeleteAttributesRequest *)deleteAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBDeleteAttributesRequestMarshaller createRequest:deleteAttributesRequest];

    return (SimpleDBDeleteAttributesResponse *)[self invoke:request rawRequest:deleteAttributesRequest unmarshallerDelegate:[SimpleDBDeleteAttributesResponseUnmarshaller class]];
}

-(SimpleDBListDomainsResponse *)listDomains:(SimpleDBListDomainsRequest *)listDomainsRequest
{
    AmazonServiceRequest *request = [SimpleDBListDomainsRequestMarshaller createRequest:listDomainsRequest];

    return (SimpleDBListDomainsResponse *)[self invoke:request rawRequest:listDomainsRequest unmarshallerDelegate:[SimpleDBListDomainsResponseUnmarshaller class]];
}

-(SimpleDBGetAttributesResponse *)getAttributes:(SimpleDBGetAttributesRequest *)getAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBGetAttributesRequestMarshaller createRequest:getAttributesRequest];

    return (SimpleDBGetAttributesResponse *)[self invoke:request rawRequest:getAttributesRequest unmarshallerDelegate:[SimpleDBGetAttributesResponseUnmarshaller class]];
}

-(SimpleDBBatchPutAttributesResponse *)batchPutAttributes:(SimpleDBBatchPutAttributesRequest *)batchPutAttributesRequest
{
    AmazonServiceRequest *request = [SimpleDBBatchPutAttributesRequestMarshaller createRequest:batchPutAttributesRequest];

    return (SimpleDBBatchPutAttributesResponse *)[self invoke:request rawRequest:batchPutAttributesRequest unmarshallerDelegate:[SimpleDBBatchPutAttributesResponseUnmarshaller class]];
}

-(SimpleDBDomainMetadataResponse *)domainMetadata:(SimpleDBDomainMetadataRequest *)domainMetadataRequest
{
    AmazonServiceRequest *request = [SimpleDBDomainMetadataRequestMarshaller createRequest:domainMetadataRequest];

    return (SimpleDBDomainMetadataResponse *)[self invoke:request rawRequest:domainMetadataRequest unmarshallerDelegate:[SimpleDBDomainMetadataResponseUnmarshaller class]];
}



@end

