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

#define AMZLog(fmt, ...)    [AmazonLogger logInfo:(@"%@|%s|%d|" fmt),[[NSString stringWithUTF8String:__FILE__] lastPathComponent], __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__]
#define AMZLogDebug(fmt, ...)    [AmazonLogger logDebug:(@"%@|%s|%d|" fmt), [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__]

@interface AmazonLogger:NSObject {
}

+ (void)turnLoggingOff;
+ (void)turnLoggingOn;
+ (void)verboseLogging;
+ (void)basicLogging;
+ (BOOL)isLoggingEnabled;
+ (BOOL)isVerboseLoggingEnabled;


// Use AMZLog(fmt, ...); instead.
+ (void)logInfo:(NSString *)fmt, ... NS_FORMAT_FUNCTION(1, 2);

// Use AMZLogDebug(fmt, ...); instead.
+ (void)logDebug:(NSString *)fmt, ... NS_FORMAT_FUNCTION(1, 2);

@end