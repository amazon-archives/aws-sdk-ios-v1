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
#import "S3TransferOperation.h"

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
 * The minimum part size for upload parts.  Must be at least 5MB.
 */
@property (nonatomic, assign) uint32_t minimumUploadPartSize;

/**
 * The size threshold in bytes for when to use multipart uploads.
 */
@property (nonatomic, assign) uint32_t multipartUploadThreshold;

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

#pragma mark - Asynchronous uploads

/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads. Set the delegate property of S3PutObjectRequest in order to overwrite the delegate for callbacks.
 * Pause and resume will only work if you specify a filePath on the request.
 *
 * @param putObjectRequest A S3PutObjectRequest object that defines the parameters of the request.
 * @see S3PutObjectRequest
 * @see AmazonServiceRequestDelegate
 *
 * @return S3TransferOperation
 */
- (S3TransferOperation *)upload:(S3PutObjectRequest *)putObjectRequest;

/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 * Pause and resume will not work with this method.
 *
 * @param data A NSData object to upload.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 *
 * @return S3TransferOperation
 */
- (S3TransferOperation *)uploadData:(NSData *)data bucket:(NSString *)bucket key:(NSString *)key;

/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 *
 * @param filename A filepath to a file to upload.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 *
 * @return S3TransferOperation
 */
- (S3TransferOperation *)uploadFile:(NSString *)filename bucket:(NSString *)bucket key:(NSString *)key;

/** Asynchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 * Pause and resume will not work with this method.
 *
 * @param stream An NSInputStream object.
 * @param contentLength content length of the stream.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 *
 * @return S3TransferOperation
 */
- (S3TransferOperation *)uploadStream:(NSInputStream *)stream contentLength:(long)contentLength bucket:(NSString *)bucket key:(NSString *)key;

#pragma mark - Synchronous uploads

/** Synchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 * Pause and resume will only work if you specify a filename on the putObjectRequest.
 *
 * @param putObjectRequest A S3PutObjectRequest object that defines the parameters of the request.
 * @return An AmazonServiceResponse from S3.
 * @see S3PutObjectRequest
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyUpload:(S3PutObjectRequest *)putObjectRequest;

/** Synchronously uploads data to Amazon S3 using either put object request or multipart uploads.
 * Pause and resume will not work with this method.
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
 * Pause and resume will not work with this method.
 *
 * @param stream An NSInputStream object.
 * @param bucket A bucket name.
 * @param key A key name.
 * @return An AmazonServiceResponse from S3.
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyUploadStream:(NSInputStream *)stream contentLength:(int64_t)contentLength bucket:(NSString *)bucket key:(NSString *)key;

#pragma mark - Asynchronous downloads

/** Asynchronously downloads data from Amazon S3 using get object request
 * Pause and resume will only work if you specify a targetFilePath on the getObjectRequest.
 * If targetFilePath is specified, if a local file incomplete already exists, it is resumed.
 * If the local file size matches the remote file size and the md5sum matches, didFailWithError is called.
 *
 * @param getObjectRequest A S3GetObjectRequest object that defines the parameters of the request.
 * @see AmazonServiceRequestDelegate
 *
 * @return S3TransferOperation
 */
- (S3TransferOperation *)download:(S3GetObjectRequest *)getObjectRequest;

/** Asynchronously downloads data from Amazon S3 to a local file.  If a local file incomplete already exists, it is resumed.
 * If the local file size matches the remote file size and the md5sum matches, didFailWithError is called.
 *
 * @param targetFilePath A filepath for the local file to download to.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 *
 * @return S3TransferOperation
 */
- (S3TransferOperation *)downloadFile:(NSString *)targetFilePath bucket:(NSString *)bucket key:(NSString *)key;

/** Asynchronously downloads data from Amazon S3 to an output stream.
 * Pause and resume will not work with this method.
 *
 * @param outputStream An NSOutputStream object.
 * @param bucket A bucket name.
 * @param key A key name.
 * @see AmazonServiceRequestDelegate
 *
 * @return S3TransferOperation
 */
- (S3TransferOperation *)downloadStream:(NSOutputStream *) outputStream bucket:(NSString *)bucket key:(NSString *)key;

#pragma mark - Synchronous downloads

/** Synchronously downloads data from Amazon S3 using get object request
 *
 * @param getObjectRequest A S3GetObjectRequest object that defines the parameters of the request.
 * @return AmazonServiceResponse
 * @throws NSException
 */
- (AmazonServiceResponse *)synchronouslyDownload:(S3GetObjectRequest *)getObjectRequest;

/** Synchronously downloads data from Amazon S3 to a local file.
 *
 * @param targetFilePath A filepath for the local file to download to.
 * @param bucket A bucket name.
 * @param key A key name.
 * @return An AmazonServiceResponse from S3.
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyDownloadFile:(NSString *)targetFilePath bucket:(NSString *)bucket key:(NSString *)key;

/** Synchronously downloads data from Amazon S3 to an output stream.
 * Pause and resume will not work with this method.
 *
 * @param outputStream An NSOutputStream object.
 * @param bucket A bucket name.
 * @param key A key name.
 * @return An AmazonServiceResponse from S3.
 * @see AmazonServiceResponse
 */
- (AmazonServiceResponse *)synchronouslyDownloadStream:(NSOutputStream *)outputStream bucket:(NSString *)bucket key:(NSString *)key;

#pragma mark - Cancel uploads/downloads

/**
 * Cancel all outstanding operations
 */
- (void) cancelAllTransfers;

#pragma mark - Pause uploads/downloads

/**
 * Pause all transfers.
 */
- (void) pauseAllTransfers;

#pragma mark - Resume uploads/downloads

/** Resume a specific operation. Uploads < 5 MB will be restarted from the beginning. Uploads >= 5MB will be resumed
 * at the last 5 MB part that was successfully uploaded.  Downloads will be resumed.
 * @param operation Operation to resume
 * @param requestDelegate A object that adopts AmazonServiceRequestDelegate protocol. The delegates are not persisted when transfers are paused. Providing this is useful if you're tracking the progress.
 @return if the transfer is resumed, the S3TransferOperation of the resumed transfer. Otherwise the operation passed in.
 */
- (S3TransferOperation *)resume:(S3TransferOperation *)operation requestDelegate:(id<AmazonServiceRequestDelegate>)requestDelegate;

/** Resume all paused transfers. Uploads < 5 MB will be restarted from the beginning. Uploads >= 5MB will be resumed at the last 5 MB part that was successfully uploaded. Downloads will be resumed.
 * @param requestDelegate A object that adopts AmazonServiceRequestDelegate protocol. The delegates are not persisted when transfers are paused. Providing this is useful if you're tracking the progress.
 * @return All of the transfers that were resumed
 */
- (NSArray *)resumeAllTransfers:(id<AmazonServiceRequestDelegate>)requestDelegate;

#pragma mark - Utility methods

/**
 * Clean up the temp files used for resuming
 */
- (void) cleanupTempFiles;

#pragma mark - Abort multipart uploads

/** Asynchronously aborts pending multipart uploads initiated before a specified date for a specified bucket.
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
