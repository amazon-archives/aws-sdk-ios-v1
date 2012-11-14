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
#import <CommonCrypto/CommonHMAC.h>

#import "../AmazonWebServiceClient.h"
#import "../AmazonSDKUtil.h"

#import "S3Constants.h"
#import "S3AbstractPutRequest.h"
#import "S3AccessControlList.h"
#import "S3AccessControlListUnmarshaller.h"
#import "S3Bucket.h"
#import "S3BucketNameUtilities.h"
#import "S3BucketUnmarshaller.h"
#import "S3GetBucketPolicyRequest.h"
#import "S3GetBucketPolicyResponse.h"
#import "S3SetBucketPolicyRequest.h"
#import "S3SetBucketPolicyResponse.h"
#import "S3DeleteVersionRequest.h"
#import "S3DeleteVersionResponse.h"
#import "S3ListVersionsRequest.h"
#import "S3ListVersionsResponse.h"
#import "S3GetBucketVersioningConfigurationRequest.h"
#import "S3GetBucketVersioningConfigurationResponse.h"
#import "S3SetBucketVersioningConfigurationRequest.h"
#import "S3SetBucketVersioningConfigurationResponse.h"
#import "S3DeleteBucketPolicyRequest.h"
#import "S3DeleteBucketPolicyResponse.h"
#import "S3CannedACL.h"
#import "S3CopyObjectRequest.h"
#import "S3CopyObjectResponse.h"
#import "S3CreateBucketRequest.h"
#import "S3CreateBucketResponse.h"
#import "S3DeleteBucketRequest.h"
#import "S3DeleteBucketResponse.h"
#import "S3DeleteObjectRequest.h"
#import "S3DeleteObjectResponse.h"
#import "S3DeleteObjectsRequest.h"
#import "S3DeleteObjectsResponse.h"
#import "DeleteError.h"
#import "DeletedObject.h"
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
#import "S3UploadInputStream.h"
#import "S3ServiceModel.h"
#import "S3ServiceTransform.h"
#import "S3SetACLRequest.h"
#import "S3SetACLResponse.h"
#import "S3InitiateMultipartUploadRequest.h"
#import "S3InitiateMultipartUploadResponse.h"
#import "S3MultipartUpload.h"
#import "S3AbortMultipartUploadRequest.h"
#import "S3AbortMultipartUploadResponse.h"
#import "S3ListMultipartUploadsRequest.h"
#import "S3ListMultipartUploadsResponse.h"
#import "S3UploadPartRequest.h"
#import "S3UploadPartResponse.h"
#import "S3ListPartsRequest.h"
#import "S3ListPartsResponse.h"
#import "S3CompleteMultipartUploadRequest.h"
#import "S3CompleteMultipartUploadResponse.h"
#import "S3CopyPartRequest.h"
#import "S3CopyPartResponse.h"
#import "S3CopyObjectResponse.h"
#import "S3SetBucketWebsiteConfigurationRequest.h"
#import "S3SetBucketWebsiteConfigurationResponse.h"
#import "S3GetBucketWebsiteConfigurationRequest.h"
#import "S3GetBucketWebsiteConfigurationResponse.h"
#import "S3DeleteBucketWebsiteConfigurationRequest.h"
#import "S3DeleteBucketWebsiteConfigurationResponse.h"
#import "S3BucketLifecycleConfiguration.h"
#import "S3SetBucketLifecycleConfigurationRequest.h"
#import "S3SetBucketLifecycleConfigurationResponse.h"
#import "S3GetBucketLifecycleConfigurationRequest.h"
#import "S3GetBucketLifecycleConfigurationResponse.h"
#import "S3DeleteBucketLifecycleConfigurationRequest.h"
#import "S3DeleteBucketLifecycleConfigurationResponse.h"
#import "S3SetBucketTaggingRequest.h"
#import "S3SetBucketTaggingResponse.h"
#import "S3GetBucketTaggingRequest.h"
#import "S3GetBucketTaggingResponse.h"
#import "S3DeleteBucketTaggingRequest.h"
#import "S3DeleteBucketTaggingResponse.h"
#import "S3SetBucketCrossOriginRequest.h"
#import "S3SetBucketCrossOriginResponse.h"
#import "S3GetBucketCrossOriginRequest.h"
#import "S3GetBucketCrossOriginResponse.h"
#import "S3DeleteBucketCrossOriginRequest.h"
#import "S3DeleteBucketCrossOriginResponse.h"
#import "S3RestoreObjectRequest.h"
#import "S3RestoreObjectResponse.h"

/** \defgroup S3 Amazon S3 */

/** AmazonS3Client is an implementation of AmazonS3.
 *
 * The client allows you to manage your AmazonS3 buckets and keys/objects.
 *
 * Amazon S3 is storage for the Internet. It is designed to make web-scale computing easier for developers.
 * Amazon S3 provides a simple web services interface that can be used to store and retrieve any amount of data,
 * at any time, from anywhere on the web. It gives any developer access to the same highly scalable, reliable,
 * fast, inexpensive data storage infrastructure that Amazon uses to run its own global network of web sites.
 * The service aims to maximize benefits of scale and to pass those benefits on to developers.
 *
 */
@interface AmazonS3Client:AmazonWebServiceClient {}

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
 * @see S3ListBucketsResponse
 * @see S3ListBucketsRequest
 */
-(S3ListBucketsResponse *)listBuckets:(S3ListBucketsRequest *)listBucketsRequest;

/** Creates a bucket using the the specified request object.
 *
 * @param createBucketRequest An S3CreateBucketRequest that defines the parameters of the request.
 * @return An S3CreateBucketResponse from S3
 * @see S3CreateBucketResponse
 * @see S3CreateBucketRequest
 */
-(S3CreateBucketResponse *)createBucket:(S3CreateBucketRequest *)createBucketRequest;

/** Creates a bucket using the the specified bucket name.
 *
 * @param bucketName The name for the bucket to be created.
 * @return An S3CreateBucketResponse from S3
 * @see S3CreateBucketResponse
 */
-(S3CreateBucketResponse *)createBucketWithName:(NSString *)bucketName;

/** Deletes a bucket with the specified name. All objects in the bucket must be deleted before the
 * bucket itself can be deleted.
 *
 * @param deleteBucketRequest An S3DeleteBucketRequest that defines the parameters of the request.
 * @return An S3DeleteBucketResponse from S3
 * @see S3DeleteBucketResponse
 * @see S3DeleteBucketRequest
 */
-(S3DeleteBucketResponse *)deleteBucket:(S3DeleteBucketRequest *)deleteBucketRequest;

/** Deletes a bucket with the specified name. All objects in the bucket must be deleted before the
 * bucket itself can be deleted.
 *
 * @param bucketName The name of the bucket to be deleted.
 * @return An S3DeleteBucketResponse from S3
 * @see S3DeleteBucketResponse
 */
-(S3DeleteBucketResponse *)deleteBucketWithName:(NSString *)bucketName;

/** Takes in a bucket's name and lists the location of the bucket.
 * This information can be used to determine the bucket's geographical location.
 * To determine the location of a bucket, you must be the bucket owner
 * @param bucketName The name of the bucket.
 * @return The S3Region object that represents the region.
 * @see S3Region
 */
-(S3Region *)getBucketLocation:(NSString *)bucketName;

/** Retrieve metadata from an object without returning the object itself.
 *
 * @param getObjectMetadataRequest The S3DeleteBucketRequest object that defines the parameters of the request.
 * @returns An S3GetObjectMetadataResponse from S3.
 * @see S3GetObjectMetadataResponse
 * @see S3GetObjectMetadataRequest
 */
-(S3GetObjectMetadataResponse *)getObjectMetadata:(S3GetObjectMetadataRequest *)getObjectMetadataRequest;

/** Upload an object to S3.
 *
 * @param putObjectRequest The S3PutObjectRequest that defines the parameters of the request.
 * @return An S3PutObjectResponse from S3.
 * @see S3PutObjectResponse
 * @see S3PutObjectRequest
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
 * @see S3GetObjectResponse
 * @see S3GetObjectRequest
 */
-(S3GetObjectResponse *)getObject:(S3GetObjectRequest *)getObjectRequest;

/** Removes the specified object from Amazon S3.
 * Once deleted, there is no method to restore or undelete an object.
 *
 * @param deleteObjectRequest The S3DeleteObjectRequest that defines the parameters of the operation.
 * @return An S3DeleteObjectResponse from S3.
 * @see S3DeleteObjectResponse
 * @see S3DeleteObjectRequest
 */
-(S3DeleteObjectResponse *)deleteObject:(S3DeleteObjectRequest *)deleteObjectRequest;

/** Removes the specified objects from Amazon S3.
 * Once deleted, there is no method to restore or undelete an object.
 * Check S3DeleteObjectsResponse.deleteErrors to see if there were any errors after calling this method.
 * - When there was no error, deleteErrors will be an empty NSArray.
 * - When there were any errors, deleteErrors contains a list of DeleteError objects.
 *
 * @param deleteObjectsRequest The S3DeleteObjectsRequest that defines the parameters of the operation.
 * @return An S3DeleteObjectsResponse from S3.
 * @see S3DeleteObjectsResponse
 * @see S3DeleteObjectsRequest
 */
-(S3DeleteObjectsResponse *)deleteObjects:(S3DeleteObjectsRequest *)deleteObjectsRequest;

/** Removes the specified object from Amazon S3.
 * Once deleted, there is no method to restore or undelete an object.
 *
 * @param theKey The key of the object to be deleted.
 * @param theBucket The bucket containing the object to be deleted.
 * @return An S3DeleteObjectResponse from S3.
 * @see S3DeleteObjectResponse
 */
-(S3DeleteObjectResponse *)deleteObjectWithKey:(NSString *)theKey withBucket:(NSString *)theBucket;

/** List the objects in a bucket.
 *
 * @param listObjectsRequest The S3ListObjectsRequest that defines the parameters of the operation.
 * @return An S3ListObjectsResponse from S3.
 * @see S3ListObjectsResponse
 * @see S3ListObjectsRequest
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
 * @see S3CopyObjectResponse
 * @see S3CopyObjectRequest
 */
-(S3CopyObjectResponse *)copyObject:(S3CopyObjectRequest *)copyObjectRequest __attribute__((deprecated)); // Use objectCopy: instead.

-(S3CopyObjectResponse *)objectCopy:(S3CopyObjectRequest *)copyObjectRequest;

/**
 * Gets the access control list for a given bucket or object.
 *
 * @param getACLRequest The S3GetACLRequest that defines the parameters of the operation.
 * @return An S3GetACLResponse from S3.
 * @see S3GetACLResponse
 * @see S3GetACLRequest 
 */
-(S3GetACLResponse *)getACL:(S3GetACLRequest *)getACLRequest;

/**
 * Sets the S3AccessControlList for a given bucket or object.
 *
 * @param setACLRequest The S3SetACLRequest that defines the parameters of the operation.
 * @return An S3SetACLResponse from S3.
 * @see S3SetACLResponse
 * @see S3SetACLRequest 
 */
-(S3SetACLResponse *)setACL:(S3SetACLRequest *)setACLRequest;

/** Gets the policy for the specified bucket. Only the owner of the
 * bucket can retrieve the policy. If no policy has been set for the bucket,
 * then an empty result object with a <code>null</code> policy text field will be
 * returned.
 *
 * Bucket policies provide access control management at the bucket level for
 * both the bucket resource and contained object resources. Only one policy
 * can be specified per-bucket.
 * @see S3GetBucketPolicyResponse
 * @see S3GetBucketPolicyRequest
 */
-(S3GetBucketPolicyResponse *)getBucketPolicy:(S3GetBucketPolicyRequest *)getPolicyRequest;

/** Sets the policy associated with the specified bucket. Only the owner of
 * the bucket can set a bucket policy. If a policy already exists for the
 * specified bucket, the new policy replaces the existing policy.
 *
 * Bucket policies provide access control management at the bucket level for
 * both the bucket resource and contained object resources. Only one policy
 * can be specified per-bucket.
 * @see S3SetBucketPolicyResponse
 * @see S3SetBucketPolicyRequest
 */
-(S3SetBucketPolicyResponse *)setBucketPolicy:(S3SetBucketPolicyRequest *)setPolicyRequest;

/** Deletes the policy associated with the specified bucket. Only the owner
 * of the bucket can delete the bucket policy.
 *
 * Bucket policies provide access control management at the bucket level for
 * both the bucket resource and contained object resources. Only one policy
 * can be specified per-bucket.
 * @see S3DeleteBucketPolicyResponse
 * @see S3DeleteBucketPolicyRequest
 */
-(S3DeleteBucketPolicyResponse *)deleteBucketPolicy:(S3DeleteBucketPolicyRequest *)deletePolicyRequest;

/** Returns the versioning configuration for the specified bucket.
 * A bucket's versioning configuration can be in one of three possible
 * states: Off, Enabled, or Suspended
 *
 * By default, new buckets are in the Off state. Once versioning is
 * enabled for a bucket the status can never be reverted to Off.
 *
 * The versioning configuration of a bucket has different implications for
 * each operation performed on that bucket or for objects within that
 * bucket. For example, when versioning is enabled a <code>PutObject</code>
 * operation creates a unique object version-id for the object being uploaded. The
 * The <code>PutObject</code> API guarantees that, if versioning is enabled for a bucket at
 * the time of the request, the new object can only be permanently deleted
 * using a <code>DeleteVersion</code> operation. It can never be overwritten.
 * Additionally, the <code>PutObject</code> API guarantees that,
 * if versioning is enabled for a bucket the request,
 * no other object will be overwritten by that request.
 * Refer to the documentation sections for each API for information on how
 * versioning status affects the semantics of that particular API.
 * @see S3GetBucketVersioningConfigurationResponse
 * @see S3GetBucketVersioningConfigurationRequest
 */
-(S3GetBucketVersioningConfigurationResponse *)getBucketVersioningConfiguration:(S3GetBucketVersioningConfigurationRequest *)getBucketVersioningConfigurationRequest;

/** Sets the versioning configuration for the specified bucket.
 * A bucket's versioning configuration can be in one of three possible
 * states: Off, Enabled, or Suspended
 *
 * By default, new buckets are in the Off state. Once versioning is
 * enabled for a bucket the status can never be reverted to Off.
 *
 * Objects created before versioning was enabled or when versioning is
 * suspended will be given the default <code>null</code> version ID. Note
 * that the <code>null</code> version ID is a valid version ID and is not
 * the same as not having a version ID.
 *
 * The versioning configuration of a bucket has different implications for
 * each operation performed on that bucket or for objects within that
 * bucket. For example, when versioning is enabled a <code>PutObject</code>
 * operation creates a unique object version-id for the object being uploaded. The
 * The <code>PutObject</code> API guarantees that, if versioning is enabled for a bucket at
 * the time of the request, the new object can only be permanently deleted
 * using a <code>DeleteVersion</code> operation. It can never be overwritten.
 * Additionally, the <code>PutObject</code> API guarantees that,
 * if versioning is enabled for a bucket the request,
 * no other object will be overwritten by that request.
 * Refer to the documentation sections for each API for information on how
 * versioning status affects the semantics of that particular API.
 * @see S3SetBucketVersioningConfigurationResponse
 * @see S3SetBucketVersioningConfigurationRequest
 */
-(S3SetBucketVersioningConfigurationResponse *)setBucketVersioningConfiguration:(S3SetBucketVersioningConfigurationRequest *)setBucketVersioningConfigurationRequest;

/**
 * Sets the website configuration for the specified bucket. Bucket
 * website configuration allows you to host your static websites entirely
 * out of Amazon S3. To host your website in Amazon S3, create a bucket,
 * upload your files, and configure it as a website. Once your bucket has
 * been configured as a website, you can access all your content via the
 * Amazon S3 website endpoint. To ensure that the existing Amazon S3 REST
 * API will continue to behave the same, regardless of whether or not your
 * bucket has been configured to host a website, a new HTTP endpoint has
 * been introduced where you can access your content. The bucket content you
 * want to make available via the website must be publicly readable.
 * <p>
 * For more information on how to host a website on Amazon S3, see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html</a>.
 * <p>
 * This operation requires the <code>S3:PutBucketWebsite</code> permission.
 * By default, only the bucket owner can configure the website attached to a
 * bucket. However, bucket owners can allow other users to set the website
 * configuration by writing a bucket policy granting them the
 * <code>S3:PutBucketWebsite</code> permission.
 *
 * @param bucketName  The name of the bucket whose website configuration is being
 *            set.
 * @param configuration  The configuration describing how the specified bucket will
 *            serve web requests (i.e. default index page, error page).
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3SetBucketWebsiteConfigurationResponse
 * @see S3SetBucketWebsiteConfigurationRequest
 */
-(S3SetBucketWebsiteConfigurationResponse *)setBucketWebsiteConfiguration:(S3SetBucketWebsiteConfigurationRequest *)setBucketWebsiteConfigurationRequest;

/**
 * Returns the website configuration for the specified bucket. Bucket
 * website configuration allows you to host your static websites entirely
 * out of Amazon S3. To host your website in Amazon S3, create a bucket,
 * upload your files, and configure it as a website. Once your bucket has
 * been configured as a website, you can access all your content via the
 * Amazon S3 website endpoint. To ensure that the existing Amazon S3 REST
 * API will continue to behave the same, regardless of whether or not your
 * bucket has been configured to host a website, a new HTTP endpoint has
 * been introduced where you can access your content. The bucket content you
 * want to make available via the website must be publicly readable.
 * <p>
 * For more information on how to host a website on Amazon S3, see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html</a>.
 * <p>
 * This operation requires the <code>S3:GetBucketWebsite</code> permission.
 * By default, only the bucket owner can read the bucket website
 * configuration. However, bucket owners can allow other users to read the
 * website configuration by writing a bucket policy granting them the
 * <code>S3:GetBucketWebsite</code> permission.
 *
 * @param bucketName  The name of the bucket whose website configuration is being
 *            retrieved.
 *
 * @return The bucket website configuration for the specified bucket,
 *         otherwise null if there is no website configuration set for the
 *         specified bucket.
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3GetBucketWebsiteConfigurationResponse
 * @see S3GetBucketWebsiteConfigurationRequest
 */
-(S3GetBucketWebsiteConfigurationResponse *)getBucketWebsiteConfiguration:(S3GetBucketWebsiteConfigurationRequest *)getBucketWebsiteConfigurationRequest;

/**
 * This operation removes the website configuration for a bucket. Calling
 * this operation on a bucket with no website configuration does <b>not</b>
 * throw an exception. Calling this operation a bucket that does not exist
 * <b>will</b> throw an exception.
 * <p>
 * For more information on how to host a website on Amazon S3, see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/WebsiteHosting.html</a>.
 * <p>
 * This operation requires the <code>S3:DeleteBucketWebsite</code>
 * permission. By default, only the bucket owner can delete the website
 * configuration attached to a bucket. However, bucket owners can grant
 * other users permission to delete the website configuration by writing a
 * bucket policy granting them the <code>S3:DeleteBucketWebsite</code>
 * permission.
 *
 * @param bucketName  The name of the bucket whose website configuration is being
 *            deleted.
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3DeleteBucketWebsiteConfigurationResponse
 * @see S3DeleteBucketWebsiteConfigurationRequest
 */
-(S3DeleteBucketWebsiteConfigurationResponse *)deleteBucketWebsiteConfiguration:(S3DeleteBucketWebsiteConfigurationRequest *)deleteBucketWebsiteConfigurationRequest;

/**
 * Sets the lifecycle configuration for the specified bucket. Bucket
 * lifecycle configuration allows you specify a number of rules for object 
 * based on the object's key prefix.  Each rule is a combination of id, prefix
 * status and expiration time (in days).
 * <p>
 * For more informaiton on how to use Bucket Lifecycle/Object Expiration see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/ObjectExpiration.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/ObjectExpiration.html</a>.
 *
 * @param setBucketLifecycleConfigurationRequest  The request to process
 * 
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3SetBucketLifecycleConfigurationResponse
 * @see S3SetBucketLifecycleConfigurationRequest
 */
-(S3SetBucketLifecycleConfigurationResponse *)setBucketLifecycleConfiguration:(S3SetBucketLifecycleConfigurationRequest *)setBucketLifecycleConfigurationRequest;

/**
 * Returns the the lifecycle configuration for the specified bucket. Bucket
 * lifecycle configuration allows you specify a number of rules for object 
 * based on the object's key prefix.  Each rule is a combination of id, prefix
 * status and expiration time (in days).
 * <p>
 * For more informaiton on how to use Bucket Lifecycle/Object Expiration see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/ObjectExpiration.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/ObjectExpiration.html</a>.
 *
 * @param getBucketLifecycleConfigurationRequest The request to process
 *
 * @return The bucket lifecycle configuration for the specified bucket,
 *         otherwise null if there is no Lifecycle configuration set for the
 *         specified bucket.
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3GetBucketLifecycleConfigurationResponse
 * @see S3GetBucketLifecycleConfigurationRequest
 */
-(S3GetBucketLifecycleConfigurationResponse *)getBucketLifecycleConfiguration:(S3GetBucketLifecycleConfigurationRequest *)getBucketLifecycleConfigurationRequest;

/**
 * This operation removes the lifecycle configuration for a bucket. Calling
 * this operation on a bucket with no lifecycle configuration does <b>not</b>
 * throw an exception. Calling this operation on a bucket that does not exist
 * <b>will</b> throw an exception.
 * <p>
 * For more informaiton on how to use Bucket Lifecycle/Object Expiration see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/ObjectExpiration.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/ObjectExpiration.html</a>.
 *
 * @param deleteBucketLifecycleConfigurationRequest The request to process
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3DeleteBucketLifecycleConfigurationResponse
 * @see S3DeleteBucketLifecycleConfigurationRequest
 */
-(S3DeleteBucketLifecycleConfigurationResponse *)deleteBucketLifecycleConfiguration:(S3DeleteBucketLifecycleConfigurationRequest *)deleteBucketLifecycleConfigurationRequest;

/**
 * Sets the tagging configuration for the specified bucket.  A tagging configuration contains a TagSet.
 * <p>
 * For more informaiton on how to using Bucket Cost Allocation Tagging see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketBilling.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketBilling.html</a>.
 *
 * @param setBucketTaggingRequest request to process
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3SetBucketTaggingResponse
 * @see S3SetBucketTaggingRequest
 */
-(S3SetBucketTaggingResponse *)setBucketTagging:(S3SetBucketTaggingRequest *)setBucketTaggingRequest;

/**
 * Gets the tagging configuration for the specified bucket, or null if no
 * configuration has been established.
 * <p>
 * For more informaiton on how to using Bucket Cost Allocation Tagging see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketBilling.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketBilling.html</a>.
 *
 * @param getBucketTaggingRequest  The request to process
 *
 * @return The bucket lifecycle configuration for the specified bucket,
 *         otherwise null if there is no Lifecycle configuration set for the
 *         specified bucket.
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3GetBucketTaggingResponse
 * @see S3GetBucketTaggingRequest
 */
-(S3GetBucketTaggingResponse *)getBucketTagging:(S3GetBucketTaggingRequest *)getBucketTaggingRequest;

/**
 * Deletes the tagging configuration for the specified bucket
 * <p> 
 * For more informaiton on how to using Bucket Cost Allocation Tagging see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketBilling.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/BucketBilling.html</a>.
 * @param deleteBucketTaggingRequest The request to process
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3DeleteBucketTaggingResponse
 * @see S3DeleteBucketTaggingRequest
 */
-(S3DeleteBucketTaggingResponse *)deleteBucketTagging:(S3DeleteBucketTaggingRequest *)deleteBucketTaggingRequest;


/**
 * Sets the CORS configuration for the specified bucket, or null if no
 * configuration has been established. CORS config is comprised of a set of rules.
 * <p>
 * For more informaiton on how to using Bucket CORS see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/cors.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/cors.html</a>.
 *
 * @param setBucketCrossOriginRequest request to process
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3SetBucketCrossOriginResponse
 * @see S3SetBucketCrossOriginRequest
 */
-(S3SetBucketCrossOriginResponse *)setBucketCrossOrigin:(S3SetBucketCrossOriginRequest *)setBucketCrossOriginRequest;

/**
 * Gets the CrossOrigin configuration for the specified bucket, or null if no
 * configuration has been established.
 * <p>
 * For more informaiton on how to using Bucket CORS see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/cors.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/cors.html</a>.
 *
 * @param getBucketCrossOriginRequest request to process
 *
 * @return A response which will contain the CORS config for bucket.
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3GetBucketCrossOriginResponse
 * @see S3GetBucketCrossOriginRequest
 */
-(S3GetBucketCrossOriginResponse *)getBucketCrossOrigin:(S3GetBucketCrossOriginRequest *)getBucketCrossOriginRequest;

/**
 * Deletes the CrossOrigin configuration for the specified bucket
 * <p>
 * For more informaiton on how to using Bucket CORS see:
 * <a href="http://docs.amazonwebservices.com/AmazonS3/latest/dev/cors.html">http://docs.amazonwebservices.com/AmazonS3/latest/dev/cors.html</a>.
 *
 * @param deleteBucketCrossOriginRequest  the request to process
 *
 * @exception AmazonClientException  If any errors are encountered on the client while making the
 *             request or handling the response. For more information see <AmazonClientException>.
 * @exception AmazonServiceException  If any errors occurred in Amazon S3 while processing the
 *             request.  For more information see <AmazonServiceException>.
 * @see S3DeleteBucketCrossOriginResponse
 * @see S3DeleteBucketCrossOriginRequest
 */
-(S3DeleteBucketCrossOriginResponse *)deleteBucketCrossOrigin:(S3DeleteBucketCrossOriginRequest *)deleteBucketCrossOriginRequest;

/** Deletes a specific version of an object in the specified bucket. Once
 * deleted, there is no method to restore or undelete an object version.
 * This is the only way to permanently delete object versions that are
 * protected by versioning.
 *
 * Deleting an object version is permanent and irreversible.
 * It is a privileged operation that only the owner of the bucket containing the
 * version can perform.
 * @see S3DeleteVersionResponse
 * @see S3DeleteVersionRequest
 */
-(S3DeleteVersionResponse *)deleteVersion:(S3DeleteVersionRequest *)deleteVersionRequest;

/** Returns a list of summary information about the versions in the specified bucket.
 *
 * The returned version summaries are ordered first by key and then by
 * version. Keys are sorted lexicographically (alphabetically)
 * while versions are sorted from most recent to least recent.
 * Both versions with data and delete markers are included in the results.
 * @see S3ListVersionsResponse
 * @see S3ListVersionsRequest
 */
-(S3ListVersionsResponse *)listVersions:(S3ListVersionsRequest *)lisVersionsRequest;

/** Initiates a multipart upload and returns an InitiateMultipartUploadResponse.
 *
 * @param initiateMultipartUploadRequest The S3InitiateMultipartUploadRequest that defines the paramaters of the operation.
 * @see S3InitiateMultipartUploadResponse
 * @see S3InitiateMultipartUploadRequest
 */
-(S3InitiateMultipartUploadResponse *)initiateMultipartUpload:(S3InitiateMultipartUploadRequest *)initiateMultipartUploadRequest;

/** Initiates a multipart upload and returns an MultipartUpload instance
 * which contains an upload ID. This upload ID associates all the
 * parts in the specific upload. You specify this upload ID in each of
 * your subsequent Upload Part requests. You also include
 * this upload ID in the final request to either complete, or abort
 * the multipart upload request.
 *
 * @param theKey The key the the completed object will have
 * @param theBucket The bucket where the completed object will reside.
 * @return An S3MultipartUpload object which contains the uploadId for the upload.
 * @see S3MultipartUpload
 */
-(S3MultipartUpload *)initiateMultipartUploadWithKey:(NSString *)theKey withBucket:(NSString *)theBucket;

/** Aborts a multipart upload.
 * After a multipart upload is aborted, no additional parts can be uploaded using that upload ID.
 * The storage consumed by any previously uploaded parts will be freed.
 * However, if any part uploads are currently in progress, those part uploads might or might not succeed.
 * As a result, it might be necessary to abort a given multipart upload multiple times in order to completely
 * free all storage consumed by all parts.
 *
 * @param abortMultipartUploadRequest The S3AbortMultipartUploadRequest which defines the parameters of the operation.
 * @returns An S3AbortMultipartUploadResponse from S3.
 * @see S3AbortMultipartUploadResponse
 * @see S3AbortMultipartUploadRequest
 */
-(S3AbortMultipartUploadResponse *)abortMultipartUpload:(S3AbortMultipartUploadRequest *)abortMultipartUploadRequest;

/** This operation lists in-progress multipart uploads.
 * An in-progress
 * multipart upload is a multipart upload that has been initiated,
 * using the InitiateMultipartUpload request, but has not yet been
 * completed or aborted.
 *
 * This operation returns at most 1,000 multipart uploads in the
 * response by default. The number of multipart uploads can be further
 * limited using the MaxUploads property on the request parameter. If there are
 * additional multipart uploads that satisfy the list criteria, the
 * response will contain an IsTruncated property with the value set to true.
 * To list the additional multipart uploads use the KeyMarker and
 * UploadIdMarker properties on the request parameters.
 *
 * @param listMultipartUploadsRequest The ListMultipartUploadsRequest that defines the parameters of the operation.
 * @return Returns a ListMultipartUploadsResponse from S3.</returns>
 * @see S3ListMultipartUploadsResponse
 * @see S3ListMultipartUploadsRequest
 */
-(S3ListMultipartUploadsResponse *)listMultipartUploads:(S3ListMultipartUploadsRequest *)listMultipartUploadsRequest;

/** Uploads a part in a multipart upload.
 * You must initiate a multipart upload before you can upload any part.
 *
 * Your uploadPart request must include an upload ID and a part number.
 * The upload ID is the ID returned by Amazon S3 in response to your
 * Initiate Multipart Upload request. Part number can be any number between 1 and
 * 10,000, inclusive. A part number uniquely identifies a part and also
 * defines its position within the object being uploaded. If you
 * upload a new part using the same part number that was specified in uploading a
 * previous part, the previously uploaded part is overwritten.
 *
 * When you upload a part, the S3UploadPartResponse response contains an etag property.
 * You should record this etag property value and the part
 * number. After uploading all parts, you must send a completeMultipartUpload
 * request. At that time Amazon S3 constructs a complete object by
 * concatenating all the parts you uploaded, in ascending order based on
 * the part numbers. The completeMultipartUpload request requires you to
 * send all the part numbers and the corresponding etag values.
 *
 * @param uploadPartRequest The S3UploadPartRequest that defines the parameters of the operation.
 * @return An S3UploadPartResponse from S3.
 * @see S3UploadPartResponse
 * @see S3UploadPartRequest
 */

-(S3UploadPartResponse *)uploadPart:(S3UploadPartRequest *)uploadPartRequest;

/** Lists the parts that have been uploaded for a particular multipart upload.
 *
 * This method must include the upload ID, returned by
 * the initiateMultipartUpload request. This request
 * returns a maximum of 1000 uploaded parts by default. You can
 * restrict the number of parts returned by specifying the
 * maxParts property on the listPartsRequest. If your multipart
 * upload consists of more parts than allowed in the
 * listParts response, the response returns a isTruncated
 * field with value true, and a nextPartNumberMarker property.
 * In subsequent listParts request you can include the
 * partNumberMarker property and set its value to the
 * nextPartNumberMarker property value from the previous response.
 *
 * @param listPartsRequest The S3ListPartsRequest that defines the parameters of the operation.
 *
 * @return An S3ListPartsResponse from S3.
 * @see S3ListPartsResponse
 * @see S3ListPartsRequest
 */
-(S3ListPartsResponse *)listParts:(S3ListPartsRequest *)listPartsRequest;

/**
 * @see S3CopyPartResponse
 * @see S3CopyPartRequest
 */
-(S3CopyPartResponse *)copyPart:(S3CopyPartRequest *)copyPartRequest __attribute__((deprecated)); // Use partCopy: instead.

-(S3CopyPartResponse *)partCopy:(S3CopyPartRequest *)copyPartRequest;


/** Completes a multipart upload by assembling previously uploaded parts.
 * You first upload all parts using the uploadPart method.
 * After successfully uploading all relevant parts of an upload,
 * you call this operation to complete the upload. Upon receiving
 * this request, Amazon S3 concatenates all the parts in ascending
 * order by part number to create a new object. In the
 * completeMultipartUpload request, you must provide the
 * parts list. For each part in the list, you provide the
 * part number and the ETag header value, returned after that
 * part was uploaded.
 * Processing of a completeMultipartUpload request may take
 * several minutes to complete.
 * @param completeMultipartUploadRequest The CompleteMultipartUploadRequest that defines the parameters of the operation.
 * @return An S3CompleteMultipartUploadResponse from S3.
 * @see S3CompleteMultipartUploadResponse
 * @see S3CompleteMultipartUploadRequest 
 */
-(S3CompleteMultipartUploadResponse *)completeMultipartUpload:(S3CompleteMultipartUploadRequest *)completeMultipartUploadRequest;

/** Request temporary restoration of an object which was transitioned 
 * to Amazon Glacier from Amazon S3 via life cycle configuration.
 * @param restoreObjectRequest The RestoreObjectRequest that defines the parameters of the operation.
 * @return An RestoreObjectResponse from S3.
 * @see S3RestoreObjectRequest
 */
-(S3RestoreObjectResponse *)restoreObject:(S3RestoreObjectRequest *)restoreObjectRequest;

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
 * @see S3GetPreSignedURLRequest
 */
-(NSURL *)getPreSignedURL:(S3GetPreSignedURLRequest *)preSignedURLRequest;

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
 * @param error A reference to an NSError object.
 * @return An signed NSURL for the resource.
 * @see S3GetPreSignedURLRequest
 */
-(NSURL *)getPreSignedURL:(S3GetPreSignedURLRequest *)preSignedURLRequest error:(NSError **)error;

/** Constructs an empty response object of the appropriate type to match the given request
 * object.
 * @param request An instance of a subclass of S3Request.
 * @return An instance of the appropriate subclass of S3Response, or
 *         an instance of S3Response if there is no response class to
 *         match the instance passed in.
 */
+(S3Response *)constructResponseFromRequest:(S3Request *)request;

/** Utility method that sends the raw S3 Request to be processed.
 *
 * @param request A request describing the parameters of an S3 request.
 * @return The response from S3.
 */
-(S3Response *)invoke:(S3Request *)request;

/** Return the version of the S3 API */
+(NSString *)apiVersion;

-(NSMutableURLRequest *)signS3Request:(S3Request *)request;

/** Ensure that all response classes have been loaded by the runtime. */
+(void)initializeResponseObjects;

@end
