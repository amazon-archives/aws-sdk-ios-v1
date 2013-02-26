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
#import "S3KeyVersion.h"

@class S3Request;

/** Request object for DeleteObjects.
 *
 */
@interface S3DeleteObjectsRequest:S3Request
{
    NSString       *mfaAuth;
    NSMutableArray *objects;
    BOOL           quiet;
}

/** The concatenation of the multi-factor authentication device's serial number,
 *  a space, and the value displayed on your authentication device.
 *
 * Required to permanently delete a versioned object if versioning is configured with MFA Delete enabled.
 */
@property (nonatomic, retain) NSString *mfaAuth;

/** The list of objects to be deleted.
 * All objects in the array must be an instance of S3KeyVersion.
 */
@property (nonatomic, retain) NSMutableArray *objects;

/** The list of objects to be deleted.
 * All objects in the array must be an instance of S3KeyVersion.
 */
@property (nonatomic, assign) BOOL quiet;

/** Returns the XML represenation of the delete request.
 *
 * @return A XML representation of the Delete.
 */
-(NSString *)toXml;

@end
