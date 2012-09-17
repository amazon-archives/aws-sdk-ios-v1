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

#import "S3PutObjectRequest.h"
#import "AmazonMD5Util.h"

@implementation S3PutObjectRequest

@synthesize cacheControl;
@synthesize contentDisposition;
@synthesize contentEncoding;
@synthesize contentMD5;
@synthesize data;
@synthesize stream;
@synthesize expect;
@synthesize generateMD5;

-(id)init
{
    if (self = [super init])
    {
        expiresSet  = NO;
        generateMD5 = NO;
    }
    return self;
}

-(void)setExpires:(NSInteger)exp
{
    expires    = exp;
    expiresSet = YES;
}

-(NSInteger)expires
{
    return expires;
}

-(NSMutableURLRequest *)configureURLRequest
{
    [super configureURLRequest];

    if ((nil == self.contentMD5) && (YES == self.generateMD5)) {
        if (self.data != nil) {
            self.contentMD5 = [AmazonMD5Util base64md5FromData:self.data];
        }
        else {
            if (self.filename != nil) {
                NSInputStream *inputStream = [[NSInputStream alloc] initWithFileAtPath:filename];
                [inputStream open];

                self.contentMD5 = [AmazonMD5Util base64md5FromStream:inputStream];

                [inputStream close];
                [inputStream release];
            }
        }
    }

    [urlRequest setHTTPMethod:kHttpMethodPut];

    if (nil != self.expect) {
        [self.urlRequest setValue:self.expect forHTTPHeaderField:kHttpHdrExpect];
    }
    if (nil != self.contentMD5) {
        [self.urlRequest setValue:self.contentMD5 forHTTPHeaderField:kHttpHdrContentMD5];
    }
    if (nil != self.contentEncoding) {
        [self.urlRequest setValue:self.contentEncoding forHTTPHeaderField:kHttpHdrContentEncoding];
    }
    if (nil != self.contentDisposition) {
        [self.urlRequest setValue:self.contentDisposition forHTTPHeaderField:kHttpHdrContentDisposition];
    }
    if (nil != self.cacheControl) {
        [self.urlRequest setValue:self.cacheControl forHTTPHeaderField:kHttpHdrCacheControl];
    }

    if (expiresSet) {
        [self.urlRequest setValue:[NSString stringWithFormat:@"%d", self.expires] forHTTPHeaderField:kHttpHdrExpires];
    }

    if (self.stream != nil) {
        [self.urlRequest setHTTPBodyStream:self.stream];
    }
    else {
        [self.urlRequest setHTTPBody:data];
        if (self.contentLength < 1) {
            [self.urlRequest setValue:[NSString stringWithFormat:@"%d", [data length]] forHTTPHeaderField:kHttpHdrContentLength];
        }
    }

    return urlRequest;
}

-(id)initWithKey:(NSString *)aKey inBucket:(NSString *)aBucket
{
    if(self = [self init])
    {
        self.key    = aKey;
        self.bucket = aBucket;
    }

    return self;
}

-(void)setFilename:(NSString *)theFilename
{
    if (filename != nil) {
        [filename release];
        filename = nil;
    }

    filename = [theFilename retain];
}

-(NSString *)filename
{
    return filename;
}

- (AmazonClientException *)validate
{
    AmazonClientException *clientException = [super validate];
    
    if(clientException == nil)
    {
        if(self.filename != nil)
        {
            if (![[NSFileManager defaultManager] isReadableFileAtPath:self.filename]) {
                
                clientException = [AmazonClientException exceptionWithMessage:@"The specified file cannot be read."];
            }
            else {
                self.contentLength = [[[[NSFileManager defaultManager] attributesOfItemAtPath:self.filename 
                                                                                                    error:nil] 
                                                   valueForKey:NSFileSize] intValue];
                self.contentType   = [AmazonSDKUtil MIMETypeForExtension:[self.filename pathExtension]];
                
                @try {
                    self.stream = [[NSInputStream alloc] initWithFileAtPath:self.filename];
                }
                @catch (NSException *e) {
                    
                    clientException = [AmazonClientException exceptionWithMessage:
                                       [NSString stringWithFormat:@"Could not open file for streaming: %@", e.reason]];
                }
            }
        }
    }
    
    return clientException;
}

#ifdef DEBUG
-(void)connection:(NSURLConnection *)connection didSendBodyData:(NSInteger)bytesWritten totalBytesWritten:(NSInteger)totalBytesWritten totalBytesExpectedToWrite:(NSInteger)totalBytesExpectedToWrite
{
    AMZLog(@"Wrote %d bytes to the connection", bytesWritten);
}
#endif

-(void)dealloc
{
    [expect release];
    [contentMD5 release];
    [cacheControl release];
    [contentEncoding release];
    [contentDisposition release];
    [filename release];
    [stream release];
    [data release];

    [super dealloc];
}

@end
