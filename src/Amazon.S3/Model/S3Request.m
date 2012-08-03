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

#import "S3Request.h"
#import "S3BucketNameUtilities.h"

@implementation S3Request

#pragma mark Properties

@synthesize authorization;
@synthesize contentLength;
@synthesize contentType;
@synthesize securityToken;
@synthesize bucket;
@synthesize key;
@synthesize subResource;

#pragma mark methods

-(AmazonURLRequest *)configureURLRequest
{
    [super configureURLRequest];
    [self setHttpMethod:kHttpMethodGet];

    [self.urlRequest setValue:[NSString stringWithFormat:@"%lld", self.contentLength] forHTTPHeaderField:kHttpHdrContentLength];

    [self.urlRequest setValue:self.host forHTTPHeaderField:kHttpHdrHost];
    [self.urlRequest setValue:[self.date requestFormat] forHTTPHeaderField:kHttpHdrDate];

    if (nil != self.httpMethod) {
        [self.urlRequest setHTTPMethod:self.httpMethod];
    }
    if (nil != self.contentType) {
        [self.urlRequest setValue:self.contentType forHTTPHeaderField:kHttpHdrContentType];
    }
    if (nil != self.securityToken) {
        [self.urlRequest setValue:self.securityToken forHTTPHeaderField:kHttpHdrAmzSecurityToken];
    }

    [self.urlRequest setURL:self.url];

    return urlRequest;
}

-(NSString *)timestamp
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];

    [dateFormatter setDateFormat:kS3DateFormat];
    [dateFormatter setLocale:[AmazonSDKUtil timestampLocale]];

    return [dateFormatter stringFromDate:[self date]];
}

#pragma mark accessors

-(NSURL *)url
{
    NSString *keyPath;
    NSString *resQuery;

    if (self.bucket == nil || [S3BucketNameUtilities isDNSBucketName:self.bucket]) {
        keyPath  = (self.key == nil ? @"" : [NSString stringWithFormat:@"/%@", [self.key stringWithURLEncoding]]);
        resQuery = (self.subResource == nil ? @"" : [NSString stringWithFormat:@"%@?%@", self.key == nil ? @"/":@"", self.subResource]);
    }
    else {
        keyPath  = (self.key == nil ? [NSString stringWithFormat:@"/%@/", self.bucket] : [NSString stringWithFormat:@"/%@/%@", self.bucket, [self.key stringWithURLEncoding]]);
        resQuery = (self.subResource == nil ? @"" : [NSString stringWithFormat:@"?%@", self.subResource]);
    }

    return [NSURL URLWithString:[NSString stringWithFormat:@"%@://%@%@%@", [self protocol], self.host, keyPath, resQuery]];
}

-(NSString *)host
{
    if (nil != self.bucket) {
        if ( [S3BucketNameUtilities isDNSBucketName:self.bucket]) {
            return [NSString stringWithFormat:@"%@.%@", self.bucket, [self endpointHost]];
        }
    }

    return [self endpointHost];
}

-(NSDate *)date
{
    if (date == nil) {
        date = [NSDate date];
    }
    return date;
}

-(void)setDate:(NSDate *)aDate
{
    date = aDate;
}

-(NSString *)protocol
{
    if ( [self.endpoint hasPrefix:@"http://"]) {
        return @"http";
    }
    else {
        return @"https";
    }
}

-(NSString *)endpointHost
{
    if (self.endpoint == nil) {
        return nil;
    }
    else {
        NSRange startOfHost = [self.endpoint rangeOfString:@"://"];
        return [self.endpoint substringFromIndex:(startOfHost.location + 3)];
    }
}


#pragma mark memory management

-(void)dealloc
{
    delegate = nil;

    [authorization release];
    [contentType release];
    [securityToken release];
    [httpMethod release];
    [subResource release];
    [key release];
    [bucket release];

    [super dealloc];
}

@end

#pragma mark Categories

@implementation NSDate (WithS3RequestFormat)

-(NSString *)requestFormat
{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];

    [dateFormatter setDateFormat:kS3DateFormat];
    [dateFormatter setLocale:[AmazonSDKUtil timestampLocale]];

    return [dateFormatter stringFromDate:self];
}

@end

