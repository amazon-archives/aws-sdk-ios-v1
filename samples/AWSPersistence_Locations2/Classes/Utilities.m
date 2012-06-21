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

#import "Utilities.h"

@implementation Utilities

/**
 * Wait for a table to transition to a given state (i.e. ACTIVE)
 */
+(void)waitForTable:(NSString *)tableName toTransitionToStatus:(NSString *)toStatus
{
    NSString *status =@"";
    
    do {
        if (status.length > 0) {
            [NSThread sleepForTimeInterval:15];
        }
        DynamoDBDescribeTableRequest *request = [[DynamoDBDescribeTableRequest alloc] initWithTableName:tableName];
        DynamoDBDescribeTableResponse *response = [[AmazonClientManager ddb] describeTable:request];
        
        status = response.table.tableStatus;
        
    } while (![status isEqualToString:toStatus]);
}

/**
 * Check for existance of tables and create them if necessary
 * Returns YES when tables are active
 * Returns NO if there was an error
 */
+(BOOL)setupTables 
{
    // verify that TVM has been updated
    if ([TOKEN_VENDING_MACHINE_URL isEqualToString:@"CHANGEME.elasticbeanstalk.com"] || ([AmazonClientManager ddb] == nil) ) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Credentials" message:CREDENTIALS_ALERT_MESSAGE delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
    @try {
        //Create Table
        DynamoDBKeySchemaElement *hashKey = [[DynamoDBKeySchemaElement alloc] init];
        hashKey.attributeName = LOCATIONS_KEY;
        hashKey.attributeType = @"S";
        
        DynamoDBKeySchema *keySchema = [[DynamoDBKeySchema alloc] init];
        keySchema.hashKeyElement  = hashKey;
        
        DynamoDBProvisionedThroughput *provisionedThroughput = [[DynamoDBProvisionedThroughput alloc] init];
        provisionedThroughput.readCapacityUnits  = [NSNumber numberWithInt:10];
        provisionedThroughput.writeCapacityUnits = [NSNumber numberWithInt:5];
        
        DynamoDBCreateTableRequest *ctr = [[DynamoDBCreateTableRequest alloc] init];
        ctr.tableName             = LOCATIONS_TABLE;
        ctr.keySchema             = keySchema;
        ctr.provisionedThroughput = provisionedThroughput;
        
        DynamoDBCreateTableResponse *ctResponse = [[AmazonClientManager ddb] createTable:ctr];
        NSLog(@"Created %@", ctResponse.tableDescription.tableName);
    }
    @catch (DynamoDBResourceInUseException *re) {
        NSLog(@"Table already created");
    }
    @catch (AmazonServiceException *e) {
        NSLog(@"Problem creating table, %@", e);
        return NO;
    }
    
    @try {
        //Create Table
        DynamoDBKeySchemaElement *hashKey = [[DynamoDBKeySchemaElement alloc] init];
        hashKey.attributeName = CHECKINS_KEY;
        hashKey.attributeType = @"S";
        
        DynamoDBKeySchema *keySchema = [[DynamoDBKeySchema alloc] init];
        keySchema.hashKeyElement  = hashKey;
        
        DynamoDBProvisionedThroughput *provisionedThroughput = [[DynamoDBProvisionedThroughput alloc] init];
        provisionedThroughput.readCapacityUnits  = [NSNumber numberWithInt:10];
        provisionedThroughput.writeCapacityUnits = [NSNumber numberWithInt:5];
        
        DynamoDBCreateTableRequest *ctr = [[DynamoDBCreateTableRequest alloc] init];
        ctr.tableName             = CHECKINS_TABLE;
        ctr.keySchema             = keySchema;
        ctr.provisionedThroughput = provisionedThroughput;
        
        DynamoDBCreateTableResponse *ctResponse = [[AmazonClientManager ddb] createTable:ctr];
        NSLog(@"Created %@", ctResponse.tableDescription.tableName);
    }
    @catch (DynamoDBResourceInUseException *re) {
        NSLog(@"Table already created");
    }
    @catch (AmazonServiceException *e) {
        NSLog(@"Problem creating table, %@", e);
        return NO;
    }
        
    [Utilities waitForTable:LOCATIONS_TABLE toTransitionToStatus:@"ACTIVE"];
    [Utilities waitForTable:CHECKINS_TABLE toTransitionToStatus:@"ACTIVE"];
        
    return YES;
}

/**
 * Generate a unique ID that can be used for objects
 */
+(NSString *)getUUID
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    
    return uuidString;
}

@end
