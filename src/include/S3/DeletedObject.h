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

/**
 * A successfully deleted object.
 */
@interface DeletedObject:NSObject
{
    NSString *key;
    NSString *versionId;
    BOOL     deleteMarker;
    NSString *deleteMarkerVersionId;
}

/**
 * Returns the key that was successfully deleted.
 */
@property (nonatomic, retain) NSString *key;

/**
 * Returns the version deleted, or null for unversioned objects.
 */
@property (nonatomic, retain) NSString *versionId;

/**
 * Returns whether the object deleted was a delete marker.
 */
@property (nonatomic, assign) BOOL deleteMarker;

/**
 * Returns the versionId for the delete marker that was created when
 * doing a non-versioned delete in a versioned bucket.
 */
@property (nonatomic, retain) NSString *deleteMarkerVersionId;

@end
