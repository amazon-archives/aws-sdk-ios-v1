/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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


#import "S3UploadInputStream.h"
#import "S3Constants.h"
#import "AmazonLogger.h"

@implementation S3UploadInputStream

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
-(id)init 
{
    if ((self = [super init]) != nil) {
        _delay = 0.0;
        _packetSize = 32;
        _stream = nil;
    }
    
    return self;    
}

+(id)inputStreamWithData:(NSData *)data
{
	S3UploadInputStream *uploadStream = [[S3UploadInputStream new] autorelease];
    if(data)
    {
        [uploadStream setStream:[NSInputStream inputStreamWithData:data]];
    }
	return uploadStream;
}

+(id)inputStreamWithFileAtPath:(NSString *)path
{
	S3UploadInputStream *uploadStream = [[[S3UploadInputStream alloc] init] autorelease];
	[uploadStream setStream:[NSInputStream inputStreamWithFileAtPath:path]];
	return uploadStream;
}

+(id)inputStreamWithStream:(NSInputStream *)aStream
{
	S3UploadInputStream *uploadStream = [[[S3UploadInputStream alloc] init] autorelease];
	[uploadStream setStream:aStream];
	return uploadStream;
}

-(NSInteger)read:(uint8_t *)buffer maxLength:(NSUInteger)len
{
	NSInteger nBytesRead = [self.stream read:buffer maxLength:(kS3UploadInputStreamChunkSize * self.packetSize)];
	AMZLogDebug(@"S3UploadInputStream: read %ld bytes (%lu max)", (long)nBytesRead, (unsigned long)len);
	[NSThread sleepForTimeInterval:self.delay];
	return nBytesRead;
}

-(BOOL)hasBytesAvailable
{
	return [self.stream hasBytesAvailable];
}

- (BOOL)getBuffer:(uint8_t **)buffer length:(NSUInteger *)len
{
	return NO;
}

/*
 * Implement NSInputStream mandatory methods to make sure they are implemented
 * (necessary for MacRuby for example) and avoid the overhead of method
 * forwarding for these common methods.
 */
- (void)open
{
	[self.stream open];
}

- (void)close
{
	[self.stream close];
}

- (id)delegate
{
	return [self.stream delegate];
}

- (void)setDelegate:(id)delegate
{
	[self.stream setDelegate:delegate];
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode
{
	[self.stream scheduleInRunLoop:aRunLoop forMode:mode];
}

- (void)removeFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSString *)mode
{
	[self.stream removeFromRunLoop:aRunLoop forMode:mode];
}

- (id)propertyForKey:(NSString *)key
{
	return [self.stream propertyForKey:key];
}

- (BOOL)setProperty:(id)property forKey:(NSString *)key
{
	return [self.stream setProperty:property forKey:key];
}

- (NSStreamStatus)streamStatus
{
	return [self.stream streamStatus];
}

- (NSError *)streamError
{
	return [self.stream streamError];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
	return [self.stream methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
	[anInvocation invokeWithTarget:self.stream];
}

-(void)dealloc
{
	[_stream release];
	
	[super dealloc];
}
#pragma clang diagnostic pop

@end
