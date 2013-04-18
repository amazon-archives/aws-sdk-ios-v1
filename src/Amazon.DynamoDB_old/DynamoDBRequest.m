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

#import "DynamoDBRequest.h"
#import "DynamoDBResponse.h"
#import <CommonCrypto/CommonDigest.h>

@implementation DynamoDBRequest

@synthesize content;

-(NSMutableURLRequest *)configureURLRequest
{
    [self.urlRequest setHTTPMethod:@"POST"];

    [self addValue:self.hostName forHeader:@"Host"];
    if (self.credentials.securityToken != nil) {
        [self addValue:self.credentials.securityToken forHeader:@"x-amz-security-token"];
    }
    [AmazonAuthUtils signRequestV4:self headers:headers payload:self.content credentials:self.credentials];
    [self addValue:self.userAgent forHeader:@"User-Agent"];
    for (NSString *header in headers) {
        [self.urlRequest setValue:[headers valueForKey:header] forHTTPHeaderField:header];
    }

    [self.urlRequest setHTTPBody:[content dataUsingEncoding:NSUTF8StringEncoding]];

    NSURL *url = [NSURL URLWithString:self.endpoint];
    [urlRequest setURL:url];

    return self.urlRequest;
}

-(void)addValue:(NSString *)theValue forHeader:(NSString *)theHeader
{
    if (nil == headers) {
        headers = [[NSMutableDictionary alloc] initWithCapacity:1];
    }
    [headers setValue:theValue forKey:theHeader];
}

-(DynamoDBResponse*)constructResponse
{
    return [[DynamoDBResponse new] autorelease];
}

-(void)dealloc
{
    [headers release];
    [content release];

    [super dealloc];
}

@end
