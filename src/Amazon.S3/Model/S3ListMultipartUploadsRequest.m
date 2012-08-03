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

#import "S3ListMultipartUploadsRequest.h"


@implementation S3ListMultipartUploadsRequest

@synthesize delimiter;
@synthesize keyMarker;
@synthesize prefix;
@synthesize uploadIdMarker;

-(id)init
{
    if (self = [super init]) {
        maxUploads      = 1000;
        maxUploadsIsSet = NO;
    }

    return self;
}

-(NSMutableURLRequest *)configureURLRequest
{
    NSMutableString *subresource = [NSMutableString stringWithString:kS3SubResourceUploads];

    if (nil != self.delimiter) {
        [subresource appendFormat:@"&delimiter=%@", self.delimiter];
    }
    if (nil != self.keyMarker) {
        [subresource appendFormat:@"&key-marker=%@", self.keyMarker];
    }
    if (maxUploadsIsSet) {
        [subresource appendFormat:@"&max-uploads=%d", self.maxUploads];
    }
    if (nil != self.prefix) {
        [subresource appendFormat:@"&prefix=%@", self.prefix];
    }
    if (nil != self.uploadIdMarker) {
        [subresource appendFormat:@"&upload-id-marker=%@", self.uploadIdMarker];
    }

    [self setSubResource:[NSString stringWithString:subresource]];

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodGet];

    return urlRequest;
}

-(void)setMaxUploads:(NSInteger)max
{
    maxUploads      = max;
    maxUploadsIsSet = YES;
}

-(NSInteger)maxUploads
{
    return maxUploads;
}

-(void) dealloc
{
    [delimiter release];
    [keyMarker release];
    [prefix release];
    [uploadIdMarker release];

    [super dealloc];
}

@end
