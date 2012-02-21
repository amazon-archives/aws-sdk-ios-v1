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

#import "S3DeleteObjectsRequest.h"
#import "AmazonMD5Util.h"

@implementation S3DeleteObjectsRequest

@synthesize mfaAuth, objects, quiet;

-(id)init
{
    self = [super init];
    if (self)
    {
        quiet        = NO;
        self.objects = [NSMutableArray array];
    }

    return self;
}

-(NSMutableURLRequest *)configureURLRequest
{
    [self setSubResource:kS3SubResourceDelete];

    [super configureURLRequest];

    [self.urlRequest setHTTPMethod:kHttpMethodPost];

    if (nil != self.mfaAuth)
    {
        [urlRequest setValue:self.mfaAuth forHTTPHeaderField:kHttpHdrAmzMfa];
    }

    NSData *data = [[self toXml] dataUsingEncoding:NSUTF8StringEncoding];

    [self.urlRequest setValue:[AmazonMD5Util base64md5FromData:data] forHTTPHeaderField:kHttpHdrContentMD5];
    [self.urlRequest setValue:[NSString stringWithFormat:@"%d", [data length]] forHTTPHeaderField:kHttpHdrContentLength];
    [self.urlRequest setValue:@"text/xml" forHTTPHeaderField:kHttpHdrContentType];

    [self.urlRequest setHTTPBody:data];

    return urlRequest;
}

-(NSString *)toXml
{
    NSString *innerXml = @"";

    if (self.quiet == YES)
    {
        innerXml = [innerXml stringByAppendingString:@"<Quiet>true</Quiet>"];
    }
    for (S3KeyVersion *kv in self.objects)
    {
        innerXml = [innerXml stringByAppendingString:[kv toXml]];
    }

    return [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?><Delete>%@</Delete>", innerXml];
}

-(void)dealloc
{
    [mfaAuth release];
    [objects release];

    [super dealloc];
}

@end
