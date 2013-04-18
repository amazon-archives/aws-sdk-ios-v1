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

#import "S3AbortMultiplartUploadsOperation_Internal.h"

@interface S3AbortMultiplartUploadsOperation_Internal ()
{
    BOOL _isExecuting;
    BOOL _isFinished;
}

@end

@implementation S3AbortMultiplartUploadsOperation_Internal

@synthesize delegate = _delegate;
@synthesize s3 = _s3;

#pragma mark - Class Lifecycle

- (id)init
{
    if (self = [super init])
    {
        _isExecuting = NO;
        _isFinished = NO;
    }

    return self;
}

- (void)dealloc
{
    [_s3 release];
    [_bucket release];
    [_date release];
    [_key release];

    [super dealloc];
}

#pragma mark - Overwriding NSOperation Methods

- (void)start
{
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];

    BOOL isTruncated = NO;
    NSString *nextKeyMarker = nil;
    NSString *nextUploadIdMarker = nil;

    do {
        S3ListMultipartUploadsRequest *listMultipartUploadsRequest = [S3ListMultipartUploadsRequest new];
        listMultipartUploadsRequest.bucket = self.bucket;
        listMultipartUploadsRequest.keyMarker = nextKeyMarker;
        listMultipartUploadsRequest.uploadIdMarker = nextUploadIdMarker;

        S3ListMultipartUploadsResponse *listMultipartUploadsResponse = [self.s3 listMultipartUploads:listMultipartUploadsRequest];
        [listMultipartUploadsRequest release];
        S3ListMultipartUploadsResult *listMultipartUploadsResult = listMultipartUploadsResponse.listMultipartUploadsResult;

        isTruncated = listMultipartUploadsResult.isTruncated;
        nextKeyMarker = listMultipartUploadsResult.nextKeyMarker;
        nextUploadIdMarker = listMultipartUploadsResult.nextUploadIdMarker;

        for(S3MultipartUpload *multipartUpload in listMultipartUploadsResult.uploads)
        {
            if((self.date != nil && [multipartUpload.initiated compare:self.date] == NSOrderedAscending)
               ||
               (self.key != nil && [multipartUpload.key isEqualToString:self.key]))
            {
                AMZLogDebug(@"multipartUpload: %@", multipartUpload);
                
                S3AbortMultipartUploadRequest *abortMultipartUploadRequest = [[S3AbortMultipartUploadRequest alloc] initWithMultipartUpload:multipartUpload];
                abortMultipartUploadRequest.bucket = listMultipartUploadsResult.bucket;
                abortMultipartUploadRequest.delegate = self.delegate;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.s3 abortMultipartUpload:abortMultipartUploadRequest];
                });
                [abortMultipartUploadRequest release];
            }
        }

    } while(isTruncated);

    [self finish];
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

#pragma mark -

@end
