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
#import "S3Constants.h"
#import "S3CannedACL.h"
#import "S3AccessControlList.h"

/** Class with code common to Put* requests. Do not instantiate directly
 *
 */
@interface S3AbstractPutRequest:S3Request {
    S3CannedACL         *cannedACL;
    S3AccessControlList *fullACL;
    NSString            *storageClass;
    NSString            *serverSideEncryption;

    NSMutableDictionary *metadata;
}

/** A canned access control list to apply to the object.
 * Valid values are 'private', 'public-read', 'public-read-write',
 * 'authenticated-read', 'log-delivery-write', 'bucket-owner-read',
 * 'bucket-owner-full-control'.
 */
@property (nonatomic, retain) S3CannedACL *cannedACL;

/** A full access control list to apply to the bucket */
@property (nonatomic, retain) S3AccessControlList *fullACL;

/** The storage class for the object.
 * Valid values are 'STANDARD', 'REDUCED_REDUNDANCY'
 */
@property (nonatomic, retain) NSString *storageClass; // TODO: make an enum

/** Optional server side encryption algorithm.
 */
@property (nonatomic, retain) NSString *serverSideEncryption;

/** Add a key-value metadata pair to the request.
 *  These will be prefixed with x-amz-meta- and added to the request header.
 */
-(void)addMetadataWithValue:(NSString *)value forKey:(NSString *)aKey;

/** Get the metadata dictionary of key-value pairs.
 *
 *  @returns the metadata dictionary.
 */
-(NSMutableDictionary *)metadata;


@end
