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

@implementation AmazonLogger

static BOOL isLoggingEnabled = YES;
static BOOL isVerboseLoggingEnabled = NO;

+ (void)turnLoggingOff
{ 
    isLoggingEnabled = NO;
}

+ (void)verboseLogging
{
    isVerboseLoggingEnabled = YES;
}

+ (void)logInfo:(NSString *)fmt, ...
{
    if(isLoggingEnabled)
    {
        va_list args;
        va_start(args, fmt);
        NSLog(@"%@", [[[NSString alloc] initWithFormat:fmt arguments:args] autorelease]);
        va_end(args);
    }
}

+ (void)logDebug:(NSString *)fmt, ...
{
    if(isLoggingEnabled && isVerboseLoggingEnabled)
    {
        va_list args;
        va_start(args, fmt);
        NSLog(@"%@", [[[NSString alloc] initWithFormat:fmt arguments:args] autorelease]);
        va_end(args);
    }
}

@end