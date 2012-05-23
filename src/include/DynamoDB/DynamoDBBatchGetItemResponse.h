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

#import "DynamoDBBatchResponse.h"
#import "DynamoDBKeysAndAttributes.h"

#import "DynamoDBResponse.h"
#import "../AmazonServiceExceptionUnmarshaller.h"

#import "DynamoDBProvisionedThroughputExceededException.h"
#import "DynamoDBInternalServerErrorException.h"
#import "DynamoDBResourceNotFoundException.h"


/**
 * Batch Get Item Result
 */

@interface DynamoDBBatchGetItemResponse:DynamoDBResponse

{
    NSMutableDictionary *responses;
    NSMutableDictionary *unprocessedKeys;
}



-(void)setException:(AmazonServiceException *)theException;


/**
 * Default constructor for a new  object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Table names and the respective item attributes from the tables.
 */
@property (nonatomic, retain) NSMutableDictionary *responses;

/**
 * Contains a map of tables and their respective keys that were not
 * processed with the current response, possibly due to reaching a limit
 * on the response size. The <code>UnprocessedKeys</code> value is in the
 * same form as a <code>RequestItems</code> parameter (so the value can
 * be provided directly to a subsequent <code>BatchGetItem</code>
 * operation). For more information, see the above
 * <code>RequestItems</code> parameter.
 * <p>
 * <b>Constraints:</b><br/>
 * <b>Length: </b>1 - 100<br/>
 */
@property (nonatomic, retain) NSMutableDictionary *unprocessedKeys;

/**
 * Returns a value from the responses dictionary for the specified key.
 */
-(DynamoDBBatchResponse *)responsesValueForKey:(NSString *)theKey;

/**
 * Returns a value from the unprocessedKeys dictionary for the specified key.
 */
-(DynamoDBKeysAndAttributes *)unprocessedKeysValueForKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
