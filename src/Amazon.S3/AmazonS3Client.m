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

#import "AmazonS3Client.h"


@implementation AmazonS3Client

-(id)init
{
	if ( ( self = [super init] ) != nil ) {
		[AmazonS3Client initializeResponseObjects];
	}
	
	return self;
}

+(NSString *)apiVersion
{
	return @"2006-03-01";
}

#pragma mark Service Requests

-(S3CreateBucketResponse *)createBucket:(S3CreateBucketRequest *)createBucketRequest
{
	return (S3CreateBucketResponse *)[self invoke:createBucketRequest];
}

-(S3DeleteBucketResponse *)deleteBucket:(S3DeleteBucketRequest *)deleteBucketRequest
{
	return (S3DeleteBucketResponse *)[self invoke:deleteBucketRequest];
}

-(S3Region *)getBucketLocation:(NSString *)bucketName
{
	S3Request *req = [[S3Request alloc] init];
	req.bucket = bucketName;
	req.subResource = @"location";
	
	S3Response *res = [self invoke:req];
	
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:res.body];
	S3LocationConstraintUnmarshaller *locUnmarshaller = [[S3LocationConstraintUnmarshaller alloc] init];
	[parser setDelegate:locUnmarshaller];
	[parser parse];
	
	NSString *location = locUnmarshaller.location;
	
	[req             release];
	[parser          release];
	[locUnmarshaller release];
	
	return [S3Region regionWithString:location];
}

-(NSArray *)listBuckets
{
	S3ListBucketsRequest *req = [[S3ListBucketsRequest alloc] init];
	S3ListBucketsResponse *response = [self listBuckets:req];
	[req release];
	if (response.listBucketsResult != nil && response.listBucketsResult.buckets != nil) {
		return [NSArray arrayWithArray:response.listBucketsResult.buckets];
	}
	return nil;
}

-(S3ListBucketsResponse *)listBuckets:(S3ListBucketsRequest *)listBucketsRequest
{
	return (S3ListBucketsResponse *)[self invoke:listBucketsRequest];
}

-(S3ListObjectsResponse *)listObjects:(S3ListObjectsRequest *)listObjectsRequest
{
	return (S3ListObjectsResponse *)[self invoke:listObjectsRequest];
}

-(NSArray *)listObjectsInBucket:(NSString *)bucketName
{
	S3ListObjectsRequest  *req = [[S3ListObjectsRequest alloc] initWithName:bucketName];
	S3ListObjectsResponse *res = [self listObjects:req];
	
	[req release];
	
	if (res.listObjectsResult != nil && res.listObjectsResult.objectSummaries != nil) {
		return [NSArray arrayWithArray:res.listObjectsResult.objectSummaries];
	}
	return nil;
}

-(S3GetObjectMetadataResponse *)getObjectMetadata:(S3GetObjectMetadataRequest *)getObjectMetadataRequest 
{
	return (S3GetObjectMetadataResponse *)[self invoke:getObjectMetadataRequest];
}

-(S3Response *)putObject:(S3PutObjectRequest *)putObjectRequest
{
	return [self invoke:putObjectRequest];
}

-(S3GetObjectResponse *)getObject:(S3GetObjectRequest *)getObjectRequest
{
	return (S3GetObjectResponse *)[self invoke:getObjectRequest];
}

-(S3DeleteObjectResponse *)deleteObject:(S3DeleteObjectRequest *)deleteObjectRequest
{
	return (S3DeleteObjectResponse *)[self invoke:deleteObjectRequest];
}

-(S3DeleteObjectResponse *)deleteObjectWithKey:(NSString *)theKey withBucket:(NSString *)theBucket
{
	S3DeleteObjectRequest *request = [[S3DeleteObjectRequest alloc] init];
	request.key = theKey;
	request.bucket = theBucket;
	
	S3DeleteObjectResponse *response = (S3DeleteObjectResponse *)[self invoke:request];
	
	[request release];
	
	return response;
}

-(S3CopyObjectResponse *)copyObject:(S3CopyObjectRequest *)copyObjectRequest
{
	return (S3CopyObjectResponse *)[self invoke:copyObjectRequest];
}

-(S3GetACLResponse *)getACL:(S3GetACLRequest *)getACLRequest
{
	return (S3GetACLResponse *)[self invoke:getACLRequest];
}

-(S3SetACLResponse *)setACL:(S3SetACLRequest *)setACLRequest
{
	return (S3SetACLResponse *)[self invoke:setACLRequest];
}

-(NSURL *)getPreSignedURL:(S3GetPreSignedURLRequest *)preSignedURLRequest
{
	preSignedURLRequest.accessKey = accessKey;
	
	NSURLRequest *urlRequest  = [self signURLRequest:[preSignedURLRequest configureURLRequest]];
	NSString     *auth        = [urlRequest valueForHTTPHeaderField:kHttpHdrAuthorization];
	NSString     *signature   = (NSString *)[[auth componentsSeparatedByString:@":"] objectAtIndex:1];
	NSString     *queryString = [[preSignedURLRequest queryString] stringByAppendingFormat:@"&%@=%@", kS3QueryParamSignature, [AmazonSDKUtil urlEncode:signature]];
	
	[preSignedURLRequest setSubResource:queryString];
	
	return [AmazonSDKUtil URLWithURL:[preSignedURLRequest url] andProtocol:preSignedURLRequest.protocol];
}

#pragma mark Request Utility Code

-(S3Response *)invoke:(S3Request *)request
{
	if (nil == request) {
		@throw [AmazonClientException exceptionWithMessage:@"Request cannot be nil."];
	}
	
	AMZLog( @"Begin Request: %@", NSStringFromClass([request class]) );
	
	NSURLRequest *urlRequest = [self signURLRequest:[request configureURLRequest]];
	
	AMZLog( @"%@ %@", [urlRequest HTTPMethod], [urlRequest URL]);
	AMZLogDebug( @"Request headers: " );
	for (id hKey in [[urlRequest allHTTPHeaderFields] allKeys])
	{
		AMZLogDebug( @"  %@: %@", [hKey description], [[urlRequest allHTTPHeaderFields] valueForKey:hKey] );
	}
	
	S3Response *response = [AmazonS3Client constructResponseFromRequest:request];
	[response setRequest:request];
	
	[NSURLConnection connectionWithRequest:urlRequest delegate:response];
	
	while (!response.isFinishedLoading && !response.exception) {
		[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
	}
	
	if (response.exception) {
		AMZLog( @"Request threw exception: %@", [response.exception description] );
		if ([response.exception isMemberOfClass:[AmazonServiceException class]]) {
			AMZLog( @"HTTP: %d, S3 Error Code: %@", ((AmazonServiceException *)response.exception).statusCode, ((AmazonServiceException *)response.exception).errorCode );
		}
		AMZLog( @"Reason: ", [response.exception reason] );
		@throw response.exception;
	}
	
	AMZLog( @"Received response from server. RequestId: %@. HTTP: %d. Id2: %@.", response.requestId, response.httpStatusCode, response.id2 );
	
	return response;
}

+(void)initializeResponseObjects
{
	// Since we will be creating instances of these classes using NSClassFromString,
	// make certain they have been loaded by the runtime.
	
	[S3GetObjectResponse         class];
	[S3GetObjectMetadataResponse class];
	[S3DeleteObjectResponse      class];
	[S3CopyObjectResponse        class];	
	[S3ListObjectsResponse		 class];
	[S3ListBucketsResponse		 class];
	[S3DeleteBucketResponse		 class];
	[S3CreateBucketResponse		 class];
	[S3GetACLResponse            class];
	[S3SetACLResponse            class];		
}

+(id)constructResponseFromRequest:(S3Request *)request
{
	NSString *requestClassName  = NSStringFromClass([request class]);
	NSString *responseClassName = [[requestClassName substringToIndex:[requestClassName length] - 7] stringByAppendingFormat:@"Response"];
	
	id response = [[NSClassFromString(responseClassName) alloc] init];
	
	if (nil == response) {
		response = [[S3Response alloc] init];
	}
	
	if ([request  isMemberOfClass:[S3GetObjectRequest  class]] && 
		[response isMemberOfClass:[S3GetObjectResponse class]] &&
		((S3GetObjectRequest *)request).outputStream != nil) {
		[(S3GetObjectResponse *)response setOutputStream:((S3GetObjectRequest *)request).outputStream];
	}
	
	return [response autorelease];
}

-(NSURLRequest *)signURLRequest:(NSMutableURLRequest *)request
{
	NSString *contentMd5  = [request valueForHTTPHeaderField:@"Content-MD5"];
	NSString *contentType = [request valueForHTTPHeaderField:@"Content-Type"];
	NSString *timestamp   = [request valueForHTTPHeaderField:@"Date"];
	
	if (nil == contentMd5)  contentMd5  = @"";
	if (nil == contentType) contentType = @"";
	
	NSMutableString *canonicalizedAmzHeaders = [NSMutableString stringWithFormat:@""];
	
	NSArray *sortedHeaders = [[[request allHTTPHeaderFields] allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
	
	for (id key in sortedHeaders)
	{
		NSString *keyName = [(NSString *)key lowercaseString];
		if ([keyName hasPrefix:@"x-amz-"]){
			[canonicalizedAmzHeaders appendFormat:@"%@:%@\n", keyName, [request valueForHTTPHeaderField:(NSString *)key]]; 
		}
	}
	
	// TODO: Since we're building the Host: header and URL, we can standardize on putting the bucketname in the host
	//       but we may want to be more flexible on style
	
	NSString *bucket = @"";
	NSString *path   = request.URL.path;
	NSString *query  = request.URL.query;
	
	NSString *host  = [request valueForHTTPHeaderField:@"Host"];
		
	if (![host isEqualToString:@"s3.amazonaws.com"]) {
		bucket = [host substringToIndex:[host rangeOfString:@".s3.amazonaws.com"].location];
	}

	NSString* canonicalizedResource;
	
	if (nil == path || path.length < 1) {
		if ( nil == bucket || bucket.length < 1 ) {
			canonicalizedResource = @"/";
		}
		else {
			canonicalizedResource = [NSString stringWithFormat:@"/%@/", bucket];
		}
	}
	else {
		canonicalizedResource = [NSString stringWithFormat:@"/%@%@", bucket, path];
	}
	
	if (query != nil && [query length] > 0) {
		canonicalizedResource = [canonicalizedResource stringByAppendingFormat:@"?%@", query];
	}

	NSString* stringToSign = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@%@", [request HTTPMethod], contentMd5, contentType, timestamp, canonicalizedAmzHeaders, canonicalizedResource]; 		
	
	AMZLogDebug(@"In SignURLRequest: String to Sign = [%@]", stringToSign);
	
	NSString *signature = [AmazonAuthUtils HMACSign:[stringToSign dataUsingEncoding:NSASCIIStringEncoding] withKey:secretKey usingAlgorithm:kCCHmacAlgSHA1];
	
	[request setValue:[NSString stringWithFormat:@"AWS %@:%@", accessKey, signature] forHTTPHeaderField:@"Authorization"];
	
	return request;
}




-(NSString *)serviceEndpoint
{
	return kS3ServiceEndpoint;
}

#pragma mark memory management

- (void)dealloc 
{
	[accessKey release];
	[secretKey release];
	
	[super dealloc];
}

@end
