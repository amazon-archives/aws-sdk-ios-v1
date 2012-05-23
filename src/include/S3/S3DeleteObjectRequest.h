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
#import "S3Request.h"

@class S3Request;

/** Request object for DeleteObject.
 *
 */
@interface S3DeleteObjectRequest:S3Request {
    NSString *mfaAuth;
}

/** The concatenation of the multi-factor authentication device's serial number,
 *  a space, and the value displayed on your authentication device.
 *
 * Required to permanently delete a versioned object if versioning is configured with MFA Delete enabled.
 */
@property (nonatomic, retain) NSString *mfaAuth;

@end
