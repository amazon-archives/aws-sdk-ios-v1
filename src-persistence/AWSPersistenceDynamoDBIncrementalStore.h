/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import <CoreData/CoreData.h>
#import <AWSRuntime/AWSRuntime.h>

extern NSString *const AWSPersistenceDynamoDBIncrementalStoreType;
extern NSString *const AWSPersistenceDynamoDBHashKey;
extern NSString *const AWSPersistenceDynamoDBVersionKey;
extern NSString *const AWSPersistenceDynamoDBDelegate;
extern NSString *const AWSPersistenceDynamoDBTableMapper;
extern NSString *const AWSPersistenceDynamoDBClient;

extern NSString *const AWSPersistenceDynamoDBServiceErrorDomain;
extern NSString *const AWSPersistenceDynamoDBClientErrorDomain;

extern NSString *const AWSPersistenceDynamoDBObjectDeletedNotification;
extern NSString *const AWSPersistenceDynamoDBObjectDeletedNotificationHashKey;
extern NSString *const AWSPersistenceDynamoDBObjectDeletedNotificationEntityName;
extern NSString *const AWSPersistenceDynamoDBObjectDeletedNotificationObjectID;

@interface AWSPersistenceDynamoDBIncrementalStore : NSIncrementalStore
{
    NSMutableDictionary *objectIdToHashKey;
    id<AmazonCredentialsProvider> delegate;
    
    NSNumberFormatter *nf;
}

@property (assign) int initialBackoffTimeInSecond;
@property (assign) int retryCount;

@end
