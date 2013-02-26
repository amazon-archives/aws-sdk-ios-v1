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
#import "S3AbstractPutRequest.h"

/** Contains the parameters used for the initiateMultipartUpload operation.
 *
 */
@interface S3InitiateMultipartUploadRequest:S3AbstractPutRequest {
    BOOL      expiresSet;
}

-(id)initWithKey:(NSString *)aKey inBucket:(NSString *)aBucket;

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

@property (nonatomic, retain) NSString *redirectLocation;

/** Number of milliseconds before expiration. */
@property (nonatomic, assign, readonly) NSInteger expires;

@end
