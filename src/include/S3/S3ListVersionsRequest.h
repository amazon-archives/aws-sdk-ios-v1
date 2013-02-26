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


/** Provides options for returning a list of summary information about the
 * versions in a specified bucket.
 *
 * Returned version summaries are ordered first by key and then by version.
 * Keys are sorted lexicographically (i.e. alphabetically from a-Z) and versions
 * are sorted from the most recent to the least recent.
 * Versions with data and versions with delete markers are included in the results.
 *
 * <br />Required Parameters: bucket
 *
 */
@interface S3ListVersionsRequest:S3Request {
    NSString  *prefix;
    NSString  *keyMarker;
    NSString  *versionIdMarker;
    NSString  *delimiter;
    NSInteger maxKeys;
}

/**
 * Optional parameter restricting the response to keys which begin with the
 * specified prefix. You can use prefixes to separate a bucket into
 * different sets of keys in a way similar to how a file system uses
 * folders.
 */
@property (nonatomic, retain) NSString *prefix;

/**
 * Optional parameter indicating where in the sorted list of all versions in
 * the specified bucket to begin returning results. Results are always
 * ordered first lexicographically (i.e. alphabetically) and then from most
 * recent version to least recent version. If a keyMarker is used without a
 * versionIdMarker, results begin immediately after that key's last version.
 * When a keyMarker is used with a versionIdMarker, results begin
 * immediately after the version with the specified key and version ID.
 */
@property (nonatomic, retain) NSString *keyMarker;

/**
 * Optional parameter indicating where in the sorted list of all versions in
 * the specified bucket to begin returning results. Results are always
 * ordered first lexicographically (i.e. alphabetically) and then from most
 * recent version to least recent version. A keyMarker must be specified
 * when specifying a versionIdMarker. Results begin immediately after the
 * version with the specified key and version ID.
 */
@property (nonatomic, retain) NSString *versionIdMarker;

/**
 * Optional parameter that causes keys that contain the same string between
 * the prefix and the first occurrence of the delimiter to be rolled up into
 * a single result element in the commonPrefixes list. These rolled-up keys
 * are not returned elsewhere in the response. The most commonly used
 * delimiter is "/", which simulates a hierarchical organization similar to
 * a file system directory structure.
 */
@property (nonatomic, retain) NSString *delimiter;

/**
 * Optional parameter indicating the maximum number of results to include in
 * the response. Amazon S3 might return fewer than this, but will not return
 * more. Even if maxKeys is not specified, Amazon S3 will limit the number
 * of results in the response.
 */
@property (nonatomic) NSInteger maxKeys;


@end
