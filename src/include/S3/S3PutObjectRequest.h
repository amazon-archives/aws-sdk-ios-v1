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

#import <Foundation/Foundation.h>

#import "../AmazonLogger.h"

#import "S3AbstractPutRequest.h"
#import "S3Constants.h"

/** Contains the parameters used for the putObject operation.
 *
 * Required parameters: bucket, key.
 *
 */
@interface S3PutObjectRequest:S3AbstractPutRequest {
    BOOL expiresSet;
}

/** Can be used to specify caching behavior along the request/reply chain.
 * For more information, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.9.
 */
@property (nonatomic, retain) NSString *cacheControl;

/** Specifies presentational information for the object.
 * For more information, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html#sec19.5.1.
 */
@property (nonatomic, retain) NSString *contentDisposition;

/** Specifies what content encodings have been applied to the object and thus what
 * decoding mechanisms must be applied to obtain the media-type referenced by the
 * <code>Content-Type</code> header field.
 * For more information, go to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.11.
 */
@property (nonatomic, retain) NSString *contentEncoding;

/** The base64 encoded 128-bit MD5 digest of the message (without the headers) according to RFC 1864.
 * This header can be used as a message integrity check to verify that the data is the same \
 * data that was originally sent.
 */
@property (nonatomic, retain) NSString *contentMD5;

/** If this property is set and the contentMD5 property is nil, the MD5 will be calculated as part of the Put Request.
 *
 * MD5 Generation only works on files and data, generation is not attempted for streams.
 */
@property (nonatomic, assign) BOOL generateMD5;

/** When your application uses 100-continue, it does not send the request body until it receives an acknowledgement.
 * If the message is rejected based on the headers, the body of the message is not sent.
 */
@property (nonatomic, retain) NSString *expect;

/** The that represents the object to be uploaded
 * <p>
 * Use one of <code>data</code>, <code>stream</code>, <code>filename</code>.
 * </p>
 */
@property (nonatomic, retain) NSData *data;

/** The stream from which to read the object to be uploaded.
 * To use the stream you must explicitly set the content length.
 * <p>
 * Use one of <code>data</code>, <code>stream</code>, <code>filename</code>.
 * </p>
 */
@property (nonatomic, retain) NSInputStream *stream;

/** Number of milliseconds before expiration. */
@property (nonatomic, assign, readonly) NSInteger expires;

/** Path of file in the filesystem to be uploaded.
 * The <code>contentLength</code> and <code>contentType</code> will be inferred.
 * <p>
 * Use one of <code>data</code>, <code>stream</code>, <code>filename</code>.
 * </p>
 * @throws AmazonClientException If the file does not exist or is not readable.
 */
@property (nonatomic, retain) NSString *filename;

@property (nonatomic, retain) NSString *redirectLocation;

/** Initializes the request with the key and bucket name */
-(id)initWithKey:(NSString *)aKey inBucket:(NSString *)aBucket;

@end