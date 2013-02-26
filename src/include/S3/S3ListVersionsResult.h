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
#import "S3VersionSummary.h"

/** Contains the results of listing the versions in an Amazon S3 bucket,
 * including a list of S3VersionSummary objects describing each version,
 * information describing if this is a complete or partial listing, and the
 * original request parameters.
 *
 */
@interface S3ListVersionsResult:NSObject {
    NSMutableArray *versionSummaries;
    NSString       *name;
    NSString       *prefix;
    NSString       *keyMarker;
    NSString       *nextKeyMarker;
    NSString       *versionIdMarker;
    NSString       *nextVersionIdMarker;
    NSInteger      maxKeys;
    NSString       *delimiter;
    bool           isTruncated;
    NSMutableArray *commonPrefixes;
}

/** A list of summary information describing the versions stored in the bucket */
@property (nonatomic, retain) NSMutableArray *versionSummaries;

/** The name of the Amazon S3 bucket containing the listed versions */
@property (nonatomic, retain) NSString *name;

/** The prefix parameter originally specified by the caller. */
@property (nonatomic, retain) NSString *prefix;

/** The key marker parameter originally specified by the caller. */
@property (nonatomic, retain) NSString *keyMarker;

/** When the number of responses exceeds the value of MaxKeys, NextKeyMarker specifies
 * the first key not returned that satisfies the search criteria. Use this value for
 * the key-marker request parameter in a subsequent request.
 */
@property (nonatomic, retain) NSString *nextKeyMarker;

/** The version id marker parameter originally specified by the caller. */
@property (nonatomic, retain) NSString *versionIdMarker;

/** When the number of responses exceeds the value of MaxKeys, NextVersionIdMarker
 * specifies the first object version not returned that satisfies the search criteria.
 * Use this value for the version-id-marker request parameter in a subsequent request.
 */
@property (nonatomic, retain) NSString *nextVersionIdMarker;

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


-(void)addDeleteMarker:(S3VersionSummary *)deleteMarker;


@end
