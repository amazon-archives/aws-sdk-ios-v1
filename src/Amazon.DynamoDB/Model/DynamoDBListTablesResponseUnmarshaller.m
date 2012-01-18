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

#import "DynamoDBListTablesResponseUnmarshaller.h"
#import "DynamoDBExceptionUnmarshaller.h"
#import "../AmazonSDKUtil.h"


@implementation DynamoDBListTablesResponseUnmarshaller


+(DynamoDBListTablesResponse *)unmarshall:(NSDictionary *)jsonObject
{
    DynamoDBListTablesResponse *listTablesResult = [[[DynamoDBListTablesResponse alloc] init] autorelease];


    if ([jsonObject valueForKey:@"__type"] != nil) {
        [listTablesResult setException:[DynamoDBExceptionUnmarshaller unmarshall:jsonObject]];
    }
    else {
        NSArray *tableNamesArray = [jsonObject valueForKey:@"TableNames"];
        for (NSString *memberObject in tableNamesArray) {
            [listTablesResult.tableNames addObject:memberObject];
        }


        if ([jsonObject valueForKey:@"LastEvaluatedTableName"] != nil) {
            listTablesResult.lastEvaluatedTableName = [jsonObject valueForKey:@"LastEvaluatedTableName"];
        }
    }

    return listTablesResult;
}

@end
