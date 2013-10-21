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

#import <Foundation/Foundation.h>
#import "AmazonServiceRequest.h"
#import "AmazonClientException.h"
#import "AmazonServiceException.h"

/** This variable is used as a key to add to userInfo, which is a NSDictionary
 *  property of NSException/NSError. When an async call fails due to Clock skew
 *  exception, the user can implement the delegate methods such as didFailWithError
 *  and didFailWithException. In those methods they can check userInfo to see if
 *  contains a key called "AWSClockSkewError". If it is there then it should have 
 *  a boolean value representing if it is clock skew error and the device clock skew
 *  has been adjusted. The client can now retry and the subsequent request should not
 *  fail due to clock skew.
 */
extern NSString *const AWSClockSkewError;

@interface AmazonServiceResponse:NSObject {
    int32_t            httpStatusCode;
    NSString             *requestId;
    NSMutableData        *body;
    NSDictionary         *responseHeader;
    NSException          *exception;
    BOOL                 isFinishedLoading;
    BOOL                 didTimeout;
    BOOL                 isAsyncCall;
    Class                unmarshallerDelegate;
    NSError *error;

    AmazonServiceRequest *request;

    NSTimeInterval       processingTime;
}

/** The body of the html response. */
@property (nonatomic, readonly) NSData *body;

/** The header of the html response. */
@property (nonatomic, readonly) NSDictionary *responseHeader;

/** The HTTP status code of the response from the service. */
@property (nonatomic) int32_t httpStatusCode;

/** Whether the response is finished loading. */
@property (nonatomic, readonly) BOOL isFinishedLoading;

/** Whether the original request was timed out. */
@property (nonatomic, readonly) BOOL didTimeout;

/** Check if it is async call, this is necessary for checking if we need to set clock skew */
@property (nonatomic, assign) BOOL isAsyncCall;

/** Check if the response has the clock skew error */
@property (nonatomic, assign) BOOL hasClockSkewError;

/** If an exception was thrown, and the SDK is configured not to throw exceptions,
 this will return the error object generated from the exception object. */
@property (nonatomic, retain) NSError *error;

/** If an exception was thrown, this will return the exception. */
@property (nonatomic, readonly) NSException *exception;

/** The request for which this is the response */
@property (nonatomic, retain) AmazonServiceRequest *request;

/** The requestId assigned by the service */
@property (nonatomic, retain) NSString       *requestId;

@property (nonatomic, assign) Class          unmarshallerDelegate;
@property (nonatomic, assign) NSTimeInterval processingTime;

/** Once the body has been received, perform additional processing, such as parse as XML. */
-(void)processBody;
-(void)postProcess;


#pragma mark NSURLConnection delegate methods

/** delegate method for NSURLConnection */
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
/** delegate method for NSURLConnection */
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
/** delegate method for NSURLConnection */
-(void)connectionDidFinishLoading:(NSURLConnection *)connection;

/**
 * Check if the AmazonServiceException is a clock skew exception.
 *
 * @param exception An AmazonServiceException
 * @return a bool that says whether the exception is a clock skew exception.
 */
-(BOOL)isClockSkewError:(AmazonServiceException*)serviceException;

/**
 * Get the difference between the request time and the response time
 *
 * @return time interval which can be used to set the time skew
 */
-(NSTimeInterval)getSkewTimeUsingResponse;

/** return date from the response header */
-(NSDate *)getDateFromResponse;

@end



