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

#import <Foundation/Foundation.h>
#import "AmazonS3Client.h"

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequest.h>
#else
#import "../AmazonServiceRequest.h"
#endif

/**
 * S3TransferManager is an easy-to-use, high level component that is designed to efficiently upload many large files to Amazon S3.
 *
 * Underneath, it uses NSOperationQueue to handle multiple uploads efficiently, and automatically choose the right upload mode: multi-part uploads for large files, and put requests for small files.
 */
@interface S3TransferManager : NSObject
{
}

#pragma mark - S3TransferManager properties

/*
 * The default AmazonServiceRequestDelegate delegate.
 *
 * Asynchronous operations use this delegate for AmazonServiceRequestDelegate callbacks. Once assigned, it is not recommended to reassigned this property. You can overwrite this default by specifying the delegate property of a S3PutObject request.
 */
@property (nonatomic, assign) id<AmazonServiceRequestDelegate> delegate;

/*
 * The AmazonS3Client object used internally.
 *
 * AmazonCredentialProvider of this AmazonS3Client should be able to provide valid credentials throughout the lifespan of S3TransferManager. Once assigned, it is not recommended to reassigned this property.
 */
@property (nonatomic, copy) AmazonS3Client *s3;

/**
 * The minimum part size for upload parts.
 */
@property (nonatomic, assign) NSUInteger minimumUploadPartSize;

/**
 * The size threshold in bytes for when to use multipart uploads.
 */
@property (nonatomic, assign) NSUInteger multipartUploadThreshold;

/**
 * Controls if the synchronous upload methods can be invoked on the main thread.
 *
 * When set YES, invoking a synchronous upload method on the main thread causes AmazonClientException.
 * The default value is YES.
 */
@property (nonatomic, assign) BOOL noSyncMethodsOnMainThread;

/**
 * The static NSOperationQueue used internally.
 *
 * All upload requests are queued in this NSOperationQueue before dispatched. You can update properties of this queue to adjust the queueing and dispatching behaviors, but it is not recommended to call action methods on this queue. Do not manually enqueue any operations; doing so may cause unpredicted behaviors. The default value of maxConcurrentOperationCount is 3. Do not set maxConcurrentOperationCount too high; in our test, setting it above the default may result in unreliable progress feedback on iOS 5 and above.
 */
@property (nonatomic, readonly, assign) NSOperationQueue *operationQueue;

#pragma mark - Synchronous upload methods
/** Synchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param putObjectRequest A S3PutObjectRequest object that defines the parameters of the request.
 * @return An AmazonServiceResponse from S3.
 * @see S3PutObjectRequest
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyUpload:(S3PutObjectRequest *)putObjectRequest;

/** Synchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param data A NSData object to upload.
 * @param bucket A bucket name.
 * @param key A key name.
 * @return An AmazonServiceResponse from S3.
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyUploadData:(NSData *)data bucket:(NSString *)bucket key:(NSString *)key;

/** Synchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param filename A filepath to a file to upload.
 * @param bucket A bucket name.
 * @param key A key name.
 * @return An AmazonServiceResponse from S3.
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyUploadFile:(NSString *)filename bucket:(NSString *)bucket key:(NSString *)key;

/** Synchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param stream An NSInputStream object.
 * @param bucket A bucket name.
 * @param key A key name.
 * @return An AmazonServiceResponse from S3.
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyUploadStream:(NSInputStream *)stream contentLength:(int64_t)contentLength bucket:(NSString *)bucket key:(NSString *)key;

#pragma mark - Asynchronous upload methods
/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads. Set the delegate property of S3PutObjectRequest in order to overwrite the delegate for callbacks.
 *
 * @param putObjectRequest A S3PutObjectRequest object that defines the parameters of the request.
 * @see S3PutObjectRequest
 * @see AmazonServiceRequestDelegate
 */
- (void)upload:(S3PutObjectRequest *)putObjectRequest;

/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param data A NSData object to upload.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 */
- (void)uploadData:(NSData *)data bucket:(NSString *)bucket key:(NSString *)key;

/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param filename A filepath to a file to upload.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 */
- (void)uploadFile:(NSString *)filename bucket:(NSString *)bucket key:(NSString *)key;

/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param stream An NSInputStream object.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 */
- (void)uploadStream:(NSInputStream *)stream contentLength:(long)contentLength bucket:(NSString *)bucket key:(NSString *)key;

#pragma mark - Abort multipart upload methods
/** Asynchronously aborts pending multipart uploads initiated a specified date for a specified bucket.
 *
 * @param bucket A bucket name.
 * @param date Pending mutipart uploads initiated before this date will be aborted.
 * @see AmazonServiceRequestDelegate
 */
- (void)abortMultipartUploads:(NSString *)bucket initiatedBefore:(NSDate *)date;

/** Asynchronously aborts pending multipart uploads for a specified bucket and key.
 *
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 */
- (void)abortMultipartUploads:(NSString *)bucket forKey:(NSString *)key;

@end
