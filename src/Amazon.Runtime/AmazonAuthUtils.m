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

#import "AmazonAuthUtils.h"
#import "AmazonLogger.h"

@implementation AmazonAuthUtils

+(void)signRequest:(AmazonServiceRequest *)serviceRequest endpoint:(NSString *)theEndpoint credentials:(AmazonCredentials *)credentials
{
    NSData   *dataToSign = [[AmazonAuthUtils getV2StringToSign:[NSURL URLWithString:theEndpoint] request:serviceRequest] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *signature  = [AmazonAuthUtils HMACSign:dataToSign withKey:credentials.secretKey usingAlgorithm:kCCHmacAlgSHA256];

    [serviceRequest setParameterValue:signature forKey:@"Signature"];
}

+(NSString *)signRequestV3:(AmazonServiceRequest *)serviceRequest sts:(NSString *)theSts credentials:(AmazonCredentials *)credentials
{
    return [AmazonAuthUtils HMACSign:[theSts dataUsingEncoding:NSUTF8StringEncoding] withKey:credentials.secretKey usingAlgorithm:kCCHmacAlgSHA256];
}

+(void)signRequestV4:(AmazonServiceRequest *)serviceRequest headers:(NSMutableDictionary *)headers payload:(NSString *)payload credentials:(AmazonCredentials *)credentials
{
    NSDate *date = [NSDate date];
    
    NSString *dateStamp = [date dateStamp];
    NSString *dateTime  = [date dateTime];
    
    // add date header (done here for consistency in timestamp)
    [headers setObject:dateTime forKey:@"X-Amz-Date"];
    [serviceRequest.urlRequest setValue:dateTime forHTTPHeaderField:@"X-Amz-Date"]; 
        
    // TODO: This needs to be generalized for non-Dynamo calls (path and query)
    NSString *canonicalRequest = [AmazonAuthUtils getCanonicalizedRequest:serviceRequest.urlRequest.HTTPMethod path:@"/" query:@"" headers:headers payload:payload];    
    
    AMZLogDebug(@"AWS4 Canonical Request: [%@]", canonicalRequest);
    
    NSString *scope              = [NSString stringWithFormat:@"%@/%@/%@/%@", dateStamp, serviceRequest.regionName, serviceRequest.serviceName, SIGV4_TERMINATOR];
    NSString *signingCredentials = [NSString stringWithFormat:@"%@/%@", credentials.accessKey, scope];
    NSString *stringToSign       = [NSString stringWithFormat:@"%@\n%@\n%@\n%@", SIGV4_ALGORITHM, dateTime, scope, [AmazonSDKUtil hexEncode:[AmazonAuthUtils hashString:canonicalRequest]]];
    
    AMZLogDebug(@"AWS4 String to Sign: [%@]", stringToSign);
    
    NSData *kSigning  = [AmazonAuthUtils getV4DerivedKey:credentials.secretKey date:dateStamp region:serviceRequest.regionName service:serviceRequest.serviceName];
    NSData *signature = [AmazonAuthUtils sha256HMacWithData:[stringToSign dataUsingEncoding:NSUTF8StringEncoding] withKey:kSigning];
    
    NSString *credentialsAuthorizationHeader   = [NSString stringWithFormat:@"Credential=%@", signingCredentials];
    NSString *signedHeadersAuthorizationHeader = [NSString stringWithFormat:@"SignedHeaders=%@", [AmazonAuthUtils getSignedHeadersString:headers]];
    NSString *signatureAuthorizationHeader     = [NSString stringWithFormat:@"Signature=%@", [AmazonSDKUtil hexEncode:[[[NSString alloc] initWithData:signature encoding:NSASCIIStringEncoding] autorelease]]];
    
    NSString *authorization = [NSString stringWithFormat:@"%@ %@, %@, %@", SIGV4_ALGORITHM, credentialsAuthorizationHeader, signedHeadersAuthorizationHeader, signatureAuthorizationHeader];
    [serviceRequest.urlRequest setValue:authorization     forHTTPHeaderField:@"Authorization"];
}

+(NSString *)getV2StringToSign:(NSURL *)theEndpoint request:(AmazonServiceRequest *)serviceRequest
{
    NSString *host = [theEndpoint host];
    NSString *path = [theEndpoint path];

    if (nil == path || [path length] < 1) {
        path = @"/";
    }
    NSString *sts = [NSString stringWithFormat:@"POST\n%@\n%@\n%@", host, path, [serviceRequest queryString]];
    AMZLogDebug(@"String To Sign:\n%@", sts);
    return sts;
}

+(NSString *)getV3StringToSign:(NSString *)rfc822Date nonce:(NSString *)theNonce
{
    return [NSString stringWithFormat:@"%@%@", rfc822Date, theNonce];
}

+(NSString *)nonce
{
    CFUUIDRef uuid   = CFUUIDCreate(kCFAllocatorDefault);
    NSString  *nonce = [(NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid) autorelease];

    CFRelease(uuid);

    return nonce;
}

+(NSString *)amznAuthorization:(NSString *)accessKey algorithm:(NSString *)theAlgorithm signature:(NSString *)theSignature
{
    return [NSString stringWithFormat:@"AWS3-HTTPS AWSAccessKeyId=%@,Algorithm=%@,Signature=%@", accessKey, theAlgorithm, theSignature];
}

+(NSString *) HMACSign:(NSData *)data withKey:(NSString *)key usingAlgorithm:(CCHmacAlgorithm)algorithm
{
    CCHmacContext context;
    const char    *keyCString = [key cStringUsingEncoding:NSASCIIStringEncoding];

    CCHmacInit(&context, algorithm, keyCString, strlen(keyCString));
    CCHmacUpdate(&context, [data bytes], [data length]);

    // Both SHA1 and SHA256 will fit in here
    unsigned char digestRaw[CC_SHA256_DIGEST_LENGTH];

    NSInteger           digestLength;

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

    if (digestLength < 0)
    {
        // Fatal error. This should not happen.
        @throw [AmazonSignatureException exceptionWithName : kError_Invalid_Hash_Alg
                reason : kReason_Invalid_Hash_Alg
                userInfo : nil];
    }

    CCHmacFinal(&context, digestRaw);

    NSData *digestData = [NSData dataWithBytes:digestRaw length:digestLength];

    return [digestData base64EncodedString];
}

+(NSData *)sha256HMac:(NSData *)data withKey:(NSString *)key
{
    CCHmacContext context;
    const char    *keyCString = [key cStringUsingEncoding:NSASCIIStringEncoding];

    CCHmacInit(&context, kCCHmacAlgSHA256, keyCString, strlen(keyCString));
    CCHmacUpdate(&context, [data bytes], [data length]);

    unsigned char digestRaw[CC_SHA256_DIGEST_LENGTH];
    NSInteger     digestLength = CC_SHA256_DIGEST_LENGTH;

    CCHmacFinal(&context, digestRaw);

    return [NSData dataWithBytes:digestRaw length:digestLength];
}

+(NSData *)sha256HMacWithData:(NSData *)data withKey:(NSData *)key
{
    CCHmacContext context;

    CCHmacInit(&context, kCCHmacAlgSHA256, [key bytes], [key length]);
    CCHmacUpdate(&context, [data bytes], [data length]);

    unsigned char digestRaw[CC_SHA256_DIGEST_LENGTH];
    NSInteger     digestLength = CC_SHA256_DIGEST_LENGTH;

    CCHmacFinal(&context, digestRaw);

    return [NSData dataWithBytes:digestRaw length:digestLength];
}

+(NSString *)hashString:(NSString *)stringToHash
{
    return [[[NSString alloc] initWithData:[AmazonAuthUtils hash:[stringToHash dataUsingEncoding:NSUTF8StringEncoding]] encoding:NSASCIIStringEncoding] autorelease];
}

+(NSData *)hash:(NSData *)dataToHash
{
    const void    *cStr = [dataToHash bytes];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];

    CC_SHA256(cStr, [dataToHash length], result);

    return [[[NSData alloc] initWithBytes:result length:CC_SHA256_DIGEST_LENGTH] autorelease];
}

+(NSData *)getV4DerivedKey:(NSString *)secret date:(NSString *)dateStamp region:(NSString *)regionName service:(NSString *)serviceName
{
    // AWS4 uses a series of derived keys, formed by hashing different pieces of data
    NSString *kSecret   = [NSString stringWithFormat:@"%@%@", SIGV4_MARKER, secret];
    NSData   *kDate     = [AmazonAuthUtils sha256HMacWithData:[dateStamp dataUsingEncoding:NSUTF8StringEncoding] withKey:[kSecret dataUsingEncoding:NSUTF8StringEncoding]];
    NSData   *kRegion   = [AmazonAuthUtils sha256HMacWithData:[regionName dataUsingEncoding:NSASCIIStringEncoding] withKey:kDate];
    NSData   *kService  = [AmazonAuthUtils sha256HMacWithData:[serviceName dataUsingEncoding:NSUTF8StringEncoding] withKey:kRegion];
    NSData   *kSigning  = [AmazonAuthUtils sha256HMacWithData:[SIGV4_TERMINATOR dataUsingEncoding:NSUTF8StringEncoding] withKey:kService];
    
    
    //TODO: cache this derived key?
    return kSigning;
}

+(NSString *)getCanonicalizedRequest:(NSString *)method path:(NSString *)path query:(NSString *)query headers:(NSMutableDictionary *)headers payload:(NSString *)payload
{
    NSMutableString *canonicalRequest = [[NSMutableString new] autorelease];
    [canonicalRequest appendString:method];
    [canonicalRequest appendString:@"\n"];
    [canonicalRequest appendString:path]; // Canonicalized resource path
    [canonicalRequest appendString:@"\n"];
    
    [canonicalRequest appendString:query]; // Canonicalized Query String
    [canonicalRequest appendString:@"\n"];
    
    [canonicalRequest appendString:[AmazonAuthUtils getCanonicalizedHeaderString:headers]];
    [canonicalRequest appendString:@"\n"];
    
    [canonicalRequest appendString:[AmazonAuthUtils getSignedHeadersString:headers]];
    [canonicalRequest appendString:@"\n"];
    
    AMZLogDebug(@"AWS4 Content to Hash: [%@]", payload);
    
    NSString* hashString = [AmazonSDKUtil hexEncode:[AmazonAuthUtils hashString:payload]];
    
    [canonicalRequest appendString:[NSString stringWithFormat:@"%@", hashString]];
    
    return canonicalRequest;
}


+(NSString *)getCanonicalizedHeaderString:(NSMutableDictionary *)theHeaders
{
    NSMutableArray *sortedHeaders = [[[NSMutableArray alloc] initWithArray:[theHeaders allKeys]] autorelease];
    
    [sortedHeaders sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
    NSMutableString *headerString = [[[NSMutableString alloc] init] autorelease];
    for (NSString *header in sortedHeaders) {
        [headerString appendString:[header lowercaseString]];
        [headerString appendString:@":"];
        [headerString appendString:[theHeaders valueForKey:header]];
        [headerString appendString:@"\n"];
    }
    
    // SigV4 expects all whitespace in headers and values to be collapsed to a single space
    NSCharacterSet *whitespaceChars = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
    
    NSArray *parts = [headerString componentsSeparatedByCharactersInSet:whitespaceChars];
    NSArray *nonWhitespace = [parts filteredArrayUsingPredicate:noEmptyStrings];
    return [nonWhitespace componentsJoinedByString:@" "];
}

+(NSString *)getSignedHeadersString:(NSMutableDictionary *)theHeaders
{
    NSMutableArray *sortedHeaders = [[[NSMutableArray alloc] initWithArray:[theHeaders allKeys]] autorelease];
    
    [sortedHeaders sortUsingSelector:@selector(caseInsensitiveCompare:)];
    
    NSMutableString *headerString = [[[NSMutableString alloc] init] autorelease];
    for (NSString *header in sortedHeaders) {
        if ( [headerString length] > 0) {
            [headerString appendString:@";"];
        }
        [headerString appendString:[header lowercaseString]];
    }
    
    return headerString;
}

@end

