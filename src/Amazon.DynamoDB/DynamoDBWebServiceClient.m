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

#import "DynamoDBWebServiceClient.h"


@implementation DynamoDBWebServiceClient

-(id)initWithCredentials:(AmazonCredentials *)theCredentials
{
    if (self = [self init]) {
        credentials = [theCredentials retain];
        maxRetries  = 11;
        timeout     = 30;
        delay       = 0.05;
        userAgent   = [[AmazonSDKUtil userAgentString] retain];
    }
    return self;
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

    AMZLogDebug(@"%@ %@", [urlRequest HTTPMethod], [urlRequest URL]);
    AMZLogDebug(@"Request body: ");
    NSString *rBody = [[NSString alloc] initWithData:[urlRequest HTTPBody] encoding:NSUTF8StringEncoding];
    AMZLogDebug(@"%@", rBody);
    [rBody release];

    DynamoDBResponse *response = nil;
    int              retries   = 0;
    while (retries < self.maxRetries) {
        AMZLogDebug(@"Begin Request: %@:%d", NSStringFromClass([generatedRequest class]), retries);

        response = (DynamoDBResponse *)[DynamoDBWebServiceClient constructResponseFromRequest:generatedRequest];
        [response setRequest:generatedRequest];
        response.unmarshallerDelegate = unmarshallerDelegate;

        [urlRequest setTimeoutInterval:self.timeout];

        AMZLogDebug(@"%@ %@", [urlRequest HTTPMethod], [urlRequest URL]);
        AMZLogDebug(@"Request headers: ");
        for (id hKey in [[urlRequest allHTTPHeaderFields] allKeys])
        {
            AMZLogDebug(@"  %@: %@", [hKey description], [[urlRequest allHTTPHeaderFields] valueForKey:hKey]);
        }

        

        if ([generatedRequest delegate] != nil) {

            NSURLConnection *urlConnection = [[[NSURLConnection alloc] initWithRequest:urlRequest
                                                                             delegate:response
                                                                     startImmediately:NO] autorelease];
            originalRequest.urlConnection = urlConnection;
            [urlConnection start];

            [NSTimer scheduledTimerWithTimeInterval:self.timeout
                                             target:response
                                           selector:@selector(timeout)
                                           userInfo:nil
                                            repeats:NO];
            
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
        if ( [self shouldRetry:response exception:((AmazonRequestDelegate *)generatedRequest.delegate).exception]) {
            AMZLog(@"Retring Request: %d", retries);
            generatedRequest.delegate = nil;

            [self pauseExponentially:retries];
            retries++;
        }
        else {
            break;
        }
    }

    if (response.exception != nil)
    {
        response.error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:response.exception];
    }
    else if(response.error == nil)
    {
        if (((AmazonRequestDelegate *)generatedRequest.delegate).error != nil)
        {
            if(response == nil)
            {
                response = [[[DynamoDBResponse alloc] init] autorelease];
            }
            response.error = ((AmazonRequestDelegate *)generatedRequest.delegate).error;
        }
        else if (((AmazonRequestDelegate *)generatedRequest.delegate).exception != nil)
        {
            if(response == nil)
            {
                response = [[[DynamoDBResponse alloc] init] autorelease];
            }
            response.error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:((AmazonRequestDelegate *)generatedRequest.delegate).exception];
        }
        else if (((AmazonRequestDelegate *)generatedRequest.delegate).response != nil)
        {
            return ((AmazonRequestDelegate *)generatedRequest.delegate).response;
        }
        else
        {
            if(response == nil)
            {
                response = [[[DynamoDBResponse alloc] init] autorelease];
            }
            response.error = [AmazonErrorHandler errorFromExceptionWithThrowsExceptionOption:
                              [AmazonClientException exceptionWithMessage:@"Unknown error occurred."]];
        }
    }
    
    return response;
}

@end
