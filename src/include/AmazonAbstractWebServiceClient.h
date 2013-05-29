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

#import "AmazonSDKUtil.h"
#import "AmazonAuthUtils.h"
#import "AmazonClientException.h"
#import "AmazonLogger.h"
#import "AmazonServiceException.h"
#import "AmazonSignatureException.h"
#import "AmazonServiceRequest.h"
#import "AmazonServiceRequestConfig.h"
#import "AmazonServiceResponse.h"
#import "AmazonURLRequest.h"
#import "AmazonCredentials.h"
#import "AmazonRequestDelegate.h"
#import "AmazonErrorHandler.h"
#import "AmazonCredentialsProvider.h"


@interface AmazonAbstractWebServiceClient : NSObject
{
}

@property (atomic, retain) id<AmazonCredentialsProvider> provider;

/** The service endpoint to which requests should be sent. */
@property (nonatomic, retain) NSString *endpoint;

/** The maximum number of retry attempts for failed retryable requests
 * (ex: 5xx error responses from a service).
 *
 * Default is 5.
 */
@property (nonatomic, assign) NSInteger maxRetries;

/** The amount of time to wait (in seconds) for a request to complete.  This
 * includes the time to establish connection and transfer data.
 *
 * Default is 240 seconds.
 */
@property (nonatomic, assign) NSTimeInterval timeout;

/** The timeoutInterval to applied to the underlying NSURLConnection.  This 
 * value has a minimum effective value as defined by the operation and version
 * of iOS.
 *
 * If not set, value defaults to value of timeout
 */
@property (nonatomic, assign) NSTimeInterval connectionTimeout;

/**
 * The amount of time to pause between retries.  The pause time will grow exponentially
 * for each retry on a single request.
 * Default is 0.05 seconds.
 */
@property (nonatomic, assign) NSTimeInterval delay;

/** The HTTP user agent header to send with all requests. */
@property (nonatomic, retain) NSString *userAgent;

/** Inits the client with the given credentials. */
-(id)initWithCredentials:(AmazonCredentials *)credentials;

/** Inits the client with a credentials provider which will provide refreshable credentials */
-(id)initWithCredentialsProvider:(id<AmazonCredentialsProvider>)provider;


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
-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)generatedRequest rawRequest:(AmazonServiceRequestConfig *)originalRequest unmarshallerDelegate:(Class)unmarshallerDelegate;
-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)generatedRequest rawRequest:(AmazonServiceRequestConfig *)originalRequest unmarshallerDelegate:(Class)unmarshallerDelegate andSign:(BOOL)signRequest;


-(void)pauseExponentially:(int)tryCount;
-(BOOL)shouldRetry:(AmazonServiceResponse *)response;
-(BOOL)shouldRetry:(AmazonServiceResponse *)response exception:(NSException *)theException;

-(AmazonServiceResponse *)nilRequestResponse;
-(AmazonServiceResponse *)createResponse:(AmazonServiceRequest *)generatedRequest withUnmarshallerDelegate:(Class)unmarshallerDelegate;

-(void)logTheRequest:(NSMutableURLRequest *)urlRequest;
-(void)logTheRequestHeaders:(NSMutableURLRequest *)urlRequest;

-(void)setupRequestTimeout:(NSMutableURLRequest *)urlRequest;

-(AmazonServiceResponse*)returnErrorOrResponse:(AmazonServiceResponse*)response forRequest:(AmazonServiceRequest *)generatedRequest;

-(void)startAsyncRequest:(NSMutableURLRequest *)urlRequest response:(AmazonServiceResponse *)response originalRequest:(AmazonServiceRequestConfig *)originalRequest;
-(void)startSyncRequest:(AmazonServiceRequest *)generatedRequest forRequest:(NSMutableURLRequest *)urlRequest response:(AmazonServiceResponse *)response originalRequest:(AmazonServiceRequestConfig *)originalRequest;

@end


