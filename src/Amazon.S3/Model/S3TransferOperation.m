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

#import "S3TransferOperation.h"

@implementation S3TransferOperation

- (void)dealloc
{
    [_s3 release];
    [_putRequest release];
    [_getRequest release];
    [_requestMetadataFile release];

    [super dealloc];
}

#pragma mark - Helper Methods

- (void)cleanup
{
    if(!_isPaused){
        [self removeRequestMetadataFile];
    }

}

- (void)pause
{
    self.isPaused = YES;
    if(!self.isCancelled){
        [self cancel];
    }
}

- (void)removeRequestMetadataFile
{
    if (self.requestMetadataFile == nil) {
        return;
    }
    NSError *error = nil;
    NSFileManager *fm = [NSFileManager defaultManager];

    if (![fm fileExistsAtPath:self.requestMetadataFile]) {
        AMZLogDebug(@"File %@ does not exist at path.", self.requestMetadataFile);
        return;
    }

    [fm removeItemAtPath:self.requestMetadataFile error:&error];
    if (error != nil) {
        AMZLogDebug(@"Error when removing file from S3TransferRequest: %@", error);
    }
}

@end
