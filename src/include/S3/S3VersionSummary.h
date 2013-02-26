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
#import "S3Owner.h"
#import "S3ObjectSummary.h"

/** Contains the summary of a version stored in an Amazon S3 bucket.
 * This object doesn't contain the version's full metadata or any of its contents.
 *
 */
@interface S3VersionSummary:S3ObjectSummary {
    NSString *versionId;
    NSString *displayName;
    bool     isLatest;
    bool     isDeleteMarker;
}


/** The version ID uniquely identifying this version of an object */
@property (nonatomic, retain) NSString *versionId;

@property (nonatomic, retain) NSString *displayName;

/** True if this is the latest version of the associated object */
@property (nonatomic) bool isLatest;

/** True if this object is a delete marker. */
@property (nonatomic) bool isDeleteMarker;

/** The string representation of the S3VersionSummary */
-(NSString *)description;


@end
