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


#import "DynamoDBListTablesRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBListTablesRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBListTablesRequest *)listTablesRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[listTablesRequest delegate]];
    [request setCredentials:[listTablesRequest credentials]];
    [request setEndpoint:[listTablesRequest requestEndpoint]];
    [request setRequestTag:[listTablesRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.ListTables" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (listTablesRequest.exclusiveStartTableName != nil) {
        [json setValue:listTablesRequest.exclusiveStartTableName forKey:@"ExclusiveStartTableName"];
    }

    if (listTablesRequest.limit != nil) {
        [json setValue:listTablesRequest.limit forKey:@"Limit"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

