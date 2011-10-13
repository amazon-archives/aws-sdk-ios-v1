/*
 * Copyright 2010-2011 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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


#import "../AmazonServiceRequestConfig.h"



/**
 * Get Queue Attributes Request
 *
 * \ingroup SQS
 */

@interface SQSGetQueueAttributesRequest:AmazonServiceRequestConfig

{
    NSString       *queueUrl;
    NSMutableArray *attributeNames;
}


/**
 * The URL of the SQS queue to take action on.
 */
@property (nonatomic, retain) NSString *queueUrl;

/**
 * A list of attributes to retrieve information for. The following
 * attributes are supported: <ul> <li><code>All</code> - returns all
 * values.</li> <li><code>ApproximateNumberOfMessages</code> - returns
 * the approximate number of visible messages in a queue. For more
 * information, see Resources Required to Process Messages in the Amazon
 * SQS Developer Guide.</li>
 * <li><code>ApproximateNumberOfMessagesNotVisible</code> - returns the
 * approximate number of messages that are not timed-out and not deleted.
 * For more information, see Resources Required to Process Messages in
 * the Amazon SQS Developer Guide.</li>
 * <li><code>VisibilityTimeout</code> - returns the visibility timeout
 * for the queue. For more information about visibility timeout, see
 * Visibility Timeout in the Amazon SQS Developer Guide.</li>
 * <li><code>CreatedTimestamp</code> - returns the time when the queue
 * was created (epoch time in seconds).</li>
 * <li><code>LastModifiedTimestamp</code> - returns the time when the
 * queue was last changed (epoch time in seconds).</li>
 * <li><code>Policy</code> - returns the queue's policy.</li>
 * <li><code>MaximumMessageSize</code> - returns the limit of how many
 * bytes a message can contain before Amazon SQS rejects it.</li>
 * <li><code>MessageRetentionPeriod</code> - returns the number of
 * seconds Amazon SQS retains a message.</li> <li><code>QueueArn</code> -
 * returns the queue's Amazon resource name (ARN).</li> </ul>
 */
@property (nonatomic, retain) NSMutableArray *attributeNames;


/**
 * Default constructor for a new GetQueueAttributesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new GetQueueAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theQueueUrl The URL of the SQS queue to take action on.
 */
-(id)initWithQueueUrl:(NSString *)theQueueUrl;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
