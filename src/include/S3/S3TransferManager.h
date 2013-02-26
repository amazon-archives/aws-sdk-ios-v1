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

#import <Foundation/Foundation.h>
#import "AmazonS3Client.h"
#import "../AmazonCredentials.h"
#import "../AmazonServiceRequest.h"

@interface S3TransferManager : NSObject <AmazonServiceRequestDelegate>
{
}

@property (nonatomic, assign) id<AmazonServiceRequestDelegate> delegate;

@property (nonatomic, copy) AmazonS3Client *s3;

/* S3TransferManager configuration options */
// The minimum part size for upload parts.
@property (nonatomic, assign) NSUInteger minimumUploadPartSize;
// The size threshold in bytes for when to use multipart uploads.
@property (nonatomic, assign) NSUInteger multipartUploadThreshold;

@property (nonatomic, assign) BOOL noSyncMethodsOnMainThread;

@property (nonatomic, readonly, assign) NSOperationQueue *operationQueue;

/* Synchronous upload methods */
- (AmazonServiceResponse *)synchronouslyUpload:(S3PutObjectRequest *)putObjectRequest;
- (AmazonServiceResponse *)synchronouslyUploadData:(NSData *)data bucket:(NSString *)bucket key:(NSString *)key;
- (AmazonServiceResponse *)synchronouslyUploadFile:(NSString *)filename bucket:(NSString *)bucket key:(NSString *)key;
- (AmazonServiceResponse *)synchronouslyUploadStream:(NSInputStream *)stream contentLength:(int64_t)contentLength bucket:(NSString *)bucket key:(NSString *)key;

/* Asynchronous upload methods */
- (void)upload:(S3PutObjectRequest *)putObjectRequest;
- (void)uploadData:(NSData *)data bucket:(NSString *)bucket key:(NSString *)key;
- (void)uploadFile:(NSString *)filename bucket:(NSString *)bucket key:(NSString *)key;
- (void)uploadStream:(NSInputStream *)stream contentLength:(long)contentLength bucket:(NSString *)bucket key:(NSString *)key;

- (void)abortMultipartUploads:(NSString *)bucket initiatedBefore:(NSDate *)date;
- (void)abortMultipartUploads:(NSString *)bucket forKey:(NSString *)key;

@end
