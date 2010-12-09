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

#import "AmazonWebServiceClient.h"

@implementation AmazonWebServiceClient

@synthesize endpoint, maxRetries;

-(id)initWithAccessKey:(NSString*)theAccessKey withSecretKey:(NSString*)theSecretKey {
	if (self = [self init]) {
		accessKey = theAccessKey;
		secretKey = theSecretKey;
		maxRetries = 5;
	}
	return self;
}

+(id)constructResponseFromRequest:(AmazonServiceRequest *)request
{
	NSString *requestClassName  = NSStringFromClass([request class]);
	NSString *responseClassName = [[requestClassName substringToIndex:[requestClassName length] - 7] stringByAppendingFormat:@"Response"];
	
	id response = [[NSClassFromString(responseClassName) alloc] init];
	
	if (nil == response) {
		response = [[AmazonServiceResponse alloc] init];
	}
	
	return [response autorelease];
}

-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)request
{
	if (nil == request) {
		@throw [AmazonClientException exceptionWithMessage:@"Request cannot be nil."];
	}
	
	[request setParameterValue:accessKey forKey:@"AWSAccessKeyId"];
	[request setParameterValue:@"2" forKey:@"SignatureVersion"];
	[request setParameterValue:[NSDate ISO8061FormattedCurrentTimestamp] forKey:@"Timestamp"];
	[request setParameterValue:@"HmacSHA256" forKey:@"SignatureMethod"];
	NSMutableURLRequest *urlRequest = [request configureURLRequest];

	[self signRequest:request];
	[urlRequest setHTTPBody:[[request queryString] dataUsingEncoding:NSUTF8StringEncoding]];
	

	NSURL *url = nil;
	if ( request.endpoint != nil ) {
		url = [NSURL URLWithString:request.endpoint];
	}
	else {
		url = [NSURL URLWithString:[self endpoint]];
	}
	
	[urlRequest setURL:url];
	
	[urlRequest setValue:[url host] forHTTPHeaderField:@"Host"];
	
	AMZLog( @"%@ %@", [urlRequest HTTPMethod], [urlRequest URL]);
	AMZLogDebug( @"Request body: " );
	NSString *rBody = [[NSString alloc] initWithData:[urlRequest HTTPBody] encoding:NSUTF8StringEncoding];
	AMZLog( @"%@", rBody );
	[rBody release];

	AmazonServiceResponse *response = nil;
	int retries = 0;
	while ( retries < self.maxRetries ) {
		AMZLog( @"Begin Request: %@:%d", NSStringFromClass([request class]), retries );
		
		response = [AmazonWebServiceClient constructResponseFromRequest:request];
		[response setRequest:request];
		
		[NSURLConnection connectionWithRequest:urlRequest delegate:response];
		
		while (!response.isFinishedLoading && !response.exception) {
			[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
		}
		
		AMZLog( @"Response Status Code : %d", response.httpStatusCode );
		if ( [self shouldRetry:response] ) {
			AMZLog( @"Retring Request: %d", retries );
			
			[self pauseExponentially:retries];
			retries++;			
		}		
		else {
			break;
		}
	}
	
	return response;	
}

-(AmazonServiceResponse *)parseResponseBody:(NSData *)body withDelegateType:(Class)delegateType
{
	NSString *tmp = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
	AMZLog (@"Response Body:\n%@", tmp);
	[tmp release];
	NSXMLParser *parser = [[NSXMLParser alloc] initWithData:body];
	AmazonServiceResponseUnmarshaller *delegate = [[delegateType alloc] init];
	[parser setDelegate:delegate];
	[parser parse];
	
	AmazonServiceResponse *foo = [delegate response];
	AmazonServiceResponse *response = [foo retain];
	
	[parser   release];
	[delegate release];
	
	if (response.exception) {
		NSException *exception = [response.exception copy];
		[response release];
		@throw [exception autorelease];
	}
	
	return [response autorelease];
}

-(void)signRequest:(AmazonServiceRequest *)serviceRequest
{
	NSString *endpointString = [self endpoint];
	if ( serviceRequest.endpoint != nil ) {
		endpointString = serviceRequest.endpoint;
	}
		
	NSData *dataToSign = [[self getV2StringToSign:[NSURL URLWithString:endpointString] request:serviceRequest] dataUsingEncoding:NSUTF8StringEncoding];
	
	NSString *signature = [AmazonAuthUtils HMACSign:dataToSign withKey:secretKey usingAlgorithm:kCCHmacAlgSHA256];
	
	[serviceRequest setParameterValue:signature forKey:@"Signature"];
}

-(NSString*)getV2StringToSign:(NSURL*)theEndpoint request:(AmazonServiceRequest *)serviceRequest {
	
	NSString *host = [theEndpoint host];
	NSString *path = [theEndpoint path];
	if (nil == path || [path length] < 1) {
		path = @"/";
	}
	NSString *sts = [NSString stringWithFormat:@"POST\n%@\n%@\n%@", host, path, [serviceRequest queryString]];
	AMZLog( @"String To Sign:\n%@", sts );
	return sts;
}

-(NSURLRequest *)signURLRequest:(NSMutableURLRequest *)request
{
	return nil;
}

-(bool)shouldRetry:(AmazonServiceResponse *)response {
	if (	response.httpStatusCode == 500 || 
		response.httpStatusCode == 503 || 
		( response.exception != nil && [response.exception.reason rangeOfString:@"Throttling"].location != NSNotFound ) ) {
		return YES;
	}
	
	return NO;
}

-(void)pauseExponentially:(int)tryCount {
	NSTimeInterval pause = 0.5 * (pow(2, tryCount));
	[NSThread sleepForTimeInterval:pause];
}


@end
