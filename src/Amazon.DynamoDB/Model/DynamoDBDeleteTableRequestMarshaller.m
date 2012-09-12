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


#import "DynamoDBDeleteTableRequestMarshaller.h"
#import "AmazonJSON.h"
#import "../AmazonSDKUtil.h"

@implementation DynamoDBDeleteTableRequestMarshaller

+(AmazonServiceRequest *)createRequest:(DynamoDBDeleteTableRequest *)deleteTableRequest
{
    DynamoDBRequest *request = [[DynamoDBRequest alloc] init];

    [request setDelegate:[deleteTableRequest delegate]];
    [request setCredentials:[deleteTableRequest credentials]];
    [request setEndpoint:[deleteTableRequest requestEndpoint]];
    [request setRequestTag:[deleteTableRequest requestTag]];


    [request addValue:@"DynamoDB_20111205.DeleteTable" forHeader:@"X-Amz-Target"];
    [request addValue:@"application/x-amz-json-1.0"     forHeader:@"Content-Type"];


    NSMutableDictionary *json = [[[NSMutableDictionary alloc] init] autorelease];

    if (deleteTableRequest.tableName != nil) {
        [json setValue:deleteTableRequest.tableName forKey:@"TableName"];
    }



    request.content = [AmazonJSON JSONRepresentation:json];
    [request addValue:[NSString stringWithFormat:@"%d", [[request.content dataUsingEncoding:NSUTF8StringEncoding] length]]    forHeader:@"Content-Length"];

    return [request autorelease];
}

@end

