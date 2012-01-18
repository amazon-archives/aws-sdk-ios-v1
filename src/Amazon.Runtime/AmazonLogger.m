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

#import "AmazonLogger.h"

#define kDebugFileMaxSize    200 * 1024

@implementation AmazonLogger

+(void)verboseLogging
{
    char *envValue = "GTMVerboseLogging=1\0";

    putenv(envValue);
}

+(void)consoleLogger
{
    [[GTMLogger sharedLogger] setWriter:[NSFileHandle fileHandleWithStandardOutput]];
}

+(void)aslLogger
{
    [[GTMLogger sharedLogger] setWriter:[[GTMLogASLWriter alloc] init]];
}

+(void)fileLogger:(NSFileHandle *)file
{
    [[GTMLogger sharedLogger] setWriter:file];
}

+(NSFileHandle *)getFileHandle:(NSString *)filename forPath:(NSString *)path
{
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:path];
    NSString *logFilePath        = [NSString stringWithFormat:@"%@/%@", documentsDirectory, filename];

    // Trunicate file kDebugFileMaxSize or create if not found
    NSFileHandle *file = [NSFileHandle fileHandleForUpdatingAtPath:logFilePath];

    if (file) {
        unsigned long long maxFileOffset = [file seekToEndOfFile];
        if (maxFileOffset > kDebugFileMaxSize) {
            [file seekToFileOffset:maxFileOffset - kDebugFileMaxSize];
            NSMutableData *data = [NSMutableData dataWithData:[file readDataToEndOfFile]];
            [file seekToFileOffset:0];
            [file writeData:data];
            [file truncateFileAtOffset:kDebugFileMaxSize];
            [file seekToEndOfFile];
        }
    }
    else {
        [[NSFileManager defaultManager] createFileAtPath:logFilePath contents:nil attributes:nil];
        file = [NSFileHandle fileHandleForUpdatingAtPath:logFilePath];
    }

    return file;
}

+(void)consoleAslLogger
{
    NSArray *writers = [NSArray arrayWithObjects:[NSFileHandle fileHandleWithStandardOutput], [[GTMLogASLWriter alloc] init], nil];

    [[GTMLogger sharedLogger] setWriter:writers];
}

+(void)consoleFileLogger:(NSFileHandle *)file
{
    NSArray *writers = [NSArray arrayWithObjects:file, [[GTMLogASLWriter alloc] init], nil];

    [[GTMLogger sharedLogger] setWriter:writers];
}

+(void)consoleAslFileLogger:(NSFileHandle *)file
{
    NSArray *writers = [NSArray arrayWithObjects:file, [NSFileHandle fileHandleWithStandardOutput], [[GTMLogASLWriter alloc] init], nil];

    [[GTMLogger sharedLogger] setWriter:writers];
}


@end
