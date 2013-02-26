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

/** Generic excpetion type for AWS client errors
 * Client exceptions are thrown for conditions which occur in the client and its
 * configuration. These are conditions which need to be corrected in
 * the client. Service exceptions are indicated by throwing AWSServiceException.
 */
@interface AmazonClientException : NSException {
    NSString *message;
    NSError  *error;
}

/** Description of the exception */
@property (nonatomic, retain) NSString *message;

/** The error that caused the exception. */
@property (nonatomic, retain) NSError *error;

/** Initialize the exception with a message.
 *
 * @param message The message.
 */
-(id)initWithMessage:(NSString *)message;

/** Initialize the exception with a name, reason and userInfo.
 *
 * @param name The name.
 * @param reason The reason.
 * @param userInfo The userInfo.
 */
- (id)initWithName:(NSString *)name reason:(NSString *)reason userInfo:(NSDictionary *)userInfo;

/** Return an exception with the given message
 *
 * @param theMessage The user-friendly message
 */
+(id)exceptionWithMessage:(NSString *)theMessage;

/** Return an exception with the given message and error.
 *
 * @param theMessage The user-friendly message
 * @param theError The error
 */
+(id)exceptionWithMessage:(NSString *)theMessage andError:(NSError *)theError;


@end
