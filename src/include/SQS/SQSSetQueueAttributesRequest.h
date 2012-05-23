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


#import "../AmazonServiceRequestConfig.h"



/**
 * Set Queue Attributes Request
 */

@interface SQSSetQueueAttributesRequest:AmazonServiceRequestConfig

{
    NSString            *queueUrl;
    NSMutableDictionary *attributes;
}



/**
 * The URL of the SQS queue to take action on.
 */
@property (nonatomic, retain) NSString *queueUrl;

/**
 * A map of attributes to set.
 */
@property (nonatomic, retain) NSMutableDictionary *attributes;


/**
 * Default constructor for a new SetQueueAttributesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new SetQueueAttributesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theQueueUrl The URL of the SQS queue to take action on.
 * @param theAttributes A map of attributes to set.
 */
-(id)initWithQueueUrl:(NSString *)theQueueUrl andAttributes:(NSMutableDictionary *)theAttributes;


/**
 * Set a value in the dictionary attributes for the specified key.
 * This function will alloc and init attributes if not already done.
 */
-(void)setAttributesValue:(NSString *)theValue forKey:(NSString *)theKey;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
