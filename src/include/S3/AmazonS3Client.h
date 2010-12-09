/*
 * Copyright 2010 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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
#import <CommonCrypto/CommonHMAC.h>

#import "../AmazonWebServiceClient.h"

#import "S3Constants.h"
#import "S3AbstractPutRequest.h"
#import "S3AccessControlList.h"
#import "S3AccessControlListUnmarshaller.h"
#import "S3Bucket.h"
#import "S3BucketNameUtilities.h"
#import "S3BucketUnmarshaller.h"
#import "S3CannedACL.h"
#import "S3CopyObjectRequest.h"
#import "S3CopyObjectResponse.h"
#import "S3CreateBucketRequest.h"
#import "S3CreateBucketResponse.h"
#import "S3DeleteBucketRequest.h"
#import "S3DeleteBucketResponse.h"
#import "S3DeleteObjectRequest.h"
#import "S3DeleteObjectResponse.h"
#import "S3ErrorResponseHandler.h"
#import "S3GetACLRequest.h"
#import "S3GetACLResponse.h"
#import "S3GetObjectMetadataRequest.h"
#import "S3GetObjectMetadataResponse.h"
#import "S3GetObjectRequest.h"
#import "S3GetObjectResponse.h"
#import "S3GetPreSignedURLRequest.h"
#import "S3Grant.h"
#import "S3GrantUnmarshaller.h"
#import "S3Grantee.h"
#import "S3ListBucketResultUnmarshaller.h"
#import "S3ListBucketsRequest.h"
#import "S3ListBucketsResponse.h"
#import "S3ListBucketsResult.h"
#import "S3ListBucketsResultUnmarshaller.h"
#import "S3ListObjectsRequest.h"
#import "S3ListObjectsResponse.h"
#import "S3ListObjectsResult.h"
#import "S3LocationConstraintUnmarshaller.h"
#import "S3ObjectSummary.h"
#import "S3ObjectSummaryUnmarshaller.h"
#import "S3Owner.h"
#import "S3OwnerUnmarshaller.h"
#import "S3Permission.h"
#import "S3PutObjectRequest.h"
#import "S3PutObjectResponse.h"
#import "S3Region.h"
#import "S3Request.h"
#import "S3Response.h"
#import "S3ServiceModel.h"
#import "S3ServiceTransform.h"
#import "S3SetACLRequest.h"
#import "S3SetACLResponse.h"


/** AmazonS3Client is an implementation of AmazonS3. 
 *
 * The client allows you to manage your AmazonS3 buckets and keys/objects.
 *
 * Amazon S3 is storage for the Internet. It is designed to make web-scale computing easier for developers.
 * Amazon S3 provides a simple web services interface that can be used to store and retrieve any amount of data,
 * at any time, from anywhere on the web. It gives any developer access to the same highly scalable, reliable,
 * fast, inexpensive data storage infrastructure that Amazon uses to run its own global network of web sites.
 * The service aims to maximize benefits of scale and to pass those benefits on to developers.
 */
@interface AmazonS3Client : AmazonWebServiceClient {}

/** Returns a list of all Amazon S3 buckets that the authenticated sender of the request owns.
 *
 * @return An NSArray of S3Bucket objects.
 */
-(NSArray *)listBuckets;

/** Returns a list of all Amazon S3 buckets that the authenticated sender of the request owns.
 *
 * @param listBucketsRequest An S3ListBucketsRequest object that defines the parameters of the request.
 * @return An S3ListBucketsResponse from S3. The <code>buckets</code> property of the 
 * S3ListBucketsResult has the list of buckets.
 */
-(S3ListBucketsResponse *)listBuckets:(S3ListBucketsRequest *)listBucketsRequest;

/** Creates a bucket using the the specified request object.
 *
 * @param createBucketRequest An S3CreateBucketRequest that defines the parameters of the request.
 * @return An S3CreateBucketResponse from S3
 */
-(S3CreateBucketResponse *)createBucket:(S3CreateBucketRequest *)createBucketRequest;

/** Deletes a bucket with the specified name. All objects in the bucket must be deleted before the
 * bucket itself can be deleted.
 *
 * @param deleteBucketRequest An S3DeleteBucketRequest that defines the parameters of the request.
 * @return An S3DeleteBucketResponse from S3
 */
-(S3DeleteBucketResponse *)deleteBucket:(S3DeleteBucketRequest*)deleteBucketRequest;

/** Takes in a bucket's name and lists the location of the bucket. 
 * This information can be used to determine the bucket's geographical location.
 * To determine the location of a bucket, you must be the bucket owner
 * @param bucketName The name of the bucket.
 * @return The S3Region object that represents the region.
 */
-(S3Region *)getBucketLocation:(NSString *)bucketName;

/** Retrieve metadata from an object without returning the object itself.
 *
 * @param getObjectMetadataRequest The S3DeleteBucketRequest object that defines the parameters of the request.
 * @returns An S3GetObjectMetadataResponse from S3.
 */
-(S3GetObjectMetadataResponse *)getObjectMetadata:(S3GetObjectMetadataRequest *)getObjectMetadataRequest;

/** Upload an object to S3.
 *
 * @param putObjectRequest The S3PutObjectRequest that defines the parameters of the request.
 * @return An S3PutObjectResponse from S3.
 */
-(S3PutObjectResponse *)putObject:(S3PutObjectRequest *)putObjectRequest;

/** Fetch the most recent version of an S3 object
 * from the specified S3 bucket. You must have READ access to the object.
 * If READ access is granted to an anonymous user, an object can be retrieved
 * without an authorization header. Providing a version-id for the object will
 * fetch the specific version from S3 instead of the most recent one.
 *
 * @param getObjectRequest The S3GetObjectRequest that defines the parameters of the request.
 * @return An S3GetObjectResponse from S3.
 */
-(S3GetObjectResponse *)getObject:(S3GetObjectRequest *)getObjectRequest;

/** Removes the specified object from Amazon S3. 
 * Once deleted, there is no method to restore or undelete an object.
 *
 * @param deleteObjectRequest The S3DeleteObjectRequest that defines the parameters of the operation.
 * @return An S3DeleteObjectResponse from S3.
 */
-(S3DeleteObjectResponse *)deleteObject:(S3DeleteObjectRequest *)deleteObjectRequest;

/** List the objects in a bucket.
 *
 * @param listObjectsRequest The S3ListObjectsRequest that defines the parameters of the operation.
 * @return An S3ListObjectsResponse from S3.
 */
-(S3ListObjectsResponse *)listObjects:(S3ListObjectsRequest *)listObjectsRequest;

/** List the objects in a bucket.
 *
 * @param bucketName The name of the bucket.
 * @return An NSArray of S3ObjectSummary objects.
 */
-(NSArray *)listObjectsInBucket:(NSString *)bucketName;

/**
 * Create a copy of an object that is already stored in Amazon S3.
 * When copying an object, you can preserve all metadata (default) or specify new metadata.
 * However, the ACL is not preserved and is set to private for the user making the request.
 * To override the default ACL setting, specify a new ACL when generating a copy request.
 */
-(S3CopyObjectResponse *)copyObject:(S3CopyObjectRequest *)copyObjectRequest;

/**
 * Gets the access control list for a given bucket or object.
 *
 * @param getACLRequest The S3GetACLRequest that defines the parameters of the operation.
 * @return An S3GetACLResponse from S3.
 */
-(S3GetACLResponse *)getACL:(S3GetACLRequest *)getACLRequest;

/**
 * Sets the S3AccessControlList for a given bucket or object.
 *
 * @param setACLRequest The S3SetACLRequest that defines the parameters of the operation.
 * @return An S3SetACLResponse from S3.
 */
-(S3SetACLResponse *)setACL:(S3SetACLRequest *)setACLRequest;

/** Creates a signed http request.
 * Query string authentication is useful for giving HTTP or browser
 * access to resources that would normally require authentication.
 * When using query string authentication, you create a query,
 * specify an expiration time for the query, sign it with your
 * signature, place the data in an HTTP request, and distribute
 * the request to a user or embed the request in a web page.
 * A PreSigned URL can be generated for GET, PUT and HEAD
 * operations on your bucket, and keys.
 *
 * @param preSignedURLRequest The S3GetPreSignedURLRequest that defines the parameters of the operation.
 * @return An signed NSURL for the resource.
 */
-(NSURL *)getPreSignedURL:(S3GetPreSignedURLRequest *)preSignedURLRequest;

///** Sign a URL request. 
// *
// * @see http://docs.amazonwebservices.com/AmazonS3/2006-03-01/dev/index.html?RESTAccessPolicy.html
// *
// * @param request a mutable URL request
// * @return the signed request
// */
//-(NSURLRequest *)signURLRequest:(NSMutableURLRequest *)request;

/** Constructs an empty response object of the appropriate type to match the given request
 * object.
 * @param request An instance of a subclass of S3Request.
 * @return An instance of the appropriate subclass of S3Response, or 
 *         an instance of S3Response if there is no response class to
 *         match the instance passed in.
 */
+(S3Response *)constructResponseFromRequest:(S3Request *)request;

/** Ensure that all response classes have been loaded by the runtime. */
+(void)initializeResponseObjects;

/** Utility method that sends the raw S3 Request to be processed.
 *
 * @param request A request describing the parameters of an S3 request. 
 * @return The response from S3.
 */
-(S3Response *)invoke:(S3Request *)request;

/** Return the version of the S3 API */
+(NSString *)apiVersion;
@end
