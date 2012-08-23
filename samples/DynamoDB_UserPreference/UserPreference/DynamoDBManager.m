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

#import "DynamoDBManager.h"

#import <AWSiOSSDK/DynamoDB/DynamoDBCreateTableRequest.h>
#import <AWSiOSSDK/DynamoDB/DynamoDBKeySchema.h>
#import <AWSiOSSDK/DynamoDB/DynamoDBKeySchemaElement.h>
#import "AmazonClientManager.h"

@implementation DynamoDBManager

/*
 * Creates a table with the following attributes:
 *
 * Table name: TEST_TABLE_NAME
 * Hash key: userNo type N
 * Read Capacity Units: 10
 * Write Capacity Units: 5
 */
+(void)createTable
{
    DynamoDBKeySchemaElement      *kse = [[[DynamoDBKeySchemaElement alloc] initWithAttributeName:@"userNo" andAttributeType:@"N"] autorelease];
    
    DynamoDBKeySchema             *ks = [[[DynamoDBKeySchema alloc] initWithHashKeyElement:kse] autorelease];
    
    DynamoDBProvisionedThroughput *pt = [[[DynamoDBProvisionedThroughput alloc] init] autorelease];
    pt.readCapacityUnits  = [NSNumber numberWithInt:10];
    pt.writeCapacityUnits = [NSNumber numberWithInt:5];
    
    DynamoDBCreateTableRequest *request = [[[DynamoDBCreateTableRequest alloc] initWithTableName:TEST_TABLE_NAME andKeySchema:ks andProvisionedThroughput:pt] autorelease];
    DynamoDBCreateTableResponse *response = [[AmazonClientManager ddb] createTable:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
    }
}

/*
 * Retrieves the table description and returns the table status as a string.
 */
+(NSString *)getTestTableStatus
{
    DynamoDBDescribeTableRequest  *request  = [[[DynamoDBDescribeTableRequest alloc] initWithTableName:TEST_TABLE_NAME] autorelease];
    DynamoDBDescribeTableResponse *response = [[AmazonClientManager ddb] describeTable:request];
    if(response.error != nil)
    {
        if([[response.error.userInfo objectForKey:@"exception"] isKindOfClass:[DynamoDBResourceNotFoundException class]])
        {
            return nil;
        }
        
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
        
        return nil;
    }
    
    return response.table.tableStatus;
}

/*
 * Inserts ten users with userNo from 1 to 10 and random names.
 */
+(void)insertUsers
{
    for (int i = 1; i <= 10; i++)
    {
        NSMutableDictionary *userDic =
        [NSDictionary dictionaryWithObjectsAndKeys:
         [[[DynamoDBAttributeValue alloc] initWithN:[NSString stringWithFormat:@"%d", i]] autorelease], @"userNo",
         [[[DynamoDBAttributeValue alloc] initWithS:[Constants getRandomName]] autorelease], @"firstName",
         [[[DynamoDBAttributeValue alloc] initWithS:[Constants getRandomName]] autorelease], @"lastName",
         nil];
        
        DynamoDBPutItemRequest *request = [[[DynamoDBPutItemRequest alloc] initWithTableName:TEST_TABLE_NAME andItem:userDic] autorelease];
        DynamoDBPutItemResponse *response = [[AmazonClientManager ddb] putItem:request];
        if(response.error != nil)
        {
            [AmazonClientManager wipeCredentialsOnAuthError:response.error];
            NSLog(@"Error: %@", response.error);
            
            break;
        }
    }
}

/*
 * Scans the table and returns the list of users.
 */
+(NSMutableArray *)getUserList
{
    DynamoDBScanRequest  *request  = [[[DynamoDBScanRequest alloc] initWithTableName:TEST_TABLE_NAME] autorelease];
    DynamoDBScanResponse *response = [[AmazonClientManager ddb] scan:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
        
        return nil;
    }
    
    return response.items;
}

/*
 * Retrieves all of the attribute/value pairs for the specified user.
 */
+(NSMutableDictionary *)getUserInfo:(int)userNo
{
    DynamoDBGetItemRequest *request = [[[DynamoDBGetItemRequest alloc] initWithTableName:TEST_TABLE_NAME
                                                                                  andKey:[[[DynamoDBKey alloc] initWithHashKeyElement:
                                                                                           [[[DynamoDBAttributeValue alloc] initWithN:[NSString stringWithFormat:@"%d", userNo]] autorelease]] autorelease]] autorelease];
    DynamoDBGetItemResponse *response = [[AmazonClientManager ddb] getItem:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
        
        return nil;
    }
    
    return response.item;
}

/*
 * Updates one attribute/value pair for the specified user.
 */
+(void)updateAttributeStringValue:(NSString *)aValue forKey:(NSString *)aKey withPrimaryKey:(DynamoDBAttributeValue *)aPrimaryKey
{
    DynamoDBAttributeValue       *attr       = [[[DynamoDBAttributeValue alloc] initWithS:aValue] autorelease];
    DynamoDBAttributeValueUpdate *attrUpdate = [[[DynamoDBAttributeValueUpdate alloc] initWithValue:attr andAction:@"PUT"] autorelease];
    
    DynamoDBUpdateItemRequest    *request = [[[DynamoDBUpdateItemRequest alloc] initWithTableName:TEST_TABLE_NAME
                                                                                           andKey:[[[DynamoDBKey alloc] initWithHashKeyElement:aPrimaryKey] autorelease]
                                                                              andAttributeUpdates:[NSMutableDictionary dictionaryWithObject:attrUpdate forKey:aKey]] autorelease];
    DynamoDBUpdateItemResponse *response = [[AmazonClientManager ddb] updateItem:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
    }
}

/*
 * Deletes the specified user and all of its attribute/value pairs.
 */
+(void)deleteUser:(DynamoDBAttributeValue *)aPrimaryKey
{
    DynamoDBDeleteItemRequest *request = [[[DynamoDBDeleteItemRequest alloc] initWithTableName:TEST_TABLE_NAME andKey:[[[DynamoDBKey alloc] initWithHashKeyElement:aPrimaryKey] autorelease]] autorelease];
    
    DynamoDBDeleteItemResponse *response = [[AmazonClientManager ddb] deleteItem:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
    }
}

/*
 * Deletes the test table and all of its users and their attribute/value pairs.
 */
+(void)cleanUp
{
    DynamoDBDeleteTableRequest *request = [[[DynamoDBDeleteTableRequest alloc] initWithTableName:TEST_TABLE_NAME] autorelease];
    DynamoDBDeleteTableResponse *response = [[AmazonClientManager ddb] deleteTable:request];
    if(response.error != nil)
    {
        [AmazonClientManager wipeCredentialsOnAuthError:response.error];
        NSLog(@"Error: %@", response.error);
    }
}

@end
