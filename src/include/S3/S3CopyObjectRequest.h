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

#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonClientException.h>
#else
#import "../AmazonClientException.h"
#endif

#import "S3AbstractPutRequest.h"
#import "S3Constants.h"

/** Contains the parameters used for the CopyObject operation.
 *
 */
@interface S3CopyObjectRequest:S3AbstractPutRequest {
}

/** The name of the source object. */
@property (nonatomic, retain) NSString *sourceKey;

/** The bucket of the source object */
@property (nonatomic, retain) NSString *sourceBucket;

/** Whether to copy or replace the metadata.
 * Valid values: COPY | REPLACE
 */
@property (nonatomic, retain) NSString *metadataDirective;

/** Copies the object if its entity tag (ETag) matches the specified tag */
@property (nonatomic, retain) NSString *ifMatch;

/** Copies the object if its entity tag (ETag) is different than the specified ETag */
@property (nonatomic, retain) NSString *ifNoneMatch;

/** Copies the object if it has been modified since the specified time */
@property (nonatomic, retain) NSDate *ifModifiedSince;

/** Copies the object if it hasn't been modified since the specified time */
@property (nonatomic, retain) NSDate *ifUnmodifiedSince;

@property (nonatomic, retain) NSString *redirectLocation;

/** intializes the request with source and destination.
 *
 * @param srcKey The name of the source object.
 * @param srcBucket The name of the souce bucket.
 * @param dstKey The name of the destination object.
 * @param dstBucket The name of the destination bucket.
 *
 * @return the request object.
 */
-(id)initWithSourceKey:(NSString *)srcKey sourceBucket:(NSString *)srcBucket destinationKey:(NSString *)dstKey destinationBucket:(NSString *)dstBucket;

@end
