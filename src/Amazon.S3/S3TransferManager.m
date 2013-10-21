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

#import "S3TransferManager.h"

#import "S3PutObjectOperation_Internal.h"
#import "S3MultipartUploadOperation_Internal.h"
#import "S3AbortMultipartUploadsOperation_Internal.h"
#import "S3GetObjectOperation_Internal.h"
#import "AmazonErrorHandler.h"

// Private Constants
uint32_t const S3MultipartMinimumUploadSize = 1024*1024*5; //5 Megs
int32_t const S3DefaultMaxConcurrentOperationCount = 3;
NSString *const kS3TransferUploadRequests = @"S3TransferUploadRequests";
NSString *const kS3TransferDownloadRequests = @"S3TransferDownloadRequests";
NSString *const kMetaDataFilenameRegex = @"\\d{9}-.*\\.plist";

@implementation S3TransferManager

@synthesize s3 = _s3;
@synthesize multipartUploadThreshold = _multipartUploadThreshold;

#pragma mark - Class lifecycle Methods

- (id)init
{
    if(self = [super init])
    {
        _minimumUploadPartSize = S3MultipartMinimumUploadSize;
        _multipartUploadThreshold = S3MultipartMinimumUploadSize;
        _noSyncMethodsOnMainThread = YES;
    }
    
    return self;
}

- (void)dealloc
{
    [_s3 release];
    
    [super dealloc];
}

#pragma mark - Synchronous Upload Methods

- (AmazonServiceResponse *)synchronouslyUpload:(S3PutObjectRequest *)putObjectRequest
{
    if(self.noSyncMethodsOnMainThread
       && [NSThread isMainThread])
    {
        AmazonClientException *exception = [AmazonClientException exceptionWithMessage:@"A synchronous method was called on the main thread. You need to call it from a background thread."];
        NSError *error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:exception];
        
        AmazonServiceResponse *response = [AmazonServiceResponse new];
        response.error = error;
        
        return [response autorelease];
    }
    
    putObjectRequest.delegate = nil;
    
    [putObjectRequest validate];
    
    if([self shouldUseMultipartUpload:putObjectRequest])
    {
        // Multipart Upload
        S3MultipartUploadOperation_Internal *multipartUploadOperation = [S3MultipartUploadOperation_Internal new];
        multipartUploadOperation.s3 = self.s3;
        multipartUploadOperation.putRequest = putObjectRequest;
        multipartUploadOperation.partSize = self.minimumUploadPartSize;
        
        [self saveMetadataFromRequest:putObjectRequest withOperation:multipartUploadOperation];
        
        [self.operationQueue addOperations:[NSArray arrayWithObject:multipartUploadOperation] waitUntilFinished:YES];
        [multipartUploadOperation autorelease];
        
        if(multipartUploadOperation.response)
        {
            return multipartUploadOperation.response;
        }
        else if(multipartUploadOperation.error) // Check error before exception. When an error occurs, an exception object will be generated too
        {
            AmazonServiceResponse *response = [[AmazonServiceResponse new] autorelease];
            response.error = multipartUploadOperation.error;
            
            return response;
        }
        else if(multipartUploadOperation.exception)
        {
            @throw multipartUploadOperation.exception;
        }
    }
    else
    {
        // Put
        S3PutObjectOperation_Internal *putObjectOperation = [S3PutObjectOperation_Internal new];
        putObjectOperation.s3 = self.s3;
        putObjectOperation.putRequest = putObjectRequest;
        
        // persist request on disk
        [self saveMetadataFromRequest:putObjectRequest withOperation:putObjectOperation];
        
        [self.operationQueue addOperations:[NSArray arrayWithObject:putObjectOperation] waitUntilFinished:YES];
        [putObjectOperation autorelease];
        
        if(putObjectOperation.response)
        {
            return putObjectOperation.response;
        }
        else if(putObjectOperation.error) // Check error before exception. When an error occurs, an exception object will be generated too
        {
            S3PutObjectResponse *response = [[S3PutObjectResponse new] autorelease];
            response.error = putObjectOperation.error;
            
            return response;
        }
        else if(putObjectOperation.exception)
        {
            @throw putObjectOperation.exception;
        }
    }
    
    return nil;
}

- (AmazonServiceResponse *)synchronouslyUploadData:(NSData *)data bucket:(NSString *)bucket key:(NSString *)key
{
    S3PutObjectRequest *putObjectRequest = [[S3PutObjectRequest new] autorelease];
    putObjectRequest.data = data;
    putObjectRequest.bucket = bucket;
    putObjectRequest.key = key;
    
    return [self synchronouslyUpload:putObjectRequest];
}

- (AmazonServiceResponse *)synchronouslyUploadFile:(NSString *)filename bucket:(NSString *)bucket key:(NSString *)key
{
    S3PutObjectRequest *putObjectRequest = [[S3PutObjectRequest new] autorelease];
    putObjectRequest.filename = filename;
    putObjectRequest.bucket = bucket;
    putObjectRequest.key = key;
    
    return [self synchronouslyUpload:putObjectRequest];
}

- (AmazonServiceResponse *)synchronouslyUploadStream:(NSInputStream *)stream contentLength:(int64_t)contentLength bucket:(NSString *)bucket key:(NSString *)key
{
    S3PutObjectRequest *putObjectRequest = [[S3PutObjectRequest new] autorelease];
    putObjectRequest.stream = stream;
    putObjectRequest.contentLength = contentLength;
    putObjectRequest.bucket = bucket;
    putObjectRequest.key = key;
    
    return [self synchronouslyUpload:putObjectRequest];
}

#pragma mark - Asynchronous Upload Methods

- (S3TransferOperation *)upload:(S3PutObjectRequest *)putObjectRequest
{
    if(putObjectRequest.delegate == nil && self.delegate != nil)
    {
        putObjectRequest.delegate = self.delegate;
    }
    
    [putObjectRequest validate];
    
    if([self shouldUseMultipartUpload:putObjectRequest])
    {
        // Multipart Upload
        S3MultipartUploadOperation_Internal *multipartUploadOperation = [S3MultipartUploadOperation_Internal new];
        multipartUploadOperation.s3 = self.s3;
        multipartUploadOperation.putRequest = putObjectRequest;
        multipartUploadOperation.partSize = self.minimumUploadPartSize;
        // persist request on disk
        [self saveMetadataFromRequest:putObjectRequest withOperation:multipartUploadOperation];
        
        [self.operationQueue addOperation:multipartUploadOperation];
        return [multipartUploadOperation autorelease];
    }
    else
    {
        // Put
        S3PutObjectOperation_Internal *putObjectOperation = [S3PutObjectOperation_Internal new];
        putObjectOperation.s3 = self.s3;
        putObjectOperation.putRequest = putObjectRequest;
        
        // persist request on disk
        [self saveMetadataFromRequest:putObjectRequest withOperation:putObjectOperation];
        
        [self.operationQueue addOperation:putObjectOperation];
        return [putObjectOperation autorelease];
    }
}

- (S3TransferOperation *)uploadData:(NSData *)data bucket:(NSString *)bucket key:(NSString *)key
{
    S3PutObjectRequest *putObjectRequest = [[S3PutObjectRequest new] autorelease];
    putObjectRequest.data = data;
    putObjectRequest.bucket = bucket;
    putObjectRequest.key = key;
    
    return [self upload:putObjectRequest];
}

- (S3TransferOperation *)uploadFile:(NSString *)filename bucket:(NSString *)bucket key:(NSString *)key
{
    S3PutObjectRequest *putObjectRequest = [[S3PutObjectRequest new] autorelease];
    putObjectRequest.filename = filename;
    putObjectRequest.bucket = bucket;
    putObjectRequest.key = key;

    return [self upload:putObjectRequest];
}

- (S3TransferOperation *)uploadStream:(NSInputStream *)stream contentLength:(long)contentLength bucket:(NSString *)bucket key:(NSString *)key
{
    S3PutObjectRequest *putObjectRequest = [[S3PutObjectRequest new] autorelease];
    putObjectRequest.stream = stream;
    putObjectRequest.contentLength = contentLength;
    putObjectRequest.bucket = bucket;
    putObjectRequest.key = key;
    
    return [self upload:putObjectRequest];
}

#pragma mark - Downloads

- (S3TransferOperation *)download:(S3GetObjectRequest *)getObjectRequest
{
    if (getObjectRequest.delegate == nil && self.delegate != nil) {
        getObjectRequest.delegate = self.delegate;
    }
    
    [getObjectRequest validate];
    
    S3GetObjectOperation_Internal *getObjectOperation = [S3GetObjectOperation_Internal new];
    getObjectOperation.s3 = self.s3;
    getObjectOperation.getRequest = getObjectRequest;
    
    // persist request metadata on disk
    [self saveMetadataFromRequest:getObjectRequest withOperation:getObjectOperation];
    
    [self.operationQueue addOperation:getObjectOperation];
    return [getObjectOperation autorelease];
}

- (S3TransferOperation *)downloadFile:(NSString *)targetFilePath bucket:(NSString *)bucket key:(NSString *)key
{
    S3GetObjectRequest *getObjectRequest = [[S3GetObjectRequest new] autorelease];
    getObjectRequest.targetFilePath = targetFilePath;
    getObjectRequest.bucket = bucket;
    getObjectRequest.key = key;

    return [self download:getObjectRequest];
}

- (S3TransferOperation *)downloadStream:(NSOutputStream *)outputStream bucket:(NSString *)bucket key:(NSString *)key
{
    S3GetObjectRequest *getObjectRequest = [[S3GetObjectRequest new] autorelease];
    getObjectRequest.outputStream = outputStream;
    getObjectRequest.bucket = bucket;
    getObjectRequest.key = key;
    
    return [self download:getObjectRequest];
}

- (AmazonServiceResponse *)synchronouslyDownload:(S3GetObjectRequest *)getObjectRequest
{
    if(self.noSyncMethodsOnMainThread
       && [NSThread isMainThread])
    {
        AmazonClientException *exception = [AmazonClientException exceptionWithMessage:@"A synchronous method was called on the main thread. You need to call it from a background thread."];
        NSError *error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:exception];
        
        AmazonServiceResponse *response = [AmazonServiceResponse new];
        response.error = error;
        
        return [response autorelease];
    }
    
    getObjectRequest.delegate = nil;
    
    [getObjectRequest validate];
    
    S3GetObjectOperation_Internal *getObjectOperation = [S3GetObjectOperation_Internal new];
    getObjectOperation.s3 = self.s3;
    getObjectOperation.getRequest = getObjectRequest;
    
    // persist request metadata on disk
    [self saveMetadataFromRequest:getObjectRequest withOperation:getObjectOperation];
    
    [self.operationQueue addOperations:[NSArray arrayWithObject:getObjectOperation] waitUntilFinished:YES];
    [getObjectOperation autorelease];
    
    if(getObjectOperation.response)
    {
        return getObjectOperation.response;
    }
    else if(getObjectOperation.error) // Check error before exception. When an error occurs, an exception object will be generated too
    {
        S3GetObjectResponse *response = [[S3GetObjectResponse new] autorelease];
        response.error = getObjectOperation.error;
        
        return response;
    }
    else if(getObjectOperation.exception)
    {
        @throw getObjectOperation.exception;
    }
    return nil;
}

- (AmazonServiceResponse *)synchronouslyDownloadFile:(NSString *)targetFilePath bucket:(NSString *)bucket key:(NSString *)key
{
    S3GetObjectRequest *getObjectRequest = [[S3GetObjectRequest new] autorelease];
    getObjectRequest.targetFilePath = targetFilePath;
    getObjectRequest.bucket = bucket;
    getObjectRequest.key = key;
    
    return [self synchronouslyDownload:getObjectRequest];
}



- (AmazonServiceResponse *)synchronouslyDownloadStream:(NSOutputStream *)outputStream bucket:(NSString *)bucket key:(NSString *)key
{
    S3GetObjectRequest *getObjectRequest = [[S3GetObjectRequest new] autorelease];
    getObjectRequest.outputStream = outputStream;
    getObjectRequest.bucket = bucket;
    getObjectRequest.key = key;
    
    return [self synchronouslyDownload:getObjectRequest];
}

#pragma mark - Pause / Resume / Cancel Uploads/Downloads

- (void)pauseAllTransfers
{
    [self pauseType:(S3TRANSFER_UPLOAD|S3TRANSFER_DOWNLOAD)];
}

- (void)pauseType:(S3TransferType)s3TransferType
{
    [self.operationQueue setSuspended:YES];
    
    NSArray *allOps = [self.operationQueue operations];
    for (S3TransferOperation *op in allOps) {
        if (op.transferRequestType & s3TransferType) {
            op.isPaused = YES;
            if(!op.isCancelled){
                [op cancel];
            }
        }
    }
    
    // Resume the rest of the waiting operations
    [self.operationQueue setSuspended:NO];
}


- (S3TransferOperation *) resume:(S3TransferOperation *) operation requestDelegate : (id<AmazonServiceRequestDelegate>)requestDelegate
{
    //Check to ensure we need to resume
    if(!operation.isPaused || operation.requestMetadataFile == nil){
        return operation;
    }
    
    S3PutObjectRequest * putRequest = nil;
    S3GetObjectRequest * getRequest = nil;
    
    
    if(operation.transferRequestType == S3TRANSFER_UPLOAD){
        putRequest = (S3PutObjectRequest *)[self loadRequestMetadataFromFile:operation.requestMetadataFile forType:S3TRANSFER_UPLOAD];
        
    }else {
        getRequest = (S3GetObjectRequest *)[self loadRequestMetadataFromFile:operation.requestMetadataFile forType:S3TRANSFER_DOWNLOAD];
    }
    
    // Ensure request is not already in the queue
    if(![self isAlreadyInQueue:operation.requestMetadataFile]){
        [operation removeRequestMetadataFile];
        
        if(operation.transferRequestType == S3TRANSFER_UPLOAD){
            // Check if the file we're uploading exists
            if (![[NSFileManager defaultManager] fileExistsAtPath:putRequest.filename]) {
                AMZLogDebug(@"TransferManager failed to find the file: %@", putRequest.filename);
            }else {
                putRequest.delegate = requestDelegate;
                return [self upload:putRequest];
            }
        }else{
            getRequest.delegate = requestDelegate;
            return [self download:getRequest];
        }
    }
    return operation;
}

- (NSArray *) resumeUploads:(id<AmazonServiceRequestDelegate>)requestDelegate {
    return [self resumeType:S3TRANSFER_UPLOAD requestDelegate:requestDelegate];
}

- (NSArray *) resumeDownloads:(id<AmazonServiceRequestDelegate>)requestDelegate {
    return [self resumeType:S3TRANSFER_DOWNLOAD requestDelegate:requestDelegate];
}

- (NSArray *) resumeType:(S3TransferType)type requestDelegate:(id<AmazonServiceRequestDelegate>)requestDelegate
{
    NSArray *files = [self getAllFiles:type];
    NSString *dirPath = [NSTemporaryDirectory() stringByAppendingPathComponent: (type == S3TRANSFER_UPLOAD) ? kS3TransferUploadRequests : kS3TransferDownloadRequests];
    
    NSMutableArray *operations = [NSMutableArray new];
    
    for (NSString *file in files) {
        NSString *filePath = [dirPath stringByAppendingPathComponent:file];
        S3TransferOperation * transferOperation = (type == S3TRANSFER_UPLOAD) ? [[S3PutObjectOperation_Internal alloc] init] : [[S3GetObjectOperation_Internal alloc] init];
        transferOperation.requestMetadataFile = filePath;
        transferOperation.isPaused = YES;
        S3TransferOperation * resumedOperation = [self resume:transferOperation requestDelegate:requestDelegate];
        
        //if this isn't the same instance, the transfer was resumed
        //add it to the array of resumed transfers to return
        if(resumedOperation != transferOperation){
            [operations addObject:resumedOperation];
        }
        [transferOperation release];
    }
    return [operations autorelease];
}

/** Resume all outstanding operations */
- (NSArray *)resumeAllTransfers:(id<AmazonServiceRequestDelegate>)requestDelegate {
    NSMutableArray *operations = [NSMutableArray new];
    [operations addObjectsFromArray:[self resumeUploads:requestDelegate]];
    [operations addObjectsFromArray:[self resumeDownloads:requestDelegate]];
    return [operations autorelease];
}

/** Cancel all outstanding operations */
- (void)cancelAllTransfers {
    [self.operationQueue cancelAllOperations];
    [self cleanupTempFiles];
}


/** Clean up the temp files of the application */
- (void)cleanupTempFiles
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray * tempDirectories = [NSArray arrayWithObjects:
                                 [NSTemporaryDirectory() stringByAppendingPathComponent:kS3TransferUploadRequests],
                                 [NSTemporaryDirectory() stringByAppendingPathComponent:kS3TransferDownloadRequests],nil];
    NSError *error = nil;
    for (NSString *directory in tempDirectories) {
        [fm removeItemAtPath: directory error:&error];
        if (nil != error) {
            AMZLogDebug(@"Failed to remove temp file: [%@]", error);
        }
    }
}

#pragma mark - Pause / Resume Helpers

/**
 * Creates and/or returns the directory where request metadata file is stored
 *
 * @param request the request to be persisted (S3PutObjectRequest or S3GetObjectRequest)
 *
 * @return Returns the directory where the request metadata file will be stored
 */
- (NSString *)pathToS3TransferRequestFolder:(S3Request *)request
{
    NSString *transferType = [request isKindOfClass:[S3PutObjectRequest class]] ? kS3TransferUploadRequests : kS3TransferDownloadRequests;
    NSString *directory = [NSTemporaryDirectory() stringByAppendingPathComponent:transferType];
    
    // Create the folder if necessary
    BOOL isDir = NO;
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:directory isDirectory:&isDir] && isDir == NO) {
        [fm createDirectoryAtPath:directory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return directory;
}

/**
 * Creates the file path to persist metadata of a request
 *
 * @param request the request to be persisted (S3PutObjectRequest or S3GetObjectRequest)
 *
 * @return Returns the full file path where metadata will be stored
 */
- (NSString *)filePath:(S3Request *)request
{
    NSString *documentDirectory = [self pathToS3TransferRequestFolder:request];
    
    NSError *error = nil;
    NSArray *allFiles = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentDirectory error:&error];
    if (nil != error) {
        AMZLogDebug(@"Error found when getting files from %@: [%@]", documentDirectory, error);
    }
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"self matches %@", kMetaDataFilenameRegex];
    allFiles = [allFiles filteredArrayUsingPredicate:filter];
    
    int64_t fileCounter = 0;
    if ([allFiles count] > 0) {
        int64_t num = 0;
        for (NSString *file in allFiles) {
            
            num = (int64_t)[[file substringToIndex:9] intValue];
            if (num >= fileCounter) {
                fileCounter = num+1;
            }
        }
    }
    NSString *file = [NSString stringWithFormat:@"%09lld-%@-%@.plist", fileCounter , request.bucket, [[NSDate date] dateTime]];
    
    AMZLogDebug(@"File created to persist transfer request: %@",[documentDirectory stringByAppendingPathComponent:file]);
    return [documentDirectory stringByAppendingPathComponent:file];
}

/**
 * Get all files that contains request metadata
 *
 * @param type the S3TransferType which specify whether to return put request files or get request files
 *
 * @return Returns an array of all file paths
 */
- (NSArray *)getAllFiles:(S3TransferType)type
{
    NSError *error = nil;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *dirName = (type & S3TRANSFER_UPLOAD) ? kS3TransferUploadRequests : kS3TransferDownloadRequests;
    NSString *dirPath = [NSTemporaryDirectory() stringByAppendingPathComponent:dirName];
    NSArray *files = [fm contentsOfDirectoryAtPath:dirPath error:&error];
    
    if (!files) {
        AMZLogDebug(@"Error when getting files from S3TransferRequest Folder: %@", error);
        return nil;
    }
    
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"self matches %@", kMetaDataFilenameRegex];
    NSArray *filteredFiles = [files filteredArrayUsingPredicate:filter];
    
    return filteredFiles;
}

/**
 * This method encodes and persists request metadata to the disk
 *
 * @param request the request to be persisted (S3PutObjectRequest or S3GetObjectRequest)
 * @param filePath the file path where request metadata to be stored
 */
- (void)saveMetadataFromRequest:(S3Request *)request withOperation:(S3TransferOperation *)operation
{
    //Don't save metadata if request doesn't have a filename for put or a targetFilePath for get
    if ([request isKindOfClass:[S3PutObjectRequest class]]) {
        if(!((S3PutObjectRequest *)request).filename)
            return;
    }
    else if(!((S3GetObjectRequest *)request).targetFilePath){
        return;
    }

    @synchronized([self class]) {
        NSMutableData *data = [[NSMutableData alloc] init];
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        [archiver encodeObject:request];
        [archiver finishEncoding];

        NSString *filePath = [self filePath:request];
        operation.requestMetadataFile = filePath;
               
        [data writeToFile:filePath atomically:YES];
        [archiver release];
        [data release];
    }
}

/**
 * This method decodes request (Put or Get) metadata and returns a S3Request object
 *
 * @param file the file path of the plist where metadata is stored
 * @param type the type of the request (S3TRANSFER_PUT (same for multipart) or S3TRANSFER_GET)
 *
 * @return Returns the S3Request object (S3PutObjectRequest or S3GetObjectRequest)
 */
- (S3Request *)loadRequestMetadataFromFile:(NSString *)file forType:(S3TransferType)type
{
    NSData *codedData = [[[NSData alloc] initWithContentsOfFile:file] autorelease];
    if (codedData == nil) {
        return nil;
    }
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    
    if (type & S3TRANSFER_UPLOAD) {
        S3PutObjectRequest *data = [unarchiver decodeObject];
        [unarchiver finishDecoding];
        [unarchiver release];
        return data;
    }
    
    S3GetObjectRequest *data = [unarchiver decodeObject];
    [unarchiver finishDecoding];
    [unarchiver release];
    return data;
}

#pragma mark - Abort Multipart Uploads

- (void)abortMultipartUploads:(NSString *)bucket initiatedBefore:(NSDate *)date
{
    S3AbortMultipartUploadsOperation_Internal *abortMultipartUploadsOperation = [S3AbortMultipartUploadsOperation_Internal new];
    abortMultipartUploadsOperation.s3 = self.s3;
    abortMultipartUploadsOperation.delegate = self.delegate;
    abortMultipartUploadsOperation.bucket = bucket;
    abortMultipartUploadsOperation.date = date;
    
    [self.operationQueue addOperation:abortMultipartUploadsOperation];
    [abortMultipartUploadsOperation release];
}

- (void)abortMultipartUploads:(NSString *)bucket forKey:(NSString *)key
{
    S3AbortMultipartUploadsOperation_Internal *abortMultipartUploadsOperation = [S3AbortMultipartUploadsOperation_Internal new];
    abortMultipartUploadsOperation.s3 = self.s3;
    abortMultipartUploadsOperation.delegate = self.delegate;
    abortMultipartUploadsOperation.bucket = bucket;
    abortMultipartUploadsOperation.key = key;
    
    [self.operationQueue addOperation:abortMultipartUploadsOperation];
    [abortMultipartUploadsOperation release];
}

#pragma mark - Helper Methods

- (NSOperationQueue *)operationQueue
{
    static NSOperationQueue *_operationQueue = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _operationQueue = [NSOperationQueue new];
        _operationQueue.maxConcurrentOperationCount = S3DefaultMaxConcurrentOperationCount;
    });
    
    return _operationQueue;
}

- (BOOL)shouldUseMultipartUpload:(S3PutObjectRequest *)putObjectRequest
{
    if(putObjectRequest.data)
    {
        return putObjectRequest.data.length > self.multipartUploadThreshold;
    }
    else
    {
        return putObjectRequest.contentLength > self.multipartUploadThreshold;
    }
}

- (void)setUploadPartSize:(uint32_t)minimumUploadPartSize
{
    if(minimumUploadPartSize > S3MultipartMinimumUploadSize)
    {
        _minimumUploadPartSize = minimumUploadPartSize;
    }
}

- (uint32_t)multipartUploadThreshold
{
    if(_multipartUploadThreshold < self.minimumUploadPartSize)
    {
        return self.minimumUploadPartSize;
    }
    else
    {
        return _multipartUploadThreshold;
    }
}

- (void)setMultipartUploadThreshold:(uint32_t)multipartUploadThreshold
{
    if(multipartUploadThreshold > S3MultipartMinimumUploadSize)
    {
        _multipartUploadThreshold = multipartUploadThreshold;
    }
}

/**
 * Determines whether a operation is already in the operation queue by 
 * checking its requestMetaDataLocation against ones in the queue
 *
 * @param requestMetaDataLocation location of the request meta data
 * @return if an operation corresponding to this location is in the queue
 **/
- (BOOL)isAlreadyInQueue:(NSString *)requestMetaDataLocation
{
    NSArray *allOps = [self.operationQueue operations];
    for (S3TransferOperation *op in allOps) {
        if ([requestMetaDataLocation isEqual: op.requestMetadataFile ]  && !op.isPaused){
            return YES;
        }
    }
    
    return NO;
}

- (AmazonS3Client *)s3
{
    @synchronized(self)
    {
        return _s3;
    }
}

- (void)setS3:(AmazonS3Client *)s3
{
    @synchronized(self)
    {
        [_s3 release];
        
        _s3 = [s3 copy];
        
        if(![_s3.userAgent hasPrefix:AWSS3TransferManagerUserAgentPrefix])
        {
            _s3.userAgent = AWSS3TransferManagerUserAgentPrefix;
        }
    }
}

#pragma mark -

@end
