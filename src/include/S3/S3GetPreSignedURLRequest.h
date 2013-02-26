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
#import "S3Request.h"
#import "S3ResponseHeaderOverrides.h"

/** The GetPreSignedURLRequest contains the parameters used to create
 * a pre signed URL.
 * @see http://docs.amazonwebservices.com/AmazonS3/latest/S3_QSAuth.html
 *
 */
@interface S3GetPreSignedURLRequest:S3Request {
    NSDate                    *expires;
    NSString                  *protocol;
    NSString                  *httpVerb;
    NSString                  *accessKey;
    NSString                  *versionId;

    S3ResponseHeaderOverrides *responseHeaderOverrides;
}

/** Gets and sets the expires property for this request.
 * The time when the signature expires, specified as an NSDate object.
 */
@property (nonatomic, retain) NSDate *expires;

/** Gets and sets the protocol property for this request.
 * Specifies whether the pre signed URL will use
 * http or https. Defaults to https unless otherwise
 * set.
 */
@property (nonatomic, retain) NSString *protocol;

/** Gets and sets the verb property.
 * Specifies the verb used in the pre-signed URL.
 * Accepted verbs are GET, PUT and HEAD.
 * Default is GET.
 */
@property (nonatomic, retain) NSString *httpVerb;

/** Sets the access key used in the pre signed URL.
 * This will be set automatically with the value used to
 * create the AmazonS3Client.
 */
@property (nonatomic, retain) NSString *accessKey;

/** Sets the (optional) versionId used in the pre signed URL.
 */
@property (nonatomic, retain) NSString *versionId;

/** Specify one or more overrides to headers in the response to this request */
@property (nonatomic, retain) S3ResponseHeaderOverrides *responseHeaderOverrides;

@property (nonatomic, readonly) NSString                *queryString;

@end
