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

#import "S3ResponseHeaderOverrides.h"

// Category for accumulating Query parameters
@interface NSMutableString (S3ResponseHeaderOverrides)

-(void)appendQueryParameter:(NSString *)key withValue:(NSString *)value;

@end

@implementation NSMutableString (S3ResponseHeaderOverrides)

-(void)appendQueryParameter:(NSString *)key withValue:(NSString *)value
{
    if (nil == value) {
        return;
    }

    [self appendString:[NSString stringWithFormat:@"%@%@=%@", [self length] > 0 ? @"&":@"", key, [value stringWithURLEncoding]]];
}

@end

// Implementation
@implementation S3ResponseHeaderOverrides

@synthesize contentType;
@synthesize contentLanguage;
@synthesize expires;
@synthesize cacheControl;
@synthesize contentDisposition;
@synthesize contentEncoding;

-(NSString *)queryString
{
    NSMutableString *queryString = [[NSMutableString alloc] initWithString:@""];

    // These have to be added in lexical order

    [queryString appendQueryParameter:kS3ResponseHdrCacheControl withValue:self.cacheControl];
    [queryString appendQueryParameter:kS3ResponseHdrContentDisposition withValue:self.contentDisposition];
    [queryString appendQueryParameter:kS3ResponseHdrContentEncoding withValue:self.contentEncoding];
    [queryString appendQueryParameter:kS3ResponseHdrContentLanguage withValue:self.contentLanguage];
    [queryString appendQueryParameter:kS3ResponseHdrContentType withValue:self.contentType];
    [queryString appendQueryParameter:kS3ResponseHdrExpires withValue:self.expires];

    NSString *retVal = [NSString stringWithString:queryString];

    [queryString release];

    return retVal;
}

-(void)dealloc
{
    [contentType release];
    [contentLanguage release];
    [expires release];
    [cacheControl release];
    [contentEncoding release];

    [super dealloc];
}

@end
