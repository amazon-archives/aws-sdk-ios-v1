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

#import "AmazonSDKUtil.h"
#import "AmazonAuthUtils.h"
#import "AmazonClientException.h"
#import "AmazonLogger.h"
#import "AmazonServiceException.h"
#import "AmazonSignatureException.h"
#import "AmazonUnmarshallerXMLParserDelegate.h"
#import "AmazonServiceRequest.h"
#import "AmazonServiceResponse.h"
#import "AmazonServiceResponseUnmarshaller.h"

@interface AmazonWebServiceClient : NSObject 
{
	NSString* accessKey;
	NSString* secretKey;
	NSString* endpoint;
	int maxRetries;
}

@property(nonatomic, retain) NSString* endpoint;
@property(nonatomic) int maxRetries;

/** Inits the client with the access key and the secret key. 
 *
 * @param accessKey The AWS Access Key
 * @param secretKey The AWS Secret Key
 */
-(id)initWithAccessKey:(NSString*)accessKey withSecretKey:(NSString*)secretKey;

/** Sign a URL request using the credentials of the client object.
 *
 * @param request a mutable URL request
 * @return the signed request
 */
-(NSURLRequest *)signURLRequest:(NSMutableURLRequest *)request;

-(void)signRequest:(AmazonServiceRequest *)serviceRequest;

/** Constructs an empty response object of the appropriate type to match the given request
 * object.
 * @param request An instance of a subclass of AmazonServiceRequest.
 * @return An instance of the appropriate subclass of AmazonServiceResponse, or 
 *         an instance of AmazonServiceResponse if there is no response class to
 *         match the instance passed in.
 */
+(AmazonServiceResponse *)constructResponseFromRequest:(AmazonServiceRequest *)request;

/** Utility method that sends the raw S3 Request to be processed.
 *
 * @param request An AmazonServiceRequest describing the parameters of a request. 
 * @return The response from the service.
 */
-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)request;

-(NSString*)getV2StringToSign:(NSURL*)theEndpoint request:(AmazonServiceRequest *)serviceRequest;

-(AmazonServiceResponse *)parseResponseBody:(NSData *)body withDelegateType:(Class)delegateType;
-(void)pauseExponentially:(int)tryCount; 
-(bool)shouldRetry:(AmazonServiceResponse *)response;

@end


