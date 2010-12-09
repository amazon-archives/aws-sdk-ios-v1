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

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonCryptor.h>

#import "AmazonSignatureException.h"

#define kError_Invalid_Hash_Alg	@"Invalid hash algorithm"
#define kReason_Invalid_Hash_Alg @"Only SHA1 and SHA256 are supported"

/** Utilities for signing requests */
@interface AmazonAuthUtils : NSObject {

}

// TODO: These should be removed
+(NSString*)getAuthorization:(NSString*)timestamp forBucket:(NSString*)bucket forVerb:(NSString*)verb accessKey:(NSString*)accessKey secretKey:(NSString*)secretKey;
+(NSString*)getSignature:(NSString*)timestamp forBucket:(NSString*)bucket forVerb:(NSString*)httpVerb secretKey:(NSString*)secretKey;


/** 
 * Compute a keyed hash of some data with a specified key and algorithm.
 * @param data	The data to sign
 * @param key	The key to sign the data with
 * @param algorithm	Which HMAC algortithm to use. Currently support <code>kCCHmacAlgSHA1</code> and <code>kCCHmacAlgSHA256</code>.
 * @return Base64 encoded string that is the signature of the data with the specified key.
 */
+ (NSString *) HMACSign:(NSData *)data withKey:(NSString *)key usingAlgorithm:(CCHmacAlgorithm)algorithm;

@end

/*! \category NSData(WithBase64)
	\abstract Adds Base64 encoding to the NSData class.
 */
@interface NSData(WithBase64)

/**
 * Return a base64 encoded representation of the data.
 *
 * @return base64 encoded representation of the data.
 */
- (NSString *) base64EncodedString;

@end