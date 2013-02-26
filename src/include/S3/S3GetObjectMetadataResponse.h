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
#import "S3GetObjectResponse.h"

/** Contains the response from a getObjectMetadata operation
 *
 */
@interface S3GetObjectMetadataResponse:S3GetObjectResponse {
    int missingMeta;
}

/** How many metadata items were not returned in the response. */
@property (nonatomic) int missingMeta;

/** Whether or not this object is currently being restored */
@property (readonly) BOOL ongoingRestore;

/** If defined, the expiration date for the restored copy of the object */
@property (readonly) NSDate *restoreExpiry;

/** Sets a value in the response for the given HTTP header. */
-(void)setValue:(id)value forHTTPHeaderField:(NSString *)header;

@end
