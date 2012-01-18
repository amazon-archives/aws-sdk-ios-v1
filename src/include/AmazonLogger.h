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
#import "GTMLogger.h"
#import "GTMDefines.h"
#import "GTMLogger+ASL.h"

#ifdef AMAZON_LOGGER_DEBUG
#undef NSLog
#define NSLog    GTMLoggerDebug
#endif


#ifdef AMAZON_LOGGER_RELEASE
#undef NSLog
#define NSLog    GTMLoggerInfo
#endif

#define AMZLog(...)         [[GTMLogger sharedLogger] logInfo : __VA_ARGS__]
#define AMZLogDebug(...)    [[GTMLogger sharedLogger] logDebug : __VA_ARGS__]


@interface AmazonLogger:NSObject {
}

+(void)verboseLogging;
+(void)consoleLogger;
+(void)aslLogger;
+(void)fileLogger:(NSFileHandle *)file;
+(void)consoleAslLogger;
+(void)consoleFileLogger:(NSFileHandle *)file;
+(void)consoleAslFileLogger:(NSFileHandle *)file;

+(NSFileHandle *)getFileHandle:(NSString *)filename forPath:(NSString *)path;

@end
