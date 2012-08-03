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

#import "S3ListObjectsRequest.h"

@implementation S3ListObjectsRequest

@synthesize prefix;
@synthesize marker;
@synthesize delimiter;
@synthesize maxKeys;


-(NSMutableURLRequest *)configureURLRequest
{
    NSMutableString *queryString = [NSMutableString stringWithCapacity:512];

    if (nil != self.prefix) {
        [queryString appendFormat:@"%@=%@", kS3QueryParamPrefix, [AmazonSDKUtil urlEncode:self.prefix]];
    }

    if (nil != self.marker) {
        if ( [queryString length] > 0) {
            [queryString appendFormat:@"&"];
        }
        [queryString appendFormat:@"%@=%@", kS3QueryParamMarker, [AmazonSDKUtil urlEncode:self.marker]];
    }

    if (nil != self.delimiter) {
        if ( [queryString length] > 0) {
            [queryString appendFormat:@"&"];
        }
        [queryString appendFormat:@"%@=%@", kS3QueryParamDelimiter, [AmazonSDKUtil urlEncode:self.delimiter]];
    }

    if (self.maxKeys > 0) {
        if ( [queryString length] > 0) {
            [queryString appendFormat:@"&"];
        }
        [queryString appendFormat:@"%@=%d", kS3QueryParamMaxKeys, self.maxKeys];
    }

    if ([queryString length] > 0) {
        [self setSubResource:queryString];
    }

    [super configureURLRequest];
    [self.urlRequest setHTTPMethod:kHttpMethodGet];

    return self.urlRequest;
}

-(id)initWithName:(NSString *)theBucketName
{
    self = [self init];
    if (self != nil) {
        self.bucket = theBucketName;
    }

    return self;
}

-(void)dealloc
{
    [prefix release];
    [marker release];
    [delimiter release];

    [super dealloc];
}

@end
