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
#import "S3Constants.h"


/** Request Object for Listing the Objects in the specified bucket.
 *
 */
@interface S3ListObjectsRequest:S3Request {
    NSString  *prefix;
    NSString  *marker;
    NSString  *delimiter;
    NSInteger maxKeys;
}

/** Limits the response to keys that begin with the specified prefix.
 *  You can use prefixes to separate a bucket into different groupings of keys.
 */
@property (nonatomic, retain) NSString *prefix;

/** Specifies the key to start with when listing objects in a bucket. Amazon
 *  S3 lists objects in alphabetical order.
 */
@property (nonatomic, retain) NSString *marker;

/**  A delimiter is a character you use to group keys. All keys that contain
 *   the same string between the prefix and the first occurrence of the
 *   delimiter are grouped under a single result element.
 */
@property (nonatomic, retain) NSString *delimiter;

/** Sets the maximum number of keys returned in the response body. The
 *  response might contain fewer keys but will never contain more.
 */
@property (nonatomic) NSInteger maxKeys;


-(id)initWithName:(NSString *)theBucketName;

@end
