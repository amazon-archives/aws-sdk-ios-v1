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

#import "S3MultipartUploadOperation_Internal.h"
#import "AmazonErrorHandler.h"

typedef void (^AbortMultipartUploadBlock)();

typedef struct _AWSRange {
    int64_t location;
    int64_t length;
} AWSRange;

@interface S3MultipartUploadOperation_Internal ()
{
    BOOL _isExecuting;
    BOOL _isFinished;
}

@property (nonatomic, assign) int64_t contentLength;
@property (nonatomic, assign) NSInteger currentPartNo;
@property (nonatomic, assign) NSInteger numberOfParts;
@property (nonatomic, assign) NSInteger retryCount;
@property (nonatomic, copy) AbortMultipartUploadBlock abortMultipartUpload;
@property (nonatomic, retain) S3InitiateMultipartUploadRequest *initRequest;
@property (nonatomic, retain) S3InitiateMultipartUploadResponse *initResponse;
@property (nonatomic, retain) S3MultipartUpload *multipartUpload;
@property (nonatomic, retain) S3CompleteMultipartUploadRequest *completeRequest;
@property (nonatomic, retain) NSData *dataForPart;

@end

@implementation S3MultipartUploadOperation_Internal

@synthesize s3 = _s3;

@synthesize contentLength = _contentLength;
@synthesize currentPartNo = _currentPartNo;
@synthesize numberOfParts = _numberOfParts;
@synthesize retryCount = _retryCount;
@synthesize abortMultipartUpload = _abortMultipartUpload;
@synthesize initRequest = _initRequest;
@synthesize initResponse = _initResponse;
@synthesize multipartUpload = _multipartUpload;
@synthesize completeRequest = _completeRequest;
@synthesize dataForPart = _dataForPart;

#pragma mark - Class Lifecycle

- (id)init
{
    if (self = [super init])
    {
        _isExecuting = NO;
        _isFinished = NO;

        _contentLength = 0;
        _currentPartNo = 0;
        _numberOfParts = 0;
        _retryCount = 0;
    }

    return self;
}

- (void)dealloc
{
    [_s3 release];
    [_request release];
    [_response release];

    [_error release];
    [_exception release];

    [_abortMultipartUpload release];
    [_initRequest release];
    [_initResponse release];
    [_multipartUpload release];
    [_completeRequest release];
    [_dataForPart release];

    [super dealloc];
}

#pragma mark - Overwriding NSOperation Methods

- (void)start
{
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];

    [self initiateUpload];
}

- (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isExecuting
{
    return _isExecuting;
}

- (BOOL)isFinished
{
    return _isFinished;
}

#pragma mark - Multipart Upload Methods

- (void)initiateUpload
{
    S3InitiateMultipartUploadRequest *initRequest = [[S3InitiateMultipartUploadRequest alloc] initWithKey:self.request.key
                                                                                                 inBucket:self.request.bucket];
    self.initRequest = initRequest;
    [initRequest release];

    [self updateProperties:self.initRequest];
    self.initRequest.delegate = self;

    self.retryCount = 0;
    self.response = nil;

    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.s3 initiateMultipartUpload:self.initRequest];
    });
}

- (void)startUploadingParts
{
    S3CompleteMultipartUploadRequest *completeRequest = [[S3CompleteMultipartUploadRequest alloc] initWithMultipartUpload:self.multipartUpload];
    self.completeRequest = completeRequest;
    [completeRequest release];

    [self updateProperties:self.completeRequest];
    self.completeRequest.delegate = self;

    self.abortMultipartUpload = ^{

        if(self.multipartUpload)
        {
            @try {
                S3AbortMultipartUploadRequest *abortRequest = [[S3AbortMultipartUploadRequest alloc] initWithMultipartUpload:self.multipartUpload];
                [self.s3 abortMultipartUpload:abortRequest];
                [abortRequest release];
            }
            @catch (NSException *exception) {

            }
        }

    };

    self.contentLength = [self contentLengthForRequest:self.request];
    self.numberOfParts = [self numberOfParts:self.contentLength];
    self.currentPartNo = 1;

    self.retryCount = 0;
    [self uploadPart:self.currentPartNo];
}

- (void)uploadPart:(NSInteger)partNo
{
    AWSRange dataRange = [self getDataRange:partNo withContentLength:self.contentLength];

    self.error = nil;
    self.exception = nil;

    if(self.retryCount > 0)
    {
        [self.s3 pauseExponentially:self.retryCount];
    }

    S3UploadPartRequest *uploadRequest = [[S3UploadPartRequest alloc] initWithMultipartUpload:self.multipartUpload];
    [self updateProperties:uploadRequest];
    uploadRequest.partNumber = partNo;

    if(self.dataForPart == nil)
    {
        if(self.request.data != nil)
        {
            NSRange range;
            range.location = dataRange.location;
            range.length = dataRange.length;
            
            self.dataForPart = [self.request.data subdataWithRange:range];
        }
        else
        {
            if(self.request.stream.streamStatus == NSStreamStatusNotOpen)
            {
                [self.request.stream open];
            }

            NSMutableData *dataForPart = [NSMutableData new];

            uint8_t buffer[1024];
            NSInteger readLength = 0;

            for(int i = 0; i < ceil((double) self.partSize / 1024); i++)
            {
                @autoreleasepool
                {
                    readLength = [self.request.stream read:buffer maxLength:1024];
                    [dataForPart appendData:[NSData dataWithBytes:buffer length:readLength]];
                }
            }

            self.dataForPart = dataForPart;

            [dataForPart release];
        }
    }

    uploadRequest.contentLength = self.dataForPart.length;
    uploadRequest.data = self.dataForPart;
    uploadRequest.delegate = self;

    self.response = nil;

    dispatch_async(dispatch_get_main_queue(), ^{
        [self.s3 uploadPart:uploadRequest];
    });

    [uploadRequest release];
}

#pragma mark - AmazonServiceRequestDelegate Implementations

- (void)request:(AmazonServiceRequest *)request didCompleteWithResponse:(AmazonServiceResponse *)response
{
    if(!self.isFinished && self.isExecuting)
    {
        self.response = response;

        if([response isKindOfClass:[S3InitiateMultipartUploadResponse class]])
        {
            self.initResponse = (S3InitiateMultipartUploadResponse *)self.response;
            self.multipartUpload = self.initResponse.multipartUpload;

            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, ^{

                [self startUploadingParts];
            });
        }
        else if([response isKindOfClass:[S3UploadPartResponse class]])
        {
            AMZLogDebug(@"UploadPart succeeded: %d", self.currentPartNo);

            S3UploadPartResponse *uploadPartResponse = (S3UploadPartResponse *)self.response;

            if(uploadPartResponse.etag == nil)
            {
                [self.s3 completeMultipartUpload:self.completeRequest];
            }
            else
            {
                [self.completeRequest addPartWithPartNumber:self.currentPartNo withETag:uploadPartResponse.etag];

                self.dataForPart = nil;
                self.retryCount = 0;

                if(self.currentPartNo < self.numberOfParts)
                {
                    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                    dispatch_async(queue, ^{

                        self.currentPartNo++;
                        [self uploadPart:self.currentPartNo];
                    });
                }
                else
                {
                    if(self.request.stream)
                    {
                        [self.request.stream close];
                    }

                    [self.s3 completeMultipartUpload:self.completeRequest];
                }
            }
        }
        else if([response isKindOfClass:[S3CompleteMultipartUploadResponse class]])
        {
            if([self.request.delegate respondsToSelector:@selector(request:didCompleteWithResponse:)])
            {
                [self.request.delegate request:request
                       didCompleteWithResponse:response];
            }

            [self finish];
        }
    }
}

- (void)request:(AmazonServiceRequest *)request didSendData:(long long)bytesWritten totalBytesWritten:(long long)totalBytesWritten totalBytesExpectedToWrite:(long long)totalBytesExpectedToWrite
{
    if(!self.isFinished && self.isExecuting)
    {
        if([request isKindOfClass:[S3UploadPartRequest class]])
        {
            if([self.request.delegate respondsToSelector:@selector(request:didSendData:totalBytesWritten:totalBytesExpectedToWrite:)])
            {
                [self.request.delegate request:request
                                   didSendData:bytesWritten
                             totalBytesWritten:(long long)(((long long) self.currentPartNo - 1) * self.partSize + totalBytesWritten)
                     totalBytesExpectedToWrite:(long long)self.contentLength];
            }
        }
    }
}

- (void)request:(AmazonServiceRequest *)request didFailWithError:(NSError *)error
{
    if(!self.isFinished && self.isExecuting)
    {
        AMZLogDebug(@"Error: %@", error);

        self.error = error;
        self.exception = [AmazonServiceException exceptionWithMessage:[error description] andError:error];

        if((self.s3.maxRetries > self.retryCount && (self.error || self.exception))
           && [self.s3 shouldRetry:nil exception:self.exception]
           && [self isExecuting])
        {
            AMZLogDebug(@"Retrying %@", [request class]);

            self.response = nil;
            self.retryCount++;

            if([request isKindOfClass:[S3InitiateMultipartUploadRequest class]])
            {
                [self.s3 initiateMultipartUpload:self.initRequest];
            }
            else if([request isKindOfClass:[S3UploadPartRequest class]])
            {
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_async(queue, ^{

                    [self uploadPart:self.currentPartNo];
                });
            }
            else if([request isKindOfClass:[S3CompleteMultipartUploadRequest class]])
            {
                [self.s3 completeMultipartUpload:self.completeRequest];
            }

            return;
        }

        if(self.abortMultipartUpload)
        {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, self.abortMultipartUpload);
        }

        if([self.request.delegate respondsToSelector:@selector(request:didFailWithError:)])
        {
            [self.request.delegate request:request didFailWithError:error];
        }

        [self finish];
    }
}

- (void)request:(AmazonServiceRequest *)request didFailWithServiceException:(NSException *)exception
{
    if(!self.isFinished && self.isExecuting)
    {
        AMZLogDebug(@"Exception: %@", exception);

        self.exception = exception;

        if((self.s3.maxRetries > self.retryCount && (self.error || self.exception))
           && [self.s3 shouldRetry:nil exception:self.exception]
           && [self isExecuting])
        {
            AMZLogDebug(@"Retrying %@", [request class]);

            self.response = nil;
            self.retryCount++;

            if([request isKindOfClass:[S3InitiateMultipartUploadRequest class]])
            {
                [self.s3 initiateMultipartUpload:self.initRequest];
            }
            else if([request isKindOfClass:[S3UploadPartRequest class]])
            {
                dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_async(queue, ^{

                    [self uploadPart:self.currentPartNo];
                });
            }
            else if([request isKindOfClass:[S3CompleteMultipartUploadRequest class]])
            {
                [self.s3 completeMultipartUpload:self.completeRequest];
            }

            return;
        }

        if(self.abortMultipartUpload)
        {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_async(queue, self.abortMultipartUpload);
        }

        if([self.request.delegate respondsToSelector:@selector(request:didFailWithServiceException:)])
        {
            [self.request.delegate request:request didFailWithServiceException:exception];
        }

        [self finish];
    }
}

#pragma mark - Helper Methods

- (void)finish
{
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];

    _isExecuting = NO;
    _isFinished  = YES;

    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (AWSRange)getDataRange:(NSInteger)partNo withContentLength:(int64_t)contentLength
{
    AWSRange range;
    range.length = self.partSize;
    range.location = (partNo - 1) * self.partSize;

    int64_t maxByte = partNo * self.partSize;
    if (contentLength < maxByte) {
        range.length = contentLength - range.location;
    }

    return range;
}

- (int64_t)contentLengthForRequest:(S3PutObjectRequest *)request
{
    if(request.data != nil)
    {
        return (int64_t) self.request.data.length;
    }
    else
    {
        return request.contentLength;
    }
}

- (NSInteger)numberOfParts:(int64_t)contentLength
{
    return (NSInteger)ceil((double)contentLength / self.partSize);
}

- (void)updateProperties:(AmazonServiceRequest *)serviceRequest
{
    serviceRequest.requestTag = self.request.requestTag;

    if([serviceRequest isKindOfClass:[S3Request class]])
    {
        S3Request *s3Request = (S3Request *)serviceRequest;
        s3Request.authorization = self.request.authorization;
        s3Request.contentType = self.request.contentType;
        s3Request.securityToken = self.request.securityToken;
        s3Request.subResource = self.request.subResource;

        if([serviceRequest isKindOfClass:[S3AbstractPutRequest class]])
        {
            S3AbstractPutRequest *abstractPutRequest = (S3AbstractPutRequest *)serviceRequest;

            abstractPutRequest.cannedACL = self.request.cannedACL;
            abstractPutRequest.storageClass = self.request.storageClass;
            abstractPutRequest.serverSideEncryption = self.request.serverSideEncryption;
            abstractPutRequest.fullACL = self.request.fullACL;

            if([self.request.metadata count] > 0)
            {
                abstractPutRequest.metadata = [NSMutableDictionary dictionaryWithDictionary:self.request.metadata];
            }

            if([serviceRequest isKindOfClass:[S3InitiateMultipartUploadRequest class]])
            {
                S3InitiateMultipartUploadRequest *initRequest = (S3InitiateMultipartUploadRequest *)serviceRequest;
                
                initRequest.cacheControl = self.request.cacheControl;
                initRequest.contentDisposition = self.request.contentDisposition;
                initRequest.contentEncoding = self.request.contentEncoding;
                initRequest.redirectLocation = self.request.redirectLocation;
            }
        }
        else if([serviceRequest isKindOfClass:[S3UploadPartRequest class]])
        {
            // No property to update.
        }
        else if([serviceRequest isKindOfClass:[S3CompleteMultipartUploadRequest class]])
        {
            // No property to update.
        }
    }
}

#pragma mark -

@end
