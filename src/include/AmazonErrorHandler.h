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
#import "AmazonServiceException.h"
#import "AmazonClientException.h"

extern NSString *const AWSiOSSDKServiceErrorDomain;
extern NSString *const AWSiOSSDKClientErrorDomain;

@interface AmazonErrorHandler : NSObject
{
}

+ (void)shouldThrowExceptions __attribute__((deprecated));
+ (void)shouldNotThrowExceptions;
+ (BOOL)throwsExceptions;
+ (NSError *)errorFromExceptionWithThrowsExceptionOption:(NSException *)exception;
+ (NSError *)errorFromException:(NSException *)exception;
+ (NSError *)errorFromException:(NSException *)exception serviceErrorDomain:(NSString *)serviceErrorDomain clientErrorDomain:(NSString *)clientErrorDomain;

@end