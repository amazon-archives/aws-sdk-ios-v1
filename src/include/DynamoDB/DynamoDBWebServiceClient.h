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

#import "../AmazonSDKUtil.h"
#import "../AmazonAuthUtils.h"
#import "../AmazonClientException.h"
#import "../AmazonLogger.h"
#import "../AmazonServiceException.h"
#import "../AmazonSignatureException.h"
#import "../AmazonUnmarshallerXMLParserDelegate.h"
#import "../AmazonServiceRequest.h"
#import "../AmazonServiceRequestConfig.h"
#import "DynamoDBResponse.h"
#import "../AmazonServiceResponseUnmarshaller.h"
#import "../AmazonURLRequest.h"
#import "../AmazonCredentials.h"
#import "../AmazonRequestDelegate.h"

@interface DynamoDBWebServiceClient:NSObject
{
    AmazonCredentials *credentials;
    NSString          *endpoint;
    int               maxRetries;
    NSTimeInterval    timeout;
    NSTimeInterval    delay;
    NSString          *userAgent;
}

/** The service endpoint to which requests should be sent. */
@property (nonatomic, retain) NSString *endpoint;

/** The maximum number of retry attempts for failed retryable requests
 * (ex: 5xx error responses from a service).
 *
 * Default is 10.
 */
@property (nonatomic, atomic) int maxRetries;

/** The amount of time to wait (in milliseconds) for data to be transfered over
 * an established, open connection before the connection times out and is closed.
 *
 * Default is 30 seconds.
 */
@property (nonatomic, atomic) NSTimeInterval timeout;

/**
 * The amount of time to pause between retries.  The pause time will grow exponentially
 * for each retry on a single request.
 * Default is 0.05 seconds.
 */
@property (nonatomic, atomic) NSTimeInterval delay;

/** The HTTP user agent header to send with all requests. */
@property (nonatomic, retain) NSString *userAgent;

/** Inits the client the given credentials. */
-(id)initWithCredentials:(AmazonCredentials *)theCredentials;

/** Constructs an empty response object of the appropriate type to match the given request
 * object.
 * @param request An instance of a subclass of AmazonServiceRequest.
 * @return An instance of the appropriate subclass of AmazonServiceResponse, or
 *         an instance of AmazonServiceResponse if there is no response class to
 *         match the instance passed in.
 */
+(DynamoDBResponse *)constructResponseFromRequest:(AmazonServiceRequest *)request;

/** Utility method that sends the raw S3 Request to be processed.
 *
 * @param request An AmazonServiceRequest describing the parameters of a request.
 * @return The response from the service.
 */
-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)generatedRequest rawRequest:(AmazonServiceRequestConfig *)originalRequest unmarshallerDelegate:(Class)unmarshallerDelegate;

-(void)pauseExponentially:(int)tryCount;
-(bool)shouldRetry:(DynamoDBResponse *)response exception:(NSException *)theException;

@end


