/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "S3GetPreSignedURLRequest.h"


@implementation S3GetPreSignedURLRequest

@synthesize expires;
@synthesize protocol;
@synthesize httpVerb;
@synthesize accessKey;
@synthesize responseHeaderOverrides;

-(AmazonURLRequest *)configureURLRequest
{
    if (self.responseHeaderOverrides != nil) {
        [self setSubResource:self.responseHeaderOverrides.queryString];
    }

    [super configureURLRequest];

    if (nil == self.protocol) {
        self.protocol = @"https";
    }

    if (self.httpVerb == nil) {
        self.httpVerb = kHttpMethodGet;
    }

    // HTTP Verb
    if (!([self.httpVerb isEqualToString:kHttpMethodGet] ||
          [self.httpVerb isEqualToString:kHttpMethodHead] ||
          [self.httpVerb isEqualToString:kHttpMethodPut])) {
        @throw [AmazonClientException exceptionWithMessage : @"httpVerb must be GET, HEAD, or PUT."];
    }
    [self setHttpMethod:self.httpVerb];

    // Expires
    if (self.expires == nil) {
        @throw [AmazonClientException exceptionWithMessage : @"expires must not be nil."];
    }

    int epoch = (int)[self.expires timeIntervalSince1970];
    [self.urlRequest setValue:[NSString stringWithFormat:@"%d", epoch] forHTTPHeaderField:@"Date"];

    return self.urlRequest;
}

-(NSString *)queryString
{
    // Access Key
    NSMutableString *queryString = [NSMutableString stringWithCapacity:512];

    [queryString appendFormat:@"%@=%@", kS3QueryParamAccessKey, self.accessKey];

    // HEAD special case
    if ([self.httpVerb isEqualToString:kHttpMethodHead]) {
        [queryString appendFormat:@"%@=0", kS3QueryParamMaxKeys];
    }

    // Expires
    if (self.expires == nil) {
        @throw [AmazonClientException exceptionWithMessage : @"expires must not be nil."];
    }

    int epoch = (int)[self.expires timeIntervalSince1970];
    [queryString appendFormat:@"&%@=%d", kS3QueryParamExpires, epoch];

    if (self.responseHeaderOverrides != nil) {
        [queryString appendFormat:@"&%@", self.responseHeaderOverrides.queryString];
    }

    return queryString;
}

-(void)dealloc
{
    [expires release];
    [protocol release];
    [httpVerb release];
    [accessKey release];
    [responseHeaderOverrides release];

    [super dealloc];
}

@end
