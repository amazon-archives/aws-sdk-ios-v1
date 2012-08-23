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

#import "S3GetObjectRequest.h"

@implementation S3GetObjectRequest

@synthesize ifModifiedSince;
@synthesize ifUnmodifiedSince;
@synthesize ifMatch;
@synthesize ifNoneMatch;
@synthesize outputStream;
@synthesize rangeStart;
@synthesize rangeEnd;
@synthesize versionId;
@synthesize responseHeaderOverrides;

-(id)initWithKey:(NSString *)aKey withBucket:(NSString *)aBucket
{
    if (self = [self init]) {
        self.bucket = aBucket;
        self.key    = aKey;
    }

    return self;
}

-(id)initWithKey:(NSString *)aKey withBucket:(NSString *)aBucket withVersionId:(NSString *)aVersionId
{
    if (self = [self init]) {
        self.bucket    = aBucket;
        self.key       = aKey;
        self.versionId = aVersionId;
    }

    return self;
}


-(NSMutableURLRequest *)configureURLRequest
{
    NSMutableString *queryString = [NSMutableString stringWithCapacity:512];

    if (self.responseHeaderOverrides != nil) {
        [queryString appendString:self.responseHeaderOverrides.queryString];
    }

    if (nil != self.versionId) {
        [queryString appendString:[NSString stringWithFormat:@"%@%@=%@", [queryString length] > 0 ? @"&":@"", kS3SubResourceVersionId, self.versionId]];
    }

    self.subResource = queryString;

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodGet];
    [self.urlRequest setHTTPBody:nil];

    if (nil != self.ifModifiedSince) {
        [urlRequest setValue:[self.ifModifiedSince requestFormat] forHTTPHeaderField:kHttpHdrIfModified];
    }
    if (nil != self.ifUnmodifiedSince) {
        [urlRequest setValue:[self.ifUnmodifiedSince requestFormat] forHTTPHeaderField:kHttpHdrIfUnmodified];
    }
    if (nil != self.ifMatch) {
        [urlRequest setValue:self.ifMatch forHTTPHeaderField:kHttpHdrIfMatch];
    }
    if (nil != self.ifNoneMatch) {
        [urlRequest setValue:self.ifNoneMatch forHTTPHeaderField:kHttpHdrIfNoneMatch];
    }

    if (rangeSet) {
        [urlRequest setValue:[self getRange] forHTTPHeaderField:kHttpHdrRange];
    }

    return urlRequest;
}

-(NSString *)getRange
{
    if (rangeSet) {
        return [NSString stringWithFormat:@"bytes=%lld-%lld", rangeStart, rangeEnd];
    }

    return nil;
}

-(void)setRangeStart:(int64_t)start rangeEnd:(int64_t)end
{
    rangeStart = start;
    rangeEnd   = end;
    rangeSet   = YES;
}

- (AmazonClientException *)validate
{
    AmazonClientException *clientException = [super validate];
    
    if(clientException == nil)
    {
        if(rangeSet == YES)
        {
            if (rangeEnd <= rangeStart) {
                clientException = (AmazonClientException *)[AmazonClientException exceptionWithName:@"Invalid range" 
                                                                    reason:@"rangeEnd must be larger than rangeStart" 
                                                                  userInfo:nil];
                rangeSet = NO;
            }
        }
    }
    
    return clientException;
}

-(void) dealloc
{
    [ifModifiedSince release];
    [ifUnmodifiedSince release];
    [ifMatch release];
    [ifNoneMatch release];
    [responseHeaderOverrides release];
    [versionId release];

    [super dealloc];
}

@end
