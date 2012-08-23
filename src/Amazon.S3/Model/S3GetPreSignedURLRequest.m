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

#import "S3GetPreSignedURLRequest.h"


@implementation S3GetPreSignedURLRequest

@synthesize expires;
@synthesize protocol;
@synthesize httpVerb;
@synthesize accessKey;
@synthesize versionId;
@synthesize responseHeaderOverrides;

-(AmazonURLRequest *)configureURLRequest
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

    if (nil == self.protocol) {
        self.protocol = @"https";
    }

    if (self.httpVerb == nil) {
        self.httpVerb = kHttpMethodGet;
    }

    [self setHttpMethod:self.httpVerb];
    [self.urlRequest setHTTPMethod:self.httpVerb];

    NSInteger epoch = (int)[self.expires timeIntervalSince1970];
    [self.urlRequest setValue:[NSString stringWithFormat:@"%d", epoch] forHTTPHeaderField:@"Date"];

    return self.urlRequest;
}

-(NSString *)queryString
{
    // Access Key
    NSMutableString *queryString = [NSMutableString stringWithCapacity:512];

    // Security Token
    if ( self.securityToken != nil ) {
        [queryString appendFormat:@"%@=%@&", kHttpHdrAmzSecurityToken, [AmazonSDKUtil urlEncode:self.securityToken]];        
    }

    [queryString appendFormat:@"%@=%@", kS3QueryParamAccessKey, [AmazonSDKUtil urlEncode:self.accessKey]];

    // HEAD special case
    if ([self.httpVerb isEqualToString:kHttpMethodHead]) {
        [queryString appendFormat:@"&%@=0", kS3QueryParamMaxKeys];
    }

    NSInteger epoch = (int)[self.expires timeIntervalSince1970];
    [queryString appendFormat:@"&%@=%d", kS3QueryParamExpires, epoch];


    if (self.responseHeaderOverrides != nil) {
        [queryString appendFormat:@"&%@", self.responseHeaderOverrides.queryString];
    }

    // Version
    if (self.versionId != nil) {
        [queryString appendFormat:@"&%@=%@", kS3SubResourceVersionId, self.versionId];
    }

    return queryString;
}

- (AmazonClientException *)validate
{
    AmazonClientException *clientException = [super validate];
    
    if(clientException == nil)
    {
        // HTTP Verb
        if (!([self.httpVerb isEqualToString:kHttpMethodGet] ||
              [self.httpVerb isEqualToString:kHttpMethodHead] ||
              [self.httpVerb isEqualToString:kHttpMethodPut])) {
            clientException = [AmazonClientException exceptionWithMessage:@"httpVerb must be GET, HEAD, or PUT."];
        }
        // Expires
        else if (self.expires == nil) {
            clientException = [AmazonClientException exceptionWithMessage:@"expires must not be nil."];
        }
    }
    
    return clientException;
}

-(void)dealloc
{
    [expires release];
    [protocol release];
    [httpVerb release];
    [accessKey release];
    [versionId release];
    [responseHeaderOverrides release];

    [super dealloc];
}

@end
