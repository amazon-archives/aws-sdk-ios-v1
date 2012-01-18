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

@synthesize endpoint, maxRetries, timeout, userAgent, delay;

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

+(id)constructResponseFromRequest:(AmazonServiceRequest *)request
{
    NSString *requestClassName  = NSStringFromClass([request class]);
    NSString *responseClassName = [[requestClassName substringToIndex:[requestClassName length] - 7] stringByAppendingFormat:@"Response"];

    id       response = [[NSClassFromString(responseClassName) alloc] init];

    if (nil == response) {
        response = [[DynamoDBResponse alloc] init];
    }

    return [response autorelease];
}

-(AmazonServiceResponse *)invoke:(AmazonServiceRequest *)generatedRequest rawRequest:(AmazonServiceRequestConfig *)originalRequest unmarshallerDelegate:(Class)unmarshallerDelegate
{
    if (nil == generatedRequest) {
        @throw [AmazonClientException exceptionWithMessage : @"Request cannot be nil."];
    }

    [generatedRequest setUserAgent:self.userAgent];

    if (nil == generatedRequest.endpoint) {
        generatedRequest.endpoint = [self endpoint];
    }
    if (nil == generatedRequest.credentials) {
        [generatedRequest setCredentials:credentials];
    }


#ifdef GHUNIT_CLI
    if ( [generatedRequest.endpoint hasPrefix:@"https://"]) {
        generatedRequest.endpoint = [generatedRequest.endpoint stringByReplacingOccurrencesOfString:@"https://" withString:@"http://"];
    }
#endif

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

        response = [DynamoDBWebServiceClient constructResponseFromRequest:generatedRequest];
        [response setRequest:generatedRequest];
        response.unmarshallerDelegate = unmarshallerDelegate;

        [urlRequest setTimeoutInterval:self.timeout];

        AMZLogDebug(@"%@ %@", [urlRequest HTTPMethod], [urlRequest URL]);
        AMZLogDebug(@"Request headers: ");
        for (id hKey in [[urlRequest allHTTPHeaderFields] allKeys])
        {
            AMZLogDebug(@"  %@: %@", [hKey description], [[urlRequest allHTTPHeaderFields] valueForKey:hKey]);
        }


        NSURLConnection *urlConnection = [NSURLConnection connectionWithRequest:urlRequest delegate:response];
        originalRequest.urlConnection = urlConnection;

        if ([generatedRequest delegate] == nil) {
            NSTimer *timeoutTimer = [NSTimer scheduledTimerWithTimeInterval:self.timeout target:response selector:@selector(timeout) userInfo:nil repeats:NO];
            generatedRequest.delegate = [[[AmazonRequestDelegate alloc] init] autorelease];

            while (![(AmazonRequestDelegate *)(generatedRequest.delegate)isFinishedOrFailed]) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
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
        else {
            return nil;
        }
    }

    if (response.exception != nil) {
        @throw response.exception;
    }
    else {
        if (((AmazonRequestDelegate *)generatedRequest.delegate).exception != nil) {
            @throw((AmazonRequestDelegate *)generatedRequest.delegate).exception;
        }
        else if (((AmazonRequestDelegate *)generatedRequest.delegate).response != nil) {
            return ((AmazonRequestDelegate *)generatedRequest.delegate).response;
        }
        else {
            return nil; //TODO: Throw an exception here AmazonClientException
        }
    }
}

-(bool)shouldRetry:(DynamoDBResponse *)response exception:(NSException *)theException
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

-(void)pauseExponentially:(int)tryCount
{
    NSTimeInterval pause = self.delay * (pow(2, tryCount));

    [NSThread sleepForTimeInterval:pause];
}

-(void)setUserAgent:(NSString *)newUserAgent
{
    userAgent = [[NSString stringWithFormat:@"%@, %@", newUserAgent, [AmazonSDKUtil userAgentString]] retain];
}

-(void)dealloc
{
    [credentials release];
    [endpoint release];
    [userAgent release];

    [super dealloc];
}

@end
