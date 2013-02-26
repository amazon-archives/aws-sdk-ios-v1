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

@interface S3ListObjectsResult:NSObject {
    NSMutableArray *objectSummaries;
    NSString       *bucketName;
    NSString       *prefix;
    NSString       *marker;
    NSInteger      maxKeys;
    NSString       *delimiter;
    bool           isTruncated;
    NSMutableArray *commonPrefixes;
}

/** The list of buckets */
@property (nonatomic, retain) NSMutableArray *objectSummaries;

/** The bucket name */
@property (nonatomic, retain) NSString *bucketName;

/** The prefix parameter originally specified by the caller. */
@property (nonatomic, retain) NSString *prefix;

/** The marker parameter originally specified by the caller. */
@property (nonatomic, retain) NSString *marker;

/** The maxKeys parameter originally specified by the caller. */
@property (nonatomic) NSInteger maxKeys;

/** The delimiter parameter originally specified by the caller. */
@property (nonatomic, retain) NSString *delimiter;

/** Indicates if this is  a complete listing or if caller needs
 * to make additional requests.
 */
@property (nonatomic) bool isTruncated;

/** A list of common prefixes.  Will only be specified for requests
 * that include a delimiter.
 */
@property (nonatomic, retain) NSMutableArray *commonPrefixes;

@end
