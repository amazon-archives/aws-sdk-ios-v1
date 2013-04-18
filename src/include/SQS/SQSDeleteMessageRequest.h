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


#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "../AmazonServiceRequestConfig.h"
#endif



/**
 * Delete Message Request
 */

@interface SQSDeleteMessageRequest:AmazonServiceRequestConfig

{
    NSString *queueUrl;
    NSString *receiptHandle;
}



/**
 * The URL of the SQS queue to take action on.
 */
@property (nonatomic, retain) NSString *queueUrl;

/**
 * The receipt handle associated with the message to delete.
 */
@property (nonatomic, retain) NSString *receiptHandle;


/**
 * Default constructor for a new DeleteMessageRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeleteMessageRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theQueueUrl The URL of the SQS queue to take action on.
 * @param theReceiptHandle The receipt handle associated with the message
 * to delete.
 */
-(id)initWithQueueUrl:(NSString *)theQueueUrl andReceiptHandle:(NSString *)theReceiptHandle;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
