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


#import "SQSResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"



/**
 * Batch Result Error Entry
 */

@interface SQSBatchResponseErrorEntry:SQSResponse

{
    NSString *idValue;
    bool     senderFault;
    bool     senderFaultIsSet;
    NSString *code;
    NSString *message;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * The id of an entry in a batch request.
 */
@property (nonatomic, retain) NSString *idValue;

/**
 * Whether the error happened due to the sender's fault.
 */
@property (nonatomic) bool           senderFault;

@property (nonatomic, readonly) bool senderFaultIsSet;

/**
 * An error code representing why the operation failed on this entry.
 */
@property (nonatomic, retain) NSString *code;

/**
 * A message explaining why the operation failed on this entry.
 */
@property (nonatomic, retain) NSString *message;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
