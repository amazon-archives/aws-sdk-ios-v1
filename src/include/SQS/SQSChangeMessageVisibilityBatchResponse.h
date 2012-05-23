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

#import "SQSChangeMessageVisibilityBatchResponseEntry.h"
#import "SQSBatchResponseErrorEntry.h"

#import "SQSResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "SQSBatchEntryIdsNotDistinctException.h"
#import "SQSTooManyEntriesInBatchRequestException.h"
#import "SQSInvalidBatchEntryIdException.h"
#import "SQSEmptyBatchRequestException.h"


/**
 * Change Message Visibility Batch Result
 */

@interface SQSChangeMessageVisibilityBatchResponse:SQSResponse

{
    NSMutableArray *successful;
    NSMutableArray *failed;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * A list of <a>ChangeMessageVisibilityBatchResultEntry</a>s.
 */
@property (nonatomic, retain) NSMutableArray *successful;

/**
 * A list of <a>BatchResultErrorEntry</a>s.
 */
@property (nonatomic, retain) NSMutableArray *failed;



/**
 * Returns a value from the successful array for the specified index
 */
-(SQSChangeMessageVisibilityBatchResponseEntry *)successfulObjectAtIndex:(int)index;



/**
 * Returns a value from the failed array for the specified index
 */
-(SQSBatchResponseErrorEntry *)failedObjectAtIndex:(int)index;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
