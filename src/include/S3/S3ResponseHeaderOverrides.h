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

#import <Foundation/Foundation.h>

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonSDKUtil.h>
#else
#import "../AmazonSDKUtil.h"
#endif

#define kS3ResponseHdrContentType           @"response-content-type"
#define kS3ResponseHdrContentLanguage       @"response-content-language"
#define kS3ResponseHdrExpires               @"response-expires"
#define kS3ResponseHdrCacheControl          @"response-cache-control"
#define kS3ResponseHdrContentDisposition    @"response-content-disposition"
#define kS3ResponseHdrContentEncoding       @"response-content-encoding"


/** Contains the values of the response headers that will be set on the
 * response from a GetObject request.  These values override any headers that were set
 * when the object was uploaded to S3.
 *
 */
@interface S3ResponseHeaderOverrides:NSObject {
    NSString *contentType;
    NSString *contentLanguage;
    NSString *expires;
    NSString *cacheControl;
    NSString *contentDisposition;
    NSString *contentEncoding;
}

/** The Content-Type header to be included on the response. */
@property (nonatomic, retain) NSString *contentType;

/** The Content-Language header to be included on the response. */
@property (nonatomic, retain) NSString *contentLanguage;

/** The Expires header to be included on the response. */
@property (nonatomic, retain) NSString *expires;

/** The Cache-Control header to be included on the response */
@property (nonatomic, retain) NSString *cacheControl;

/** The Content-Disposition header to be included on the response. */
@property (nonatomic, retain) NSString *contentDisposition;

/** The Content-Encoding header to be included on the response. */
@property (nonatomic, retain) NSString *contentEncoding;

/** The partial querystring for the request */
@property (nonatomic, readonly) NSString *queryString;

@end
