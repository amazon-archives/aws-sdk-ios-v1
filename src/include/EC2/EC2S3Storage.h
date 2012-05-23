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




/**
 * S3 Storage
 */

@interface EC2S3Storage:NSObject

{
    NSString *bucket;
    NSString *prefix;
    NSString *aWSAccessKeyId;
    NSString *uploadPolicy;
    NSString *uploadPolicySignature;
}




/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The bucket in which to store the AMI. You can specify a bucket that
 * you already own or a new bucket that Amazon EC2 creates on your
 * behalf. <p> If you specify a bucket that belongs to someone else,
 * Amazon EC2 returns an error.
 */
@property (nonatomic, retain) NSString *bucket;

/**
 * The prefix to use when storing the AMI in S3.
 */
@property (nonatomic, retain) NSString *prefix;

/**
 * The Access Key ID of the owner of the Amazon S3 bucket.
 */
@property (nonatomic, retain) NSString *aWSAccessKeyId;

/**
 * A Base64-encoded Amazon S3 upload policy that gives Amazon EC2
 * permission to upload items into Amazon S3 on the user's behalf.
 */
@property (nonatomic, retain) NSString *uploadPolicy;

/**
 * The signature of the Base64 encoded JSON document.
 */
@property (nonatomic, retain) NSString *uploadPolicySignature;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
