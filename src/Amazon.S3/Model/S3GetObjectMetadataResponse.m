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

#import "S3GetObjectMetadataResponse.h"

@implementation S3GetObjectMetadataResponse

@synthesize missingMeta;

-(void)setValue:(id)value forHTTPHeaderField:(NSString *)header
{
    [super setValue:value forHTTPHeaderField:header];
}

-(BOOL)ongoingRestore
{
    NSString *restore = [super valueForHTTPHeaderField:@"X-Amz-Restore"];
    if (restore == nil) {
        return NO;
    }
    
    //x-amz-restore: ongoing-request="false", expiry-date="Fri, 23 Dec 2012 00:00:00 GMT"
    NSRange ongoing = [restore rangeOfString:@"ongoing-request=\"true\""];
    
    return (ongoing.location != NSNotFound);
}

-(NSDate *)restoreExpiry
{
    NSString *restore = [super valueForHTTPHeaderField:@"X-Amz-Restore"];
    if (restore == nil) {
        return nil;
    }
    
    //x-amz-restore: ongoing-request="false", expiry-date="Fri, 23 Dec 2012 00:00:00 GMT"
    NSRange expiry = [restore rangeOfString:@"expiry-date=\""];
    if (expiry.location == NSNotFound) {
        return nil;
    }
    
    NSString *trimmed = [restore substringFromIndex:(expiry.location + expiry.length)];
    trimmed = [trimmed substringToIndex:trimmed.length-1];
    
    return [NSDate dateWithRFC822Format:trimmed];
}

@end
