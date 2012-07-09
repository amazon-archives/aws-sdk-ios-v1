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

#import "DynamoDBRequest.h"
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

-(NSString *)generateAuthorization3
{
    NSMutableString *buffer = [[[NSMutableString alloc] initWithCapacity:256] autorelease];

    [buffer appendString:@"AWS3 "];
    [buffer appendString:[NSString stringWithFormat:@"AWSAccessKeyId=%@,", self.credentials.accessKey]];
    [buffer appendString:@"Algorithm=HmacSHA256,"];

    [buffer appendString:@"SignedHeaders="];
    NSArray *headersToSign = [self headersToSign];
    for (int i = 0; i < [headersToSign count]; i++) {
        if (i > 0) {
            [buffer appendString:@";"];
        }
        [buffer appendString:[headersToSign objectAtIndex:i]];
    }
    [buffer appendString:@","];

    [buffer appendString:[NSString stringWithFormat:@"Signature=%@", [self generateSignature]]];

    return buffer;
}

-(NSString *)generateSignature
{
    NSString *stringToSign = [self generateStringToSign];
    NSData   *dataToSign   = [AmazonAuthUtils hash:[stringToSign dataUsingEncoding:NSUTF8StringEncoding]];

    return [AmazonAuthUtils HMACSign:dataToSign withKey:self.credentials.secretKey usingAlgorithm:kCCHmacAlgSHA256];
}

-(NSString *)generateStringToSign
{
    NSMutableString *stringToSign = [[[NSMutableString alloc] initWithCapacity:256] autorelease];

    [stringToSign appendString:@"POST\n"];
    [stringToSign appendString:@"/\n"];
    [stringToSign appendString:@"\n"];

    NSArray *headersToSign = [self headersToSign];
    for (NSString *header in headersToSign) {
        [stringToSign appendString:[NSString stringWithFormat:@"%@:%@\n", [header lowercaseString], [headers valueForKey:header]]];
    }

    [stringToSign appendString:@"\n"];
    [stringToSign appendString:[NSString stringWithFormat:@"%@", content]];

    return stringToSign;
}

-(NSArray *)headersToSign
{
    NSMutableArray *headersToSign = [[[NSMutableArray alloc] initWithCapacity:1] autorelease];
    for (NSString *header in [headers allKeys]) {
        NSString *lowerCaseHeader = [header lowercaseString];

        if ( [lowerCaseHeader hasPrefix:@"x-amz"] || [lowerCaseHeader isEqualToString:@"host"]) {
            [headersToSign addObject:header];
        }
    }

    [headersToSign sortUsingSelector:@selector(caseInsensitiveCompare:)];

    return headersToSign;
}

-(void)addValue:(NSString *)theValue forHeader:(NSString *)theHeader
{
    if (nil == headers) {
        headers = [[NSMutableDictionary alloc] initWithCapacity:1];
    }
    [headers setValue:theValue forKey:theHeader];
}

-(void)dealloc
{
    [headers release];
    [content release];

    [super dealloc];
}

@end
