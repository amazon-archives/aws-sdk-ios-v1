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
#import <AWSRuntime/AmazonAuthUtils.h>
#import <AWSRuntime/AmazonServiceRequest.h>
#else
#import "../AmazonSDKUtil.h"
#import "../AmazonAuthUtils.h"
#import "../AmazonServiceRequest.h"
#endif

#import "S3Constants.h"

/** Contains the parameters common to Amazon S3 operations.
 *
 */
@interface S3Request:AmazonServiceRequest {
    NSString  *authorization;
    int64_t   contentLength;
    NSString  *contentType;
    NSDate    *date;
    NSString  *securityToken;
    NSString  *bucket;
    NSString  *key;
    NSString  *subResource;
}

#pragma mark Properties

/** The information required for request authentication. */
@property (nonatomic, retain) NSString *authorization;

/** Length of the message (without the headers) according to RFC 2616. */
@property (nonatomic) int64_t contentLength;

/** The content type of the resource.
* Example: <code>text/plain</code> */
@property (nonatomic, retain) NSString *contentType;

/** The current date and time according to the requester.
 * Example: <code>Wed, 01 Mar 2009 12:00:00 GMT</code>
 */
@property (nonatomic, retain) NSDate *date;

/** For path-style requests, the value is s3.amazonaws.com.
 * For virtual-style requests, the value is BucketName.s3.amazonaws.com.
 */
@property (nonatomic, readonly) NSString *host;

/** The security tokens for operations that use Amazon DevPay. */
@property (nonatomic, retain) NSString *securityToken;

/** The name of the bucket */
@property (nonatomic, retain) NSString *bucket;

/** The name of the S3 object */
@property (nonatomic, retain) NSString *key;

/** The sub-resource (i.e. acl, versioning, torrent) for the request */
@property (nonatomic, retain) NSString *subResource;

/** The URL for the resource.
 * This property is read-only.
 */
@property (nonatomic, readonly) NSURL *url;

#pragma mark methods

/** Add appropriate headers to the URL Request object */
-(AmazonURLRequest *)configureURLRequest;

/** The current date and time in a format which can be supplied in Amazon S3 requests. */
-(NSString *)timestamp;

/** Returns the protocol portion of the endpoint, either 'http' or 'https' */
-(NSString *)protocol;

/** Returns the host portion of the endpoint. */
-(NSString *)endpointHost __attribute__((deprecated)); 

@end
