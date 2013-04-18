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
 * List Queues Request
 */

@interface SQSListQueuesRequest:AmazonServiceRequestConfig

{
    NSString *queueNamePrefix;
}



/**
 * A string to use for filtering the list results. Only those queues
 * whose name begins with the specified string are returned.
 */
@property (nonatomic, retain) NSString *queueNamePrefix;


/**
 * Default constructor for a new ListQueuesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new ListQueuesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theQueueNamePrefix A string to use for filtering the list
 * results. Only those queues whose name begins with the specified string
 * are returned.
 */
-(id)initWithQueueNamePrefix:(NSString *)theQueueNamePrefix;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
