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

#import "DynamoDBWriteRequestUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"
#import "DynamoDBPutRequestUnmarshaller.h"
#import "DynamoDBDeleteRequestUnmarshaller.h"


@implementation DynamoDBWriteRequestUnmarshaller


+(DynamoDBWriteRequest *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBWriteRequest *writeRequest = [[[DynamoDBWriteRequest alloc] init] autorelease];



    if ([jsonObject valueForKey:@"PutRequest"] != nil) {
        writeRequest.putRequest = [DynamoDBPutRequestUnmarshaller unmarshall:[jsonObject valueForKey:@"PutRequest"]];
    }


    if ([jsonObject valueForKey:@"DeleteRequest"] != nil) {
        writeRequest.deleteRequest = [DynamoDBDeleteRequestUnmarshaller unmarshall:[jsonObject valueForKey:@"DeleteRequest"]];
    }

    return writeRequest;
}

@end
