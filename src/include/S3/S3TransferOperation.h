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

/** Type of the S3 Transfer being processed.
 *
 */
typedef enum {
    S3TRANSFER_UPLOAD = 1,
    S3TRANSFER_DOWNLOAD = 2,
    S3TRANSFER_ABORT_MULTIPART_UPLOAD = 4
} S3TransferType;

@interface S3TransferOperation : NSOperation <AmazonServiceRequestDelegate>

/** S3 client used to make transfer requests */
@property (nonatomic, retain) AmazonS3Client *s3;

/** Put Object request */
@property (nonatomic, retain) S3PutObjectRequest *putRequest;

/** Get Object request */
@property (nonatomic, retain) S3GetObjectRequest *getRequest;

/**
 * Type of the S3 request
 *
 * S3TRANSFER_UPLOAD - Put object request
 *
 * S3TRANSFER_DOWNLOAD - Get object request
 */
@property (nonatomic, readonly, assign) S3TransferType transferRequestType;

/**
 * Boolean to check if this operation is paused
 */
@property (nonatomic, assign) BOOL isPaused;

/** filename where the request object metadata is persisted */
@property (nonatomic, retain) NSString *requestMetadataFile;

/**
 * The error (if any) generated during this operation
 */
@property (nonatomic, retain) NSError *error;

/**
 * The exception (if any) generated during this operation
 */
@property (nonatomic, retain) NSException *exception;

/**
 * This method will close any open input or output streams
 */
- (void)cleanup;

/**
 * This method will pause the transfer
 */
- (void)pause;
/**
 * This method removes the local file that was used to store either put or get request metadata.
 */
- (void)removeRequestMetadataFile;
@end
