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

#import "S3CompleteMultipartUploadRequest.h"


@implementation S3CompleteMultipartUploadRequest

@synthesize uploadId;

-(id)initWithMultipartUpload:(S3MultipartUpload *)multipartUpload
{
    if(self = [super init])
    {
        self.bucket   = multipartUpload.bucket;
        self.key      = multipartUpload.key;
        self.uploadId = multipartUpload.uploadId;
    }

    return self;
}

-(NSURLRequest *)configureURLRequest
{
    [self setSubResource:[NSString stringWithFormat:@"%@=%@", kS3QueryParamUploadId, self.uploadId]];

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodPost];

    [urlRequest setHTTPBody:[self requestBody]];
    [urlRequest setValue:[NSString stringWithFormat:@"%d", [[urlRequest HTTPBody] length]] forHTTPHeaderField:kHttpHdrContentLength];
    [urlRequest setValue:@"text/xml" forHTTPHeaderField:kHttpHdrContentType];

    return urlRequest;
}

-(void)addPartWithPartNumber:(int)partNumber withETag:(NSString *)etag
{
    if (nil == parts) {
        parts = [[NSMutableDictionary alloc] init];
    }

    [parts setObject:etag forKey:[NSNumber numberWithInt:partNumber]];
}

-(NSData *)requestBody
{
    NSMutableString *xml = [NSMutableString stringWithFormat:@"<CompleteMultipartUpload>"];

    NSComparator    comparePartNumbers = ^ (id part1, id part2) {
        return [part1 compare:part2];
    };

    NSArray *keys = [[parts allKeys] sortedArrayUsingComparator:comparePartNumbers];
    for (NSNumber *partNumber in keys)
    {
        [xml appendFormat:@"<Part><PartNumber>%d</PartNumber><ETag>%@</ETag></Part>", [partNumber integerValue], [parts objectForKey:partNumber]];
    }

    [xml appendString:@"</CompleteMultipartUpload>"];

    return [xml dataUsingEncoding:NSUTF8StringEncoding];
}

-(void)dealloc
{
    [uploadId release];
    [parts release];

    [super dealloc];
}

@end
