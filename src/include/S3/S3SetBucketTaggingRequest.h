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
#import "S3BucketTaggingConfiguration.h"

/**
 * Contains the parameters used for the setBucketTagging operation.
 *
 */
@interface S3SetBucketTaggingRequest:S3Request
{
    S3BucketTaggingConfiguration *configuration;
}

-(id)initWithBucketName:(NSString *)theBucketName withConfiguration:(S3BucketTaggingConfiguration *)theConfiguration;
-(id)initWithBucketName:(NSString *)theBucketName;
+(id)requestWithBucketName:(NSString *)theBucketName withConfiguration:(S3BucketTaggingConfiguration *)theConfiguration;
+(id)requestWithBucketName:(NSString *)theBucketName;

/** The new cost allocation tagging configuration for the specified bucket. */
@property (nonatomic, retain) S3BucketTaggingConfiguration *configuration;

@end
