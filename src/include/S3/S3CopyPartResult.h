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

/** Represents the response body from a copyObject response
 *
 */
@interface S3CopyPartResult:NSObject {
    NSString *lastModified;
    NSString *etag;
}

/** Gets and sets the lastModified property */
@property (nonatomic, retain) NSString *lastModified;

/** Gets and sets the etag property */
@property (nonatomic, retain) NSString *etag;

@end
