/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AmazonAuthUtils.h"

static char base64EncodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation AmazonAuthUtils

+(NSString*)getAuthorization:(NSString*)timestamp forBucket:(NSString*)bucket forVerb:(NSString*)verb accessKey:(NSString*)accessKey secretKey:(NSString*)secretKey {
	NSString* signature = [AmazonAuthUtils getSignature:timestamp forBucket:bucket forVerb:verb secretKey:secretKey];	
	return [NSString stringWithFormat:@"AWS %@:%@", accessKey, signature];
}

+(NSString*)getSignature:(NSString*)timestamp forBucket:(NSString*)bucket forVerb:(NSString*)httpVerb secretKey:(NSString*)secretKey {
	NSString* contentMd5 = @"";
	NSString* contentType = @"";//@"application/text";
	NSString* canonicalizedAmzHeaders = @"";	
	NSString* canonicalizedResource = nil;
	if ( bucket == nil ) {
		canonicalizedResource = @"/";
	}
	else {
		canonicalizedResource = [NSString stringWithFormat:@"/%@/", bucket];
	}
	
	NSString* stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@%@", httpVerb, contentMd5, contentType, timestamp, canonicalizedAmzHeaders, canonicalizedResource]; 		
	return [AmazonAuthUtils HMACSign:[stringToSign dataUsingEncoding:NSASCIIStringEncoding] withKey:secretKey usingAlgorithm:kCCHmacAlgSHA1];
}

+ (NSString *) HMACSign:(NSData *)data withKey:(NSString *)key usingAlgorithm:(CCHmacAlgorithm)algorithm
{
	CCHmacContext context;
	const char *keyCString = [key cStringUsingEncoding:NSASCIIStringEncoding];
	CCHmacInit(&context, algorithm, keyCString, strlen(keyCString));
	CCHmacUpdate(&context, [data bytes], [data length]);
	
	// Both SHA1 and SHA256 will fit in here
	unsigned char digestRaw[CC_SHA256_DIGEST_LENGTH];
	
	int digestLength;
	
	switch (algorithm) {
		case kCCHmacAlgSHA1:
			digestLength = CC_SHA1_DIGEST_LENGTH;
			break;
		case kCCHmacAlgSHA256:
			digestLength = CC_SHA256_DIGEST_LENGTH;
			break;
		default:
			digestLength = -1;
			break;
	}
	
	if (digestLength < 0) {
		@throw [AmazonSignatureException exceptionWithName:kError_Invalid_Hash_Alg 
											  reason:kReason_Invalid_Hash_Alg 
											userInfo:nil];
	}
	
	CCHmacFinal(&context, digestRaw);
	
	NSData *digestData = [NSData dataWithBytes:digestRaw length:digestLength];
	
	return [digestData base64EncodedString];
}

@end


@implementation NSData (WithBase64)

- (NSString *) base64EncodedString
{
	NSMutableString *result;
	unsigned char   *raw;
	unsigned long length;
	short i, nCharsToWrite;
	long cursor;
	unsigned char inbytes[3], outbytes[4];
	
	length = [self length];
	
	if (length < 1)
		return @"";
	
	result = [NSMutableString stringWithCapacity:length];
	raw = (unsigned char *)[self bytes];
	
	// Take 3 chars at a time, and encode to 4
	for (cursor = 0; cursor < length; cursor += 3) {
		
		for (i = 0; i < 3; i++) {
			if (cursor + i < length) 
				inbytes[i] = raw[cursor + i];
			else 
				inbytes[i] = 0;
		}
		
		outbytes[0] = (inbytes[0] & 0xFC) >> 2;
		outbytes[1] = ((inbytes[0] & 0x03) << 4) | ((inbytes[1] & 0xF0) >> 4);
		outbytes[2] = ((inbytes[1] & 0x0F) << 2) | ((inbytes[2] & 0xC0) >> 6);
		outbytes[3] = inbytes[2] & 0x3F;
		
		nCharsToWrite = 4;
		
		switch (length - cursor) {
			case 1:
				nCharsToWrite = 2;
				break;
			case 2:
				nCharsToWrite = 3;
				break;
		}
		
		for (i = 0; i < nCharsToWrite; i++) {
			[result appendFormat:@"%c", base64EncodingTable[outbytes[i]]];
		}
		
		for (i = nCharsToWrite; i<4; i++) {
			[result appendString:@"="];
		}
	}
	
	return [NSString stringWithString:result]; // convert to immutable string
}

@end

