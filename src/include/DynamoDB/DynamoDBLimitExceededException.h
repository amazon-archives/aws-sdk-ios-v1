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
#import <AWSRuntime/AmazonServiceException.h>
#else
#import "../AmazonServiceException.h"
#endif




/**
 * <p>
 * The number of concurrent table requests (cumulative number of tables
 * in the <code>CREATING</code> ,
 * <code>DELETING</code> or <code>UPDATING</code>
 * state) exceeds the maximum allowed of 10.
 * </p>
 * <p>
 * Also, for tables with a local secondary indexes, only one of those
 * tables can be in the <code>CREATING</code> state at any point in time.
 * Do not attempt to create more than one such table simultaneously.
 * </p>
 * <p>
 * The total limit of tables in the <code>ACTIVE</code> state is 250.
 * </p>
 */
@interface DynamoDBLimitExceededException:AmazonServiceException
{
}







-(id)initWithMessage:(NSString *)message;


/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
