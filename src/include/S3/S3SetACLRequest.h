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
#import "S3AccessControlList.h"

@class S3AccessControlList;

/** Contains the parameters used for the setACL operation.
 * The bucket is always required, the key is optional and is to be set
 * if you want to set the ACL for an object instead of a bucket.
 * <br />Required Parameters: bucket, acl
 * <br />Optional Parameters: key
 *
 */
@interface S3SetACLRequest:S3Request {
    S3AccessControlList *acl;
}

/** Gets and sets the access control list (ACL) to set on the bucket or object */
@property (nonatomic, retain) S3AccessControlList *acl;

@end
