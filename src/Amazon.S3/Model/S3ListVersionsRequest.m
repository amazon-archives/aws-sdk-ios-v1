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

#import "S3ListVersionsRequest.h"

@implementation S3ListVersionsRequest

@synthesize prefix;
@synthesize keyMarker;
@synthesize versionIdMarker;
@synthesize delimiter;
@synthesize maxKeys;


-(NSMutableURLRequest *)configureURLRequest
{
    NSMutableString *endQueryString = [NSMutableString stringWithCapacity:512];

    if (self.maxKeys > 0) {
        [endQueryString appendFormat:@"&%@=%d", kS3QueryParamMaxKeys, self.maxKeys];
    }

    if (nil != self.prefix) {
        [endQueryString appendFormat:@"&%@=%@", kS3QueryParamPrefix, [AmazonSDKUtil urlEncode:self.prefix]];
    }

    if (nil != self.keyMarker) {
        [endQueryString appendFormat:@"&%@=%@", kS3QueryParamKeyMarker, [AmazonSDKUtil urlEncode:self.keyMarker]];
    }

    if (nil != self.versionIdMarker) {
        [endQueryString appendFormat:@"&%@=%@", kS3QueryParamVersionIdMarker, [AmazonSDKUtil urlEncode:self.versionIdMarker]];
    }

    if (nil != self.delimiter) {
        [endQueryString appendFormat:@"&%@=%@", kS3QueryParamDelimiter, [AmazonSDKUtil urlEncode:self.delimiter]];
    }

    NSString *queryString = nil;
    if ( [endQueryString length] > 0) {
        queryString = [NSString stringWithFormat:@"%@=%@", kS3SubResourceVersions, endQueryString];
    }
    else {
        queryString = kS3SubResourceVersions;
    }


    [self setSubResource:queryString];
    [super configureURLRequest];
    [self.urlRequest setHTTPMethod:kHttpMethodGet];

    return self.urlRequest;
}


-(void)dealloc
{
    [prefix release];
    [keyMarker release];
    [versionIdMarker release];
    [delimiter release];
    [super dealloc];
}

@end
