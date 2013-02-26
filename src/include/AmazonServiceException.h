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
#import "AmazonClientException.h"
#import "AmazonSDKUtil.h"

/** Represents an AWS Service Exception. */
@interface AmazonServiceException:AmazonClientException {
    NSString            *requestId;
    NSString            *errorCode;
    NSString            *serviceName;
    NSInteger           statusCode;
    NSMutableDictionary *additionalFields;
}

#pragma mark Properties

/** The requestId as assigned by the service. */
@property (nonatomic, retain) NSString *requestId;

/** The error code returned by the service */
@property (nonatomic, retain) NSString *errorCode;

/**  */
@property (nonatomic, retain) NSString *serviceName;

/** The HTTP status code returned by the service */
@property (nonatomic) NSInteger statusCode;

/** Other fields in the error response from the service */
@property (nonatomic, readonly) NSMutableDictionary *additionalFields;

/** Return an exception with the given message
 *
 * @param theMessage The user-friendly message
 */
+(id)exceptionWithMessage:(NSString *)theMessage;

/** Return an exception with the given HTTP status code
 *
 * @param theStatusCode The HTTP status code.
 */
+(id)exceptionWithStatusCode:(int)theStatusCode;

/** Return an exception with the given message, error code, status, and request ID.
 *
 * @param theMessage The message for the exception.
 * @param theErrorCode The error code for the exception.
 * @param theStatusCode The HTTP Status code for the exception.
 * @param theRequestId The request ID assigned by the service.
 * @return The exception.
 */
+(id)exceptionWithMessage:(NSString *)theMessage withErrorCode:(NSString *)theErrorCode withStatusCode:(NSInteger)theStatusCode withRequestId:(NSString *)theRequestId;

/** Initialize the exception with a name, reason and userInfo.
 *
 * @param name The name.
 * @param reason The reason.
 * @param userInfo The userInfo.
 */
- (id)initWithName:(NSString *)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo;

-(void)setPropertiesWithException:(AmazonServiceException *)theException;

-(NSString *)description;



@end

