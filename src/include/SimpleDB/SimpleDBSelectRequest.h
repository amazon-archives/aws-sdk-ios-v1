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
 * Select Request
 */

@interface SimpleDBSelectRequest:AmazonServiceRequestConfig

{
    NSString *selectExpression;
    NSString *nextToken;
    bool     consistentRead;
    bool     consistentReadIsSet;
}



/**
 * The expression used to query the domain.
 */
@property (nonatomic, retain) NSString *selectExpression;

/**
 * A string informing Amazon SimpleDB where to start the next list of
 * <code>ItemNames</code>.
 */
@property (nonatomic, retain) NSString *nextToken;

/**
 * Determines whether or not strong consistency should be enforced when
 * data is read from SimpleDB. If <code>true</code>, any data previously
 * written to SimpleDB will be returned. Otherwise, results will be
 * consistent eventually, and the client may not see data that was
 * written immediately before your read.
 */
@property (nonatomic) bool           consistentRead;

@property (nonatomic, readonly) bool consistentReadIsSet;


/**
 * Default constructor for a new SelectRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new SelectRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSelectExpression The expression used to query the domain.
 */
-(id)initWithSelectExpression:(NSString *)theSelectExpression;

/**
 * Constructs a new SelectRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theSelectExpression The expression used to query the domain.
 * @param theConsistentRead Determines whether or not strong consistency
 * should be enforced when data is read from SimpleDB. If
 * <code>true</code>, any data previously written to SimpleDB will be
 * returned. Otherwise, results will be consistent eventually, and the
 * client may not see data that was written immediately before your read.
 */
-(id)initWithSelectExpression:(NSString *)theSelectExpression andConsistentRead:(bool)theConsistentRead;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
