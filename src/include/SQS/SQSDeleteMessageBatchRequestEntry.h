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
 * Delete Message Batch Request Entry
 */

@interface SQSDeleteMessageBatchRequestEntry:AmazonServiceRequestConfig

{
    NSString *idValue;
    NSString *receiptHandle;
}



/**
 * An identifier for this particular receipt handle. This is used to
 * communicate the result. Note that the <code>Id</code>s of a batch
 * request need to be unique within the request.
 */
@property (nonatomic, retain) NSString *idValue;

/**
 * A receipt handle.
 */
@property (nonatomic, retain) NSString *receiptHandle;


/**
 * Default constructor for a new DeleteMessageBatchRequestEntry object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new DeleteMessageBatchRequestEntry object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theIdValue An identifier for this particular receipt handle.
 * This is used to communicate the result. Note that the <code>Id</code>s
 * of a batch request need to be unique within the request.
 * @param theReceiptHandle A receipt handle.
 */
-(id)initWithIdValue:(NSString *)theIdValue andReceiptHandle:(NSString *)theReceiptHandle;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
