/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "S3RestoreObjectRequest.h"

@implementation S3RestoreObjectRequest

@synthesize days=_days;

-(id)initWithKey:(NSString *)aKey withBucket:(NSString *)aBucket withDays:(NSInteger)theDays
{
    if (self = [self init]) {
        self.bucket    = aBucket;
        self.key       = aKey;
        self.days      = theDays;
    }

    return self;
}

-(NSString *) toXml
{
    NSMutableString *xml = [[NSMutableString alloc] init];
    
    [xml appendString:@"<RestoreRequest xmlns=\"http://s3.amazonaws.com/doc/2006-03-01\">"];
    [xml appendFormat:@"<Days>%d</Days>", self.days];
    [xml appendString:@"</RestoreRequest>"];
    
    NSString *retval = [NSString stringWithString:xml];
    [xml release];
    
    return retval;
}

-(NSMutableURLRequest *)configureURLRequest
{
    self.subResource = kS3SubResourceRestore;

    [super configureURLRequest];

    [urlRequest setHTTPMethod:kHttpMethodPost];
    [self.urlRequest setHTTPBody:nil];
    
    NSData *data = [[self toXml] dataUsingEncoding:NSUTF8StringEncoding];
    
    [self.urlRequest setValue:[NSString stringWithFormat:@"%d", [data length]] forHTTPHeaderField:kHttpHdrContentLength];
    [self.urlRequest setValue:@"text/xml" forHTTPHeaderField:kHttpHdrContentType];
    [self.urlRequest setHTTPBody:data];
    
    return urlRequest;

    return urlRequest;
}

-(void) dealloc
{
    [super dealloc];
}

@end
