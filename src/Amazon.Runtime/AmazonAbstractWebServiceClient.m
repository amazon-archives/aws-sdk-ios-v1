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

#import "AmazonAbstractWebServiceClient.h"
#import "AmazonEndpoints.h"
#import "DynamoDBRequest.h"
#import "DynamoDBResponse.h"

NSString *const AWSDefaultRunLoopMode = @"com.amazonaws.DefaultRunLoopMode";

@implementation AmazonAbstractWebServiceClient

@synthesize endpoint, maxRetries, timeout, userAgent, delay;

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [self init]) {
        credentials = [theCredentials retain];
        maxRetries  = 5;
        timeout     = 240;
        delay       = 0.2;
        userAgent   = [[AmazonSDKUtil userAgentString] retain];
    }
    return self;
}

+(id)constructResponseFromRequest:(AmazonServiceRequest *)request
{
    NSString *requestClassName  = NSStringFromClass([request class]);
    NSString *responseClassName = [[requestClassName substringToIndex:[requestClassName length] - 7] stringByAppendingFormat:@"Response"];

    id       response = [[NSClassFromString(responseClassName) alloc] init];

    if (nil == response) {
        if([request isKindOfClass:[DynamoDBRequest class]])
        {
            response = [DynamoDBResponse new];
        }
        else
        {
            response = [AmazonServiceResponse new];
        }
    }

    return [response autorelease];
}

-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)generatedRequest rawRequest:(AmazonServiceRequestConfig *)originalRequest unmarshallerDelegate:(Class)unmarshallerDelegate
{
    if (nil == generatedRequest) {

        AmazonServiceResponse *response = [[[AmazonServiceResponse alloc] init] autorelease];
        response.error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:[AmazonClientException 
                                                                 exceptionWithMessage:@"Request cannot be nil."]];
        return response;
    }

    [generatedRequest setUserAgent:self.userAgent];

    if (nil == generatedRequest.endpoint) {
        generatedRequest.endpoint = [self endpoint];
    }
    if (nil == generatedRequest.credentials) {
        [generatedRequest setCredentials:credentials];
    }

    NSMutableURLRequest *urlRequest = [generatedRequest configureURLRequest];
    [generatedRequest sign];
    [urlRequest setHTTPBody:[[generatedRequest queryString] dataUsingEncoding:NSUTF8StringEncoding]];

    AMZLogDebug(@"%@ %@", [urlRequest HTTPMethod], [urlRequest URL]);
    AMZLogDebug(@"Request body: ");
    NSString *rBody = [[NSString alloc] initWithData:[urlRequest HTTPBody] encoding:NSUTF8StringEncoding];
    AMZLogDebug(@"%@", rBody);
    [rBody release];

    AmazonServiceResponse *response = nil;
    NSInteger             retries   = 0;
    while (retries < self.maxRetries) {
        AMZLogDebug(@"Begin Request: %@:%d", NSStringFromClass([generatedRequest class]), retries);

        response = [AmazonAbstractWebServiceClient constructResponseFromRequest:generatedRequest];
        [response setRequest:generatedRequest];
        response.unmarshallerDelegate = unmarshallerDelegate;

        [urlRequest setTimeoutInterval:self.timeout];

        // Setting this here and not the AmazonServiceRequest because S3 extends that class and sets its own Content-Type Header.
        [urlRequest addValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];

        if ([generatedRequest delegate] != nil) {

            NSURLConnection *urlConnection = [[[NSURLConnection alloc] initWithRequest:urlRequest
                                                                              delegate:response
                                                                      startImmediately:NO] autorelease];
            originalRequest.urlConnection = urlConnection;
            [urlConnection start];
            
            [NSTimer scheduledTimerWithTimeInterval:self.timeout target:response selector:@selector(timeout) userInfo:nil repeats:NO];

            return nil;
        }

        generatedRequest.delegate = [[[AmazonRequestDelegate alloc] init] autorelease];

        NSURLConnection *urlConnection = [[[NSURLConnection alloc] initWithRequest:urlRequest
                                                                          delegate:response
                                                                  startImmediately:NO] autorelease];
        [urlConnection scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:AWSDefaultRunLoopMode];
        originalRequest.urlConnection = urlConnection;
        [urlConnection start];

        NSTimer *timeoutTimer = [NSTimer timerWithTimeInterval:self.timeout
                                                        target:response
                                                      selector:@selector(timeout)
                                                      userInfo:nil
                                                       repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timeoutTimer forMode:AWSDefaultRunLoopMode];

        while (![(AmazonRequestDelegate *)(generatedRequest.delegate)isFinishedOrFailed]) {
            [[NSRunLoop currentRunLoop] runMode:AWSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }

        if (response.didTimeout) {
            [urlConnection cancel];
        }
        else {
            [timeoutTimer invalidate];     //  invalidate also releases the object.
        }

        AMZLogDebug(@"Response Status Code : %d", response.httpStatusCode);
        if ( [self shouldRetry:response]) {
            AMZLog(@"Retring Request: %d", retries);
            generatedRequest.delegate = nil;

            [self pauseExponentially:retries];
            retries++;
        }
        else {
            break;
        }
    }

    if (response.exception != nil) {
        
        response.error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:response.exception];
        return response;
    }
    else {
        if (((AmazonRequestDelegate *)generatedRequest.delegate).error != nil) {
            
            if(response == nil)
            {
                response = [[[AmazonServiceResponse alloc] init] autorelease];
            }
            response.error = ((AmazonRequestDelegate *)generatedRequest.delegate).error;
            
            return response;
        }
        else if (((AmazonRequestDelegate *)generatedRequest.delegate).exception != nil) {
            
            if(response == nil)
            {
                response = [[[AmazonServiceResponse alloc] init] autorelease];
            }
            response.error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:((AmazonRequestDelegate *)generatedRequest.delegate).exception];
            
            return response;
        }
        else if (((AmazonRequestDelegate *)generatedRequest.delegate).response != nil)
        {
            return ((AmazonRequestDelegate *)generatedRequest.delegate).response;
        }
        else
        {
            if(response == nil)
            {
                response = [[[AmazonServiceResponse alloc] init] autorelease];
            }
            AmazonClientException *clientException = [AmazonClientException exceptionWithMessage:@"Unknown error occurred."];
            response.error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:clientException];
            return response;
        }
    }
}

-(bool)shouldRetry:(AmazonServiceResponse *)response
{
    if (response.didTimeout ||
        response.httpStatusCode == 500 ||
        response.httpStatusCode == 503 ||
        (response.exception != nil &&
         response.exception.reason != nil &&
         [response.exception.reason rangeOfString:@"Throttling"].location != NSNotFound)) {
        return YES;
    }

    return NO;
}

-(bool)shouldRetry:(AmazonServiceResponse *)response exception:(NSException *)theException
{
    AmazonServiceException *exception = (AmazonServiceException *)theException;
    
    if (response.didTimeout || response.httpStatusCode == 500 || response.httpStatusCode == 503) {
        return YES;
    }
    else if (exception == nil) {
        return NO;
    }
    else if ( [exception.errorCode isEqualToString:@"ProvisionedThroughputExceededException"]) {
        return YES;
    }
    else if (exception.reason != nil && [exception.reason rangeOfString:@"Throttling"].location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

-(void)pauseExponentially:(NSInteger)tryCount
{
    NSTimeInterval pause = self.delay * (pow(2, tryCount));

    [NSThread sleepForTimeInterval:pause];
}

-(void)setUserAgent:(NSString *)newUserAgent
{
    userAgent = [[NSString stringWithFormat:@"%@, %@", newUserAgent, [AmazonSDKUtil userAgentString]] retain];
}

-(NSString *)userAgent
{
    if([AmazonErrorHandler throwsExceptions] == YES)
    {
        return userAgent;
    }
    else
    {
        // When NSError error handling is enabled, add NE at the end of userAgent.
        return [NSString stringWithFormat:@"%@ NE", userAgent];
    }
}

-(void)dealloc
{
    [credentials release];
    [endpoint release];
    [userAgent release];

    [super dealloc];
}

@end
