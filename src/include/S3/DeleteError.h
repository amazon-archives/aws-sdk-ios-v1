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
 * An error that occurred when deleting an object.
 */
@interface DeleteError:NSObject
{
    NSString *key;
    NSString *versionId;
    NSString *code;
    NSString *message;
}

/**
 * Returns the key of the object that couldn't be deleted.
 */
@property (nonatomic, retain) NSString *key;

/**
 * Returns the versionId of the object that couldn't be deleted.
 */
@property (nonatomic, retain) NSString *versionId;

/**
 * Returns the status code for the failed delete.
 */
@property (nonatomic, retain) NSString *code;

/**
 * Returns a description of the failure.
 */
@property (nonatomic, retain) NSString *message;

@end
